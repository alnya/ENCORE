using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using com.Encore.Web;

public partial class field_default : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnManageFields_Click(object sender, EventArgs e)
    {
        Response.Redirect("units.aspx");
    }
    protected void btnManageGroups_Click(object sender, EventArgs e)
    {
        Response.Redirect("groups.aspx");
    }
}