using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityFramework;
using com.Encore.Web;

public partial class user_detail : BasePage
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
        var yesNoOptions = new List<string>{"Yes","No"};
        ddlAdministrator.DataSource = yesNoOptions;

        if (Request["ID"]!= null)
        {
            var id = -1;
            if (!int.TryParse(Request["ID"], out id))
            {
                ShowMessage(MessageType.Error, "There was an error loading this record");
                return;
            }

            // load record
            using (var ctx = new Entities())
            {
                var user = ctx.SYSTEMUSERs.FirstOrDefault(u => u.ID == id);

                if (user != null)
                {
                    btnFormButtons.EntityID = id;
                    txtEmailAddress.Text = user.EMAIL;
                    txtName.Text = user.NAME;
                    txtPassword.Text = string.Empty;
                    txtOrganisation.Text = user.ORGANISATION;
                    txtAreaOfResearch.Text = user.AREAOFRESEARCH;
                    ddlAdministrator.Value = user.ADMINISTRATOR == 1 ? "Yes" : "No";
                    btnFormButtons.ShowDelete = true;
                }
            }
        }
        else
        {
            txtPassword.Required = true; // new user, need password
            ddlAdministrator.Value = "No";
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
        entity.ADMINISTRATOR = ddlAdministrator.Value == "Yes" ? (short)1 : (short)0;
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

                if (btnFormButtons.EntityID.HasValue)
                {
                    var id = btnFormButtons.EntityID;
                    var dataSource = ctx.SYSTEMUSERs.FirstOrDefault(u => u.ID == id);
                    PopulateEntity(ref dataSource);
                    Audit.Log(ctx, AuditType.Edit, this.Page.GetType().FullName,
                              string.Format("User Edited. ID: {0}", dataSource.ID), LoggedInUser.ID);
                }
                else
                {
                    var dataSource = new SYSTEMUSER
                    {
                        CREATEDON = DateTime.Now,
                        DELETED = 0,
                        LASTLOGGEDON = DateTime.Now
                    };
                    PopulateEntity(ref dataSource);
                    ctx.AddToSYSTEMUSERs(dataSource);

                    Audit.Log(ctx, AuditType.Add, this.Page.GetType().FullName,
                              string.Format("User Added. Email: {0}", dataSource.EMAIL), LoggedInUser.ID);
                }

                ctx.SaveChanges();

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

    private bool DeleteEntity()
    {
        using (var ctx = new Entities())
        {
            try
            {
                var id = btnFormButtons.EntityID;
                var dataSource = ctx.SYSTEMUSERs.FirstOrDefault(u => u.ID == id);
                dataSource.DELETED = 1;

                Audit.Log(ctx, AuditType.Edit, this.Page.GetType().FullName,
                          string.Format("User Marked as Deleted. ID: {0}", dataSource.ID), LoggedInUser.ID);
                ctx.SaveChanges();

                return true;
            }
            catch(Exception ex)
            {
                ExceptionLog.WriteException("Delete User", ex);
                ShowMessage(MessageType.Error, "There was an error deleting this record");
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

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (DeleteEntity())
        {
            Response.Redirect("default.aspx?deleted=t");
        }
    }
}