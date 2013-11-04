using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Encore.TaskManager;
using EntityFramework;
using com.Encore.Web;

public partial class user_forgotten : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtUsername.Focus();
    }

    private bool CopyFromForm()
    {
        using (var ctx = new Entities())
        {
            try
            {
                var user =
                    ctx.SYSTEMUSERs.FirstOrDefault(
                        u => u.DELETED == 0 && u.EMAIL == txtUsername.Text);

                if (user != null)
                {
                    // create audit
                    Audit.Log(ctx, AuditType.ForgottenPassword, this.Page.GetType().FullName, user.ID);

                    // TODO: send password

                    // done
                    return true;
                }
                else
                {
                   ShowMessage(MessageType.Error,"Email address not found - please check and try again");
                }
            }
            catch (Exception ex)
            {
                ExceptionLog.WriteException("User Login", ex);
                ShowExceptionMessage();
            }

            return false;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (CopyFromForm())
            {
                Response.Redirect("~/Default.aspx?password=y");
            }
        }
    }

   
}