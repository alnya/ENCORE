using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Script.Serialization;
using System.Web.UI.WebControls;
using Encore.TaskManager;
using EntityFramework;
using com.Encore.Web;

public partial class project_sites : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Master.ThisPage != null)
            {
                litTitle.Text = Master.ThisPage.Title;
            }
            BindData();
        }
    }

    private void BindData()
    {
        var id = -1;
        if (Request["ID"] != null)
        {
            if (!int.TryParse(Request["ID"], out id))
            {
                ShowMessage(MessageType.Error, "There was an error loading this record");
                return;
            }
            btnFormButtons.EntityID = id;
        }
        else
        {
            Response.Redirect("default.aspx");
        }

        using (var ctx = new Entities())
        {
            // load project
            var report = ctx.PROJECTs.FirstOrDefault(u => u.ID == id);

            if (report == null)
            {
                Response.Redirect("default.aspx");
                return;
            }

            litProjectTitle.Text = report.NAME;

            var sites = ctx.SITEs.OrderBy(f => f.NAME).ToList();
            var jsonSerialiser = new JavaScriptSerializer();
            var json = jsonSerialiser.Serialize(sites.Select(f => new { ID = f.ID, Name = f.NAME }));
            fieldJSON.Text = json;

            var q = from s in ctx.PROJECTSITEs
                    where s.DELETED == 0 && s.PROJECTID == id
                    orderby s.NAME
                    select s;

            rptMatch.DataSource = q.ToList();
            rptMatch.DataBind();
        }
    }

    [System.Web.Services.WebMethod]
    public static bool SaveField(string fieldId, string encoreId)
    {
        using (var ctx = new Entities())
        {
            var iSiteId = int.Parse(fieldId);
            // load field
            var field = ctx.PROJECTSITEs.FirstOrDefault(u => u.ID == iSiteId);
            if (field != null)
            {
                if (!string.IsNullOrEmpty(encoreId))
                {
                    field.SITEID = Int16.Parse(encoreId);
                }
                else
                {
                    field.SITEID = null;
                }
                ctx.SaveChanges();
            }
        }
        return true;
    }

    protected void btnSync_Click(object sender, EventArgs e)
    {
        TaskManager task = new TaskManager();
        task.SyncProjectSites(btnFormButtons.EntityID.Value);
    }
}