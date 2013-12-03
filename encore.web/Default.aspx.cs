using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Encore.TaskManager;
using EntityFramework;
using com.Encore.Web;

public partial class _Default : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtUsername.Focus();
        if (Request["logout"] != null)
        {
            var security = new EncoreSecurity();
            security.Logout();
            Response.Redirect("Default.aspx?loggedout=y");
        }
        if (Request["loggedout"]!= null)
        {
            ShowMessage(MessageType.Notice, "You have logged out");
        }
        if (Request["path"] != null)
        {
            LoggedInUser = null;
            ShowMessage(MessageType.Warning, "You are not authorized to view this page - please log in");
        }
        if (Request["password"] != null)
        {
            ShowMessage(MessageType.Success, "Your password has been emailed to your login address");
        }
    }

    /// <summary>
    /// Attempt the login
    /// </summary>
    /// <returns></returns>
    private bool Login()
    {
        var security = new EncoreSecurity();
        return security.Login(txtUsername.Text.Trim(), txtPassword.Text.Trim());
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Login())
            {
                Response.Redirect("~/page/dashboard.aspx");
            }
            else
            {
                ShowMessage(MessageType.Error, "Email address and password not found");
            }
        }
    }

    protected void btnNewAccount_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/registration/start.aspx");
    }
}