using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityFramework;
using com.Encore.Web;

public partial class project_fields : BasePage
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

            var q = from s in ctx.PROJECTFIELDs
                    where s.DELETED == 0 && s.PROJECTID == id
                    orderby s.NAME
                    select s;

            rptMatch.DataSource = q.ToList();
            rptMatch.DataBind();
        }
    }
}