using System;
using System.Collections.Generic;
using System.Data.EntityClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityFramework;
using com.Encore.Web;

public partial class report_detail : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CopyToForm();
        }
    }

    private void CopyToForm()
    {
        if (Request["ID"] != null)
        {
            var id = -1;
            if (!int.TryParse(Request["ID"], out id))
            {
                ShowMessage(MessageType.Error, "There was an error loading this record");
                return;
            }

            // load record
            using (var ctx = new Entities())
            {
                var report = ctx.REPORTs.FirstOrDefault(u => u.ID == id);

                if (report != null)
                {
                    btnFormButtons.EntityID = id;

                    txtName.Text = report.NAME;
                    txtDateFrom.Text = report.REPORTDATEFROM.ToString("dd-MM-yyyy");
                    txtDateTo.Text = report.REPORTDATETO.ToString("dd-MM-yyyy");

                    btnFormButtons.ShowDelete = true;

                    // get sites
                    var sites = ctx.VWREPORTSITEs.Where(f => f.REPORTID == id);
                    foreach (var site in sites)
                    {
                        jsReportSites.SelectedItems.Add(new ListItem(site.NAME, site.ID.ToString()));
                    }

                    // get fields
                    var fields = ctx.VWREPORTFIELDs.Where(f => f.REPORTID == id);
                    foreach (var field in fields)
                    {
                        jsReportFields.SelectedItems.Add(new ListItem(field.NAME, field.ID.ToString()));
                    }
                }
            }
        }
    }

    private void PopulateEntity(ref REPORT entity)
    {
        entity.NAME = txtName.Text;
        entity.REPORTDATEFROM = DateTime.ParseExact(txtDateFrom.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture);
        entity.REPORTDATETO = DateTime.ParseExact(txtDateTo.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture);

        entity.REQUESTSTATUS = RequestStatus.New.ToString();
        entity.MODIFIEDON = DateTime.Now;
        entity.SYSTEMUSERID = LoggedInUser.ID;
    }

    private bool CopyFromForm()
    {
        var isValid = true;
        if (DateTime.ParseExact(txtDateFrom.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture) >
            DateTime.ParseExact(txtDateTo.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture))
        {
            ShowMessage(MessageType.Warning, "Your Date From date should be before your Date To date");
            isValid = false;
        }

        if (jsReportFields.SelectedItems.Count == 0)
        {
            ShowMessage(MessageType.Warning, "You have not chosen any fields - please select at least 1 field.");
            isValid = false;
        }

        if (jsReportSites.SelectedItems.Count == 0)
        {
            ShowMessage(MessageType.Warning,"You have not chosen any sites - please select at least 1 site.");
            isValid = false;
        }

        if (jsReportFields.SelectedItems.Count > 256)
        {
            ShowMessage(MessageType.Warning, "You have chosen too many fields, please select less than 256.");
            isValid = false;
        }

        if (!isValid)
        {
            return false;
        }

        using (var ctx = new Entities())
        {
            try
            {
                var dataSource = new REPORT();

                if (btnFormButtons.EntityID.HasValue)
                {
                    var id = btnFormButtons.EntityID;
                    dataSource = ctx.REPORTs.FirstOrDefault(u => u.ID == id);
                    PopulateEntity(ref dataSource);
                    Audit.Log(ctx, AuditType.Edit, this.Page.GetType().FullName,
                              string.Format("Report Edited. ID: {0}", dataSource.ID), LoggedInUser.ID);
                }
                else
                {
                    dataSource = new REPORT
                    {
                        CREATEDON = DateTime.Now,
                        DELETED = 0
                    };
                    PopulateEntity(ref dataSource);
                    ctx.AddToREPORTs(dataSource);

                    Audit.Log(ctx, AuditType.Add, this.Page.GetType().FullName,
                              string.Format("Report Added. Name: {0}", dataSource.NAME), LoggedInUser.ID);
                }

                ctx.SaveChanges();

                if (jsReportFields.ValueChanged)
                {
                    EntityExtensions.ExecuteProcedure(new EntityConnection(ctx.Connection.ConnectionString),
                    "Entities.ClearReportFields",
                    new KeyValuePair<string, object>("REPORT_ID", dataSource.ID));

                    var order = 0;
                    foreach (var item in jsReportFields.SelectedItems)
                    {
                        var reportField = new REPORTFIELD
                        {
                            REPORTID = dataSource.ID,
                            FIELDID = (short) int.Parse(item.Value),
                            FIELDORDER = (short) order
                        };
                        ctx.AddToREPORTFIELDs(reportField);
                        order++;
                    }
                }

                if (jsReportSites.ValueChanged)
                {
                    EntityExtensions.ExecuteProcedure(new EntityConnection(ctx.Connection.ConnectionString),
                    "Entities.ClearReportSites",
                    new KeyValuePair<string, object>("REPORT_ID", dataSource.ID));

                    foreach (var item in jsReportSites.SelectedItems)
                    {
                        var reportSite = new REPORTSITE {REPORTID = dataSource.ID, SITEID = (short) int.Parse(item.Value)};
                        ctx.AddToREPORTSITEs(reportSite);
                    }
                }

                if (jsReportFields.ValueChanged || jsReportSites.ValueChanged)
                {
                    ctx.SaveChanges();
                }
                return true;
            }
            catch (Exception ex)
            {
                ExceptionLog.WriteException("Save Report", ex);
                ShowMessage(MessageType.Error, "There was an error saving this record");
            }
        }
        return false;
    }

    private bool DeleteEntity()
    {
        using (var ctx = new Entities())
        {
            try
            {
                var id = btnFormButtons.EntityID;
                var dataSource = ctx.REPORTs.FirstOrDefault(u => u.ID == id);
                dataSource.DELETED = 1;

                EntityExtensions.ExecuteProcedure(new EntityConnection(ctx.Connection.ConnectionString),
                   "Entities.ClearReportFields", new KeyValuePair<string, object>("REPORT_ID", dataSource.ID));

                EntityExtensions.ExecuteProcedure(new EntityConnection(ctx.Connection.ConnectionString),
                   "Entities.ClearReportSites", new KeyValuePair<string, object>("REPORT_ID", dataSource.ID));

                Audit.Log(ctx, AuditType.Edit, this.Page.GetType().FullName,
                          string.Format("Report Marked as Deleted. ID: {0}", dataSource.ID), LoggedInUser.ID);
                ctx.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                ExceptionLog.WriteException("Delete Report", ex);
                ShowMessage(MessageType.Error, "There was an error deleting this record");
            }
        }
        return false;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (CopyFromForm())
            {
                Response.Redirect("default.aspx?saved=t");
            }
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (DeleteEntity())
        {
            Response.Redirect("default.aspx?deleted=t");
        }
    }
}