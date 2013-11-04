using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityFramework;
using com.Encore.Web;

public partial class registration_import : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        using (var ctx = new Entities())
        {
            var projects = ctx.PROJECTs.Where(p => p.DELETED == 0).OrderBy(p => p.NAME);
            ddlPartner.DataSource = projects;
        }
    }

    private void DoImport()
    {
        // todo
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            DoImport();
            Response.Redirect("~/registration/confirm.aspx");
        }
    }
}