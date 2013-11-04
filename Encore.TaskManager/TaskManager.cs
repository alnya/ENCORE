using System;
using System.Configuration;
using System.Linq;
using Encore.DataStore.DataObjects;
using Encore.WebServices;
using EntityFramework;


namespace Encore.TaskManager
{
    public class TaskManager
    {
        /////////////////////////////////////////////////////////////
        /// <summary>
        /// Get the project's sites
        /// </summary>
        public void SyncProjectSites(int project_id)
        {
            using (var ctx = new Entities())
            {
                Audit.Log(ctx, AuditType.TaskManager, string.Format("Getting sites for project: {0}", project_id), 0);

                var project = ctx.PROJECTs.FirstOrDefault(p => p.ID == project_id);

                var project_sites = ctx.PROJECTSITEs.Where(s => s.PROJECTID == project_id).ToList();
                    
                // call API and get summary
                var client = new encoreSoapClient("encoreSoap", project.APIURL);

                client.BeginGetSites(
                    result =>
                        {
                            var response = client.EndGetSites(result);
                            using (var entities = new Entities())
                            {
                                // sync project sites
                                foreach (var site in response)
                                {
                                    var project_site =
                                        project_sites.FirstOrDefault(s => s.SOURCEID == site.ID.ToString());
                                    if (project_site == null)
                                    {
                                        entities.AddToPROJECTSITEs(new PROJECTSITE
                                        {
                                            SOURCEID = site.ID.ToString(),
                                            NAME = site.Name,
                                            CREATEDON = DateTime.Now,
                                            PROJECTID = project.ID,
                                            DELETED = 0
                                        });
                                    }
                                }

                                entities.SaveChanges();
                            }
                        }, 
                    null
                );

                ctx.SaveChanges();
            }
        }

        /////////////////////////////////////////////////////////////
        /// <summary>
        /// Get the project's fields
        /// </summary>
        public void SyncProjectFields(int project_id)
        {
            using (var ctx = new Entities())
            {

                Audit.Log(ctx, AuditType.TaskManager, string.Format("Getting fields for project: {0}", project_id), 0);

                var project = ctx.PROJECTs.FirstOrDefault(p => p.ID == project_id);
                var project_fields = ctx.PROJECTFIELDs.Where(s => s.PROJECTID == project_id).ToList();

                // call API and get summary
                var client = new encoreSoapClient("encoreSoap", project.APIURL);

                client.BeginGetFields(
                    result =>
                    {
                        var response = client.EndGetFields(result);
                        using (var entities = new Entities())
                        {
                            // sync project sites
                            foreach (var field in response)
                            {
                                var project_field = project_fields.FirstOrDefault(s => s.SOURCEID == field.ID.ToString());
                                if (project_field == null)
                                {
                                    entities.AddToPROJECTFIELDs(new PROJECTFIELD
                                                               {
                                                                   SOURCEID = field.ID.ToString(),
                                                                   NAME = field.Name,
                                                                   CREATEDON = DateTime.Now,
                                                                   PROJECTID = project.ID,
                                                                   DELETED = 0,
                                                                   UNIT = field.Unit
                                                               });
                                }
                            }

                            entities.SaveChanges();
                        }
                    },
                    null
                );

                ctx.SaveChanges();
            }
        }

        /////////////////////////////////////////////////////////////
        /// <summary>
        /// Check all projects and get latest summary data
        /// </summary>
        public void SyncProjectSummaries()
        {
            using (var ctx = new Entities())
            {
                Audit.Log(ctx, AuditType.TaskManager, string.Format("Getting project summaries"), 0);

                var projects = ctx.PROJECTs.Where(p => p.DELETED == 0 && !string.IsNullOrEmpty(p.APIURL));

                foreach (var project in projects)
                {
                    // call API and get summary
                    var client = new encoreSoapClient("encoreSoap", project.APIURL);

                    client.BeginGetSummary(
                        result =>
                            {
                                var response = client.EndGetSummary(result);

                                using (var entities = new Entities())
                                {
                                    foreach (var item in response)
                                    {
                                        foreach (var field in item.NumberOfRows)
                                        {
                                            var currentSummary = entities.PROJECTSITESUMMARies.FirstOrDefault(
                                                s => s.PROJECTID == project.ID && s.FIELDID == field.FieldID &&
                                                     s.SITEID == item.SiteID);

                                            if (currentSummary != null)
                                            {
                                                currentSummary.VALUEMAXDATE = item.MaxDate;
                                                currentSummary.VALUEMINDATE = item.MinDate;
                                                currentSummary.ROWCOUNT = string.IsNullOrEmpty(field.Value)
                                                                              ? (short) 0
                                                                              : (short)
                                                                                (int.Parse(field.Value));
                                                currentSummary.MODIFIEDON = DateTime.Now;
                                            }
                                            else
                                            {
                                                entities.AddToPROJECTSITESUMMARies(
                                                    new PROJECTSITESUMMARY
                                                        {
                                                            CREATEDON = DateTime.Now,
                                                            SITEID = (short) item.SiteID,
                                                            PROJECTID = project.ID,
                                                            VALUEMAXDATE = item.MaxDate,
                                                            VALUEMINDATE = item.MinDate,
                                                            FIELDID = (short) field.FieldID,
                                                            ROWCOUNT =
                                                                string.IsNullOrEmpty(field.Value)
                                                                    ? (short) 0
                                                                    : (short)
                                                                      (int.Parse(field.Value)),
                                                            MODIFIEDON = DateTime.Now
                                                        });
                                            }
                                        }
                                    }

                                    entities.SaveChanges();
                                }
                            },
                        null
                        );
                }
            }
        }

        /////////////////////////////////////////////////////////////
        /// <summary>
        /// Check current report queue and request and report data 
        /// </summary>
        public void ProcessReportQueue()
        {
            using (var ctx = new Entities())
            {
                var process_status = RequestStatus.Pending.ToString();

                var tasks = ctx.REPORTPROJECTREQUESTs.Where(r => r.STATUS == process_status).ToList();

                foreach (var task in tasks)
                {
                    Audit.Log(ctx, AuditType.TaskManager, string.Format("Getting data for task {0}", task.ID), 0);

                    var task_id = task.ID;
                    task.STATUS = RequestStatus.InProgress.ToString();

                    // get report
                    var report = ctx.REPORTs.FirstOrDefault(r => r.ID == task.REPORTID);
                    report.REQUESTSTATUS = RequestStatus.InProgress.ToString();
                    ctx.SaveChanges();

                    var report_id = report.ID;

                    // get project
                    var project = ctx.PROJECTs.FirstOrDefault(p => p.ID == task.PROJECTID);

                    // get fields
                    var report_field_ids = ctx.VWREPORTFIELDs.Where(u => u.REPORTID == task.REPORTID).Select(u => u.ID).ToList();
                    
                    var project_fields = ctx.PROJECTFIELDs.Where(f => f.PROJECTID == project.ID && report_field_ids.Contains(f.FIELDID.Value));
                    
                    // get sites
                    var report_site_ids = ctx.VWREPORTSITEs.Where(u => u.REPORTID == task.REPORTID).Select(u => u.ID).ToList();
                    
                    var project_sites = ctx.PROJECTSITEs.Where(s => s.PROJECTID == project.ID && report_site_ids.Contains(s.SITEID.Value));

                    // call API and get data
                    var client = new encoreSoapClient("encoreSoap", project.APIURL);

                    var data_store = new DataStore.DataStore(ConfigurationSettings.AppSettings["datastore_path"]);

                    try
                    {
                        var project_field_source_ids = project_fields.Select(f => f.SOURCEID).ToList();
                        var project_sites_source_ids = project_sites.Select(s => s.SOURCEID).ToList();

                    client.BeginGetData(
                        project_field_source_ids.Select(int.Parse).ToArray(),
                        project_sites_source_ids.Select(int.Parse).ToArray(),
                        report.REPORTDATEFROM,
                        report.REPORTDATETO,
                        result =>
                            {
                                var response = client.EndGetData(result);

                                //  populate data store
                                var data_rows = response.Rows.Select(row => new DataRow
                                {
                                    ReportID = report_id,
                                    RowDateTime = row.RowDate,
                                    SiteID = row.SiteID,
                                    Fields = row.Values.Select(r => r.FieldID).ToList(),
                                    Values = row.Values.Select(r => r.Value).ToList()
                                }).ToList();

                                data_store.Store(data_rows);

                                 using (var entities = new Entities())
                                 {
                                     var this_task = entities.REPORTPROJECTREQUESTs.FirstOrDefault(r => r.ID == task_id);
                                     this_task.STATUS = RequestStatus.Complete.ToString();
                                     entities.SaveChanges();

                                     // check tasks for report
                                     var report_tasks = entities.REPORTPROJECTREQUESTs.Where(r => r.REPORTID == task.REPORTID).ToList();

                                     if (report_tasks.All(r => r.STATUS == RequestStatus.Complete.ToString()))
                                     {
                                         var this_report = entities.REPORTs.FirstOrDefault(r => r.ID == this_task.REPORTID);
                                         this_report.REQUESTSTATUS = RequestStatus.Complete.ToString();
                                     }
                                     entities.SaveChanges();
                                 }
                            },
                        null
                        );
                    }
                    catch (Exception ex)
                    {
                        task.STATUS = RequestStatus.Failed.ToString();
                        Audit.Log(ctx, AuditType.TaskManager, string.Format("Get Data for task {0} failed with exception: {1}", task.ID, ex.Message), 0);
                        ctx.SaveChanges();
                    }
                }
            }
        }

        private void ProcessDataRequest(IAsyncResult result)
        {}
    }
}
