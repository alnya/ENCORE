using System;
using System.Collections.Generic;
using System.Linq;

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

    private List<SITE> m_sites;

    protected void rptMatch_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var select = (Controls_SelectControl)e.Item.FindControl("ddlEncoreSite");
        if (select != null)
        {
            select.DataSource = m_sites;

            var hdnID = (HiddenField) e.Item.FindControl("hdnValue");
            select.Value = hdnID.Value;
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

            m_sites = ctx.SITEs.Where(s => s.DELETED == 0).OrderBy(s => s.NAME).ToList();

            var q = from s in ctx.PROJECTSITEs
                    where s.DELETED == 0 && s.PROJECTID == id
                    orderby s.NAME
                    select s;

            rptMatch.DataSource = q.ToList();
            rptMatch.DataBind();
        }
    }

    private bool CopyFromForm()
    {
        using (var ctx = new Entities())
        {
            foreach (RepeaterItem item in rptMatch.Items)
            {
                var select = (Controls_SelectControl) item.FindControl("ddlEncoreSite");
                var id = short.Parse(((HiddenField)item.FindControl("hdnID")).Value);
                var value = (HiddenField) item.FindControl("hdnValue");
                if (select.Value != value.Value)
                {

                    var datasource = ctx.PROJECTSITEs.FirstOrDefault(s => s.ID == id);
                    if (!string.IsNullOrEmpty(select.Value))
                    {
                        datasource.SITEID = short.Parse(select.Value);
                    }
                    else
                    {
                        datasource.SITEID = null;
                    }
                }
            }

            ctx.SaveChanges();
        }
        return true;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (CopyFromForm())
            {
                Response.Redirect("detail.aspx?saved=t&id=" + btnFormButtons.EntityID);
            }
        }
    }

    protected void btnSync_Click(object sender, EventArgs e)
    {
        TaskManager task = new TaskManager();
        task.SyncProjectSites(btnFormButtons.EntityID.Value);
    }
}