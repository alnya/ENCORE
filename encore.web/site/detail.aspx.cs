using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Encore.TaskManager;
using EntityFramework;
using com.Encore.Web;

public partial class site_detail : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindData();

        if (!IsPostBack)
        {
            CopyToForm();
        }
    }

    private void BindData()
    {
         // load record
        using (var ctx = new Entities())
        {
            var types = ctx.SITETYPEs;
            ddlSiteType.DataSource = types;
        }
    }

    private void CopyToForm()
    {

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

                var site = ctx.SITEs.FirstOrDefault(u => u.ID == id);

                if (site != null)
                {
                    ContactsList.DataURL += "?siteid=" + id;

                    btnFormButtons.EntityID = id;
                    txtSitename.Text = site.NAME;
                    txtDescription.Text = site.DESCRIPTION;
                    txtLatitude.Text = site.LATITUDE.ToString();
                    txtLongitude.Text = site.LONGITUDE.ToString();
                    btnFormButtons.ShowDelete = false;
                }
            }
            else
            {
                tab3.Visible = false;
            }
        }
    }

    private void PopulateEntity(ref SITE entity)
    {

        entity.NAME = txtSitename.Text;
        entity.DESCRIPTION = txtDescription.Text;
        entity.LATITUDE = !string.IsNullOrEmpty(txtLatitude.Text) ? decimal.Parse(txtLatitude.Text) : 0;
        entity.LONGITUDE = !string.IsNullOrEmpty(txtLongitude.Text) ? decimal.Parse(txtLongitude.Text) : 0;

        entity.GMTOFFSET = short.Parse(txtGMTOffset.Text);
        entity.ELEVATION = txtElevation.Text;
        entity.COUNTRY = txtCountry.Text;
        entity.SITETYPEID = short.Parse(ddlSiteType.Value);

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
                    var dataSource = ctx.SITEs.FirstOrDefault(u => u.ID == id);
                    PopulateEntity(ref dataSource);
                    Audit.Log(ctx, AuditType.Edit, this.Page.GetType().FullName,
                              string.Format("Site Edited. ID: {0}", dataSource.ID), LoggedInUser.ID);
                }
                else
                {
                    var dataSource = new SITE
                    {
                        CREATEDON = DateTime.Now,
                        DELETED = 0
                    };
                    PopulateEntity(ref dataSource);
                    ctx.AddToSITEs(dataSource);

                    Audit.Log(ctx, AuditType.Add, this.Page.GetType().FullName,
                              string.Format("Site Added. Name: {0}", dataSource.NAME), LoggedInUser.ID);
                }

                ctx.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                ExceptionLog.WriteException("Save Site", ex);
                ShowMessage(MessageType.Error, "There was an error saving this record");
            }
        }
        return false;
    }

    protected void btnNewContact_Click(object sender, EventArgs e)
    {
        Response.Redirect("contact.aspx?siteid=" + btnFormButtons.EntityID);
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