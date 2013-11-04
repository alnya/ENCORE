using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using com.Encore.Web;

public partial class registration_start :BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnImport_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/registration/import.aspx");
    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/registration/create.aspx");
    }
}