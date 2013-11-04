using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityFramework;
using com.Encore.Web;

public partial class user_mydetails : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CopyToForm();
        }
    }

    private void CopyToForm()
    {

        var user = LoggedInUser;

        if (user != null)
        {
            btnFormButtons.EntityID = user.ID;
            txtEmailAddress.Text = user.EMAIL;
            txtName.Text = user.NAME;
            txtPassword.Text = string.Empty;
            txtOrganisation.Text = user.ORGANISATION;
            txtAreaOfResearch.Text = user.AREAOFRESEARCH;
        }
    }

    private void PopulateEntity(ref SYSTEMUSER entity)
    {
        entity.EMAIL = txtEmailAddress.Text;
        if (!string.IsNullOrEmpty(txtPassword.Text))
        {
            entity.PASSWORD = txtPassword.Text;
        }
        entity.NAME = txtName.Text;
        entity.ORGANISATION = txtOrganisation.Text;
        entity.AREAOFRESEARCH = txtAreaOfResearch.Text;
        entity.URL = txtURL.Text;
        entity.TWITTER = txtTwitter.Text;
        entity.FACEBOOK = txtFacebook.Text;
        entity.LINKEDIN = txtLinkedIn.Text;
    }

    private bool CopyFromForm()
    {
        using (var ctx = new Entities())
        {
            try
            {
                var userCheck =
                    ctx.SYSTEMUSERs.FirstOrDefault(
                        u => u.EMAIL == txtEmailAddress.Text && u.ID != btnFormButtons.EntityID);

                if (userCheck != null)
                {
                    ShowMessage(MessageType.Error, "This email address is already registered");
                    return false;
                }

                var id = btnFormButtons.EntityID;
                var dataSource = ctx.SYSTEMUSERs.FirstOrDefault(u => u.ID == id);
                PopulateEntity(ref dataSource);
                Audit.Log(ctx, AuditType.Edit, this.Page.GetType().FullName,
                          string.Format("User Edited. ID: {0}", dataSource.ID), LoggedInUser.ID);


                ctx.SaveChanges();

                LoggedInUser = dataSource;

                return true;
            }
            catch (Exception ex)
            {
                ExceptionLog.WriteException("Save User", ex);
                ShowMessage(MessageType.Error, "There was an error saving this record");
            }
        }
        return false;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (CopyFromForm())
            {
                Response.Redirect("default.aspx?saved=t");
            }
        }
    }
}