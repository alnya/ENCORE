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
            LoggedInUser = null;
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
        using (var ctx = new Entities())
        {
            try
            {
                // todo: encrypt password
                
                var user =
                    ctx.SYSTEMUSERs.FirstOrDefault(
                        u => u.DELETED == 0 && u.EMAIL == txtUsername.Text & u.PASSWORD == txtPassword.Text);

                if (user != null)
                {
                    // update
                    user.LASTLOGGEDON = DateTime.Now;

                    // audit
                    Audit.Log(ctx, AuditType.Login, this.Page.GetType().FullName, user.ID);

                    ctx.SaveChanges();

                    // save to session
                    LoggedInUser = user;

                    // done
                    return true;
                }
            }
            catch(Exception ex)
            {
                ExceptionLog.WriteException("User Login",ex);
                ShowExceptionMessage();
            }

            return false;
        }
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