using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityFramework;
using com.Encore.Web;

public partial class field_units : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
            CopyToForm();
        }
    }

    private void BindData()
    {
        ddlDateType.DataSource = Enum.GetNames(typeof(DataType));
    }

    private void CopyToForm()
    {
        if (Request["ID"] != null)
        {
            pnlFields.Visible = true;

            var id = -1;
            if (!int.TryParse(Request["ID"], out id))
            {
                ShowMessage(MessageType.Error, "There was an error loading this record");
                return;
            }

            // load record
            using (var ctx = new Entities())
            {
                var datasource = ctx.UNITs.FirstOrDefault(u => u.ID == id);

                if (datasource != null)
                {
                    btnFormButtons.EntityID = id;

                    txtName.Text = datasource.NAME;
                    ddlDateType.Value = datasource.DATATYPE;
                    btnFormButtons.ShowDelete = true;
                }
            }
        }
    }

    private void PopulateEntity(ref UNIT entity)
    {
        entity.NAME = txtName.Text;
        entity.DATATYPE = ddlDateType.Value;
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
                    var dataSource = ctx.UNITs.FirstOrDefault(u => u.ID == id);
                    PopulateEntity(ref dataSource);
                    Audit.Log(ctx, AuditType.Edit, this.Page.GetType().FullName,
                              string.Format("Unit Edited. ID: {0}", dataSource.ID), LoggedInUser.ID);
                }
                else
                {
                    var dataSource = new UNIT();
                    PopulateEntity(ref dataSource);
                    ctx.AddToUNITs(dataSource);

                    Audit.Log(ctx, AuditType.Add, this.Page.GetType().FullName,
                              string.Format("Unit Added: {0}", dataSource.NAME), LoggedInUser.ID);
                }

                ctx.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                ExceptionLog.WriteException("Save Unit", ex);
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
                var dataSource = ctx.UNITs.FirstOrDefault(u => u.ID == id);

                Audit.Log(ctx, AuditType.Edit, this.Page.GetType().FullName,
                          string.Format("Project Marked as Deleted. Name: {0}", dataSource.NAME), LoggedInUser.ID);

                ctx.DeleteObject(dataSource);
                
                ctx.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                ExceptionLog.WriteException("Delete Unit", ex);
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
                Response.Redirect("units.aspx?saved=t");
            }
        }
    }

    protected void btnNewUnit_Click(object sender, EventArgs e)
    {
        Response.Redirect("units.aspx?ID=0");
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (DeleteEntity())
        {
            Response.Redirect("units.aspx?deleted=t");
        }
    }
}