using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Encore.TaskManager;
using EntityFramework;
using com.Encore.Web;

public partial class site_contact : BasePage
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
        if (Request["siteid"] != null)
        {
            hdnSiteId.Value = Request["siteid"];
        }

        // load record
        using (var ctx = new Entities())
        {
            if (Request["ID"] != null)
            {
                var id = -1;
                if (!int.TryParse(Request["ID"], out id))
                {
                    ShowMessage(MessageType.Error, "There was an error loading this record");
                    return;
                }

                var contact = ctx.SITECONTACTs.FirstOrDefault(u => u.ID == id);

                if (contact != null)
                {
                    btnFormButtons.EntityID = id;
                    txtEmailAddress.Text = contact.EMAIL;
                    txtPhone.Text = contact.PHONE;
                    txtName.Text = contact.NAME.ToString();
                    btnFormButtons.ShowDelete = false;
                    hdnSiteId.Value = contact.SITEID.ToString();
                }
            }
        }
    }

    private void PopulateEntity(ref SITECONTACT entity)
    {
        entity.SITEID = short.Parse(hdnSiteId.Value);
        entity.NAME = txtName.Text;
        entity.PHONE = txtPhone.Text;
        entity.EMAIL = txtEmailAddress.Text;
    }

    private bool CopyFromForm()
    {
        using (var ctx = new Entities())
        {
            try
            {
                if (btnFormButtons.EntityID.HasValue)
                {
                    var id = btnFormButtons.EntityID;
                    var dataSource = ctx.SITECONTACTs.FirstOrDefault(u => u.ID == id);
                    PopulateEntity(ref dataSource);
                    Audit.Log(ctx, AuditType.Edit, this.Page.GetType().FullName,
                              string.Format("Site Contact Edited. ID: {0}", dataSource.ID), LoggedInUser.ID);
                }
                else
                {
                    var dataSource = new SITECONTACT();
                    PopulateEntity(ref dataSource);
                    ctx.AddToSITECONTACTs(dataSource);

                    Audit.Log(ctx, AuditType.Add, this.Page.GetType().FullName,
                              string.Format("Site Contact Added. Name: {0}", dataSource.NAME), LoggedInUser.ID);
                }

                ctx.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                ExceptionLog.WriteException("Save Site Contact", ex);
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
                Response.Redirect(string.Format("detail.aspx?saved=t&ID={0}", hdnSiteId.Value));
            }
        }
    }
}