using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityFramework;
using com.Encore.Web;

public partial class report_default : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            hdnUserID.Value = LoggedInUser.ID.ToString();
        }
    }

    protected void btnNewAccount_Click(object sender, EventArgs e)
    {
        Response.Redirect("detail.aspx");
    }
}