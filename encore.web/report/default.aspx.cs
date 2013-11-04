using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using Encore.TaskManager;
using EntityFramework;
using com.Encore.Web;

public partial class report_default : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (LoggedInUser != null)
            {
                hdnUserID.Value = LoggedInUser.ID.ToString();
            }
        }
    }

    protected void btnNewAccount_Click(object sender, EventArgs e)
    {
        Response.Redirect("detail.aspx");
    }

    /////////////////////////////////////////////////////////////////
    /// <summary>
    /// 
    /// </summary>
    protected void btnGetData_Click(object sender, EventArgs e)
    {
        using (var ctx = new Entities())
        {
            ((Button) sender).Visible = false;

            int report_id = short.Parse(((Button) sender).CommandArgument);
            // get report
            var report = ctx.REPORTs.FirstOrDefault(u => u.ID == report_id);
            List<short> report_field_ids = ctx.REPORTFIELDs.Where(f => f.REPORTID == report.ID).Select(f => f.FIELDID).ToList();
            var project_fields = ctx.PROJECTFIELDs.Where(p => report_field_ids.Contains(p.FIELDID.Value)).ToList();

            // create request
            var pid = -1;
            foreach (var project_field in project_fields)
            {
                if (pid != project_field.PROJECTID)
                {
                    pid = project_field.PROJECTID;
                    ctx.AddToREPORTPROJECTREQUESTs(
                        new REPORTPROJECTREQUEST
                            {
                                PROJECTID = project_field.PROJECTID,
                                CREATEDON = DateTime.Now,
                                REPORTID = report.ID,
                                STATUS = RequestStatus.Pending.ToString()
                            });
                }
            }

            // update report status
            report.REQUESTSTATUS = RequestStatus.Pending.ToString();

            ctx.SaveChanges();

           ShowMessage(MessageType.Success, "Data has been requested successfully");
        }
    }
}