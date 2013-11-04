using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Encore.TaskManager;
using EntityFramework;
using com.Encore.Web;

public partial class registration_create : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private bool CopyFromForm()
    {
        using (var ctx = new Entities())
        {
            if (txtPassword.Text != txtPasswordConfirm.Text)
            {
                ShowMessage(MessageType.Error, "Passwords do not match");
                return false;
            }
            var user = ctx.SYSTEMUSERs.FirstOrDefault(u => u.DELETED == 0 && u.EMAIL == txtEmailAddress.Text);

            if (user != null)
            {
                ShowMessage(MessageType.Error, "This email address is already registered");
                return false;
            }

            var dataSource = new SYSTEMUSER
            {
                EMAIL = txtEmailAddress.Text,
                PASSWORD = txtPassword.Text,
                NAME = txtName.Text,
                ORGANISATION = txtOrganisation.Text,
                AREAOFRESEARCH = txtAreaOfResearch.Text,
                CREATEDON = DateTime.Now,
                DELETED = 0,
                LASTLOGGEDON = DateTime.Now
            };

            ctx.AddToSYSTEMUSERs(dataSource);

            Audit.Log(ctx, AuditType.Add, this.Page.GetType().FullName,
                string.Format("New User Registered. Email: {0}",dataSource.EMAIL),
                dataSource.ID);

            ctx.SaveChanges();

            return true;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (CopyFromForm())
            {
                Response.Redirect("~/registration/confirm.aspx");
            }
        }
    }
}