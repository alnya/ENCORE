using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityFramework;
using com.Encore.Web;

public partial class project_detail : BasePage
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
        if (Request["ID"] != null)
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
                var project = ctx.PROJECTs.FirstOrDefault(u => u.ID == id);

                if (project != null)
                {
                    btnFormButtons.EntityID = id;
                    
                    txtName.Text = project.NAME;
                    txtDescription.Text = project.DESCRIPTION;
                    txtTerms.Text = project.TERMS;
                    txtURL.Text = project.APIURL;
                    btnFormButtons.ShowDelete = true;

                    btnManageFields.Visible = true;
                    btnManageSites.Visible = true;
                }
            }
        }
    }

    private void PopulateEntity(ref PROJECT entity)
    {
        entity.NAME = txtName.Text;
        entity.DESCRIPTION = txtDescription.Text;
        entity.APIURL = txtURL.Text;
        entity.TERMS = txtTerms.Text;
        entity.MODIFIEDON = DateTime.Now;
        entity.SYSTEMUSERID = LoggedInUser.ID;
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
                    var dataSource = ctx.PROJECTs.FirstOrDefault(u => u.ID == id);
                    PopulateEntity(ref dataSource);
                    Audit.Log(ctx, AuditType.Edit, this.Page.GetType().FullName,
                              string.Format("Project Edited. ID: {0}", dataSource.ID), LoggedInUser.ID);
                }
                else
                {
                    var dataSource = new PROJECT
                    {
                        CREATEDON = DateTime.Now,
                        DELETED = 0
                    };
                    PopulateEntity(ref dataSource);
                    ctx.AddToPROJECTs(dataSource);

                    Audit.Log(ctx, AuditType.Add, this.Page.GetType().FullName,
                              string.Format("Project Added. Name: {0}", dataSource.NAME), LoggedInUser.ID);
                }

                ctx.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                ExceptionLog.WriteException("Save Project", ex);
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
                var dataSource = ctx.PROJECTs.FirstOrDefault(u => u.ID == id);
                dataSource.DELETED = 1;

                Audit.Log(ctx, AuditType.Edit, this.Page.GetType().FullName,
                          string.Format("Project Marked as Deleted. ID: {0}", dataSource.ID), LoggedInUser.ID);
                ctx.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                ExceptionLog.WriteException("Delete Project", ex);
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

    protected void btnManageFields_Click(object sender, EventArgs e)
    {
        Response.Redirect("fields.aspx?ID=" + btnFormButtons.EntityID);
    }
    protected void btnManageSites_Click(object sender, EventArgs e)
    {
        Response.Redirect("sites.aspx?ID=" + btnFormButtons.EntityID);
    }
}