using System;
using System.Collections.Generic;
using System.Data.EntityClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Encore.TaskManager;
using EntityFramework;
using com.Encore.Web;

public partial class field_group : BasePage
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
                var group = ctx.FIELDGROUPs.FirstOrDefault(u => u.ID == id);

                if (group != null)
                {
                    btnFormButtons.EntityID = id;
                    txtName.Text = group.NAME;

                    // get fields
                    var fields = ctx.VWFIELDGROUPFIELDs.Where(f => f.FIELDGROUPID == id);
                    foreach (var vwfieldgroupfield in fields)
                    {
                        jsGroupFields.SelectedItems.Add(new ListItem(vwfieldgroupfield.NAME,
                                                                     vwfieldgroupfield.ID.ToString()));
                    }

                    btnFormButtons.ShowDelete = true;
                }
            }
        }
    }

    private void PopulateEntity(ref FIELDGROUP entity)
    {
        entity.NAME = txtName.Text;
        entity.MODIFIEDON = DateTime.Now;
    }

    private bool CopyFromForm()
    {
        using (var ctx = new Entities())
        {
            try
            {
                var dataSource = new FIELDGROUP();

                if (btnFormButtons.EntityID.HasValue)
                {
                    var id = btnFormButtons.EntityID;
                    dataSource = ctx.FIELDGROUPs.FirstOrDefault(u => u.ID == id);
                    PopulateEntity(ref dataSource);
                    Audit.Log(ctx, AuditType.Edit, this.Page.GetType().FullName,
                              string.Format("Group Edited. ID: {0}", dataSource.ID), LoggedInUser.ID);
                }
                else
                {
                    dataSource = new FIELDGROUP {CREATEDON = DateTime.Now};
                    PopulateEntity(ref dataSource);
                    ctx.AddToFIELDGROUPs(dataSource);

                    Audit.Log(ctx, AuditType.Add, this.Page.GetType().FullName,
                              string.Format("Group Added: {0}", dataSource.NAME), LoggedInUser.ID);
                }

                ctx.SaveChanges();
                
                // delete fields
                EntityExtensions.ExecuteProcedure(new EntityConnection(ctx.Connection.ConnectionString), 
                    "Entities.ClearGroupFields", new KeyValuePair<string, object>("GROUP_ID", dataSource.ID));

                // save fields
                foreach (var item in jsGroupFields.SelectedItems)
                {
                    var groupField = new FIELDGROUPFIELD {FIELDGROUPID = dataSource.ID, FIELDID = (short)int.Parse(item.Value)};
                    ctx.AddToFIELDGROUPFIELDs(groupField);
                }

                ctx.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                ExceptionLog.WriteException("Save Group", ex);
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
                var dataSource = ctx.FIELDGROUPs.FirstOrDefault(u => u.ID == id);

                Audit.Log(ctx, AuditType.Edit, this.Page.GetType().FullName,
                          string.Format("Field Group Deleted. Name: {0}", dataSource.NAME), LoggedInUser.ID);

                ctx.DeleteObject(dataSource);
                ctx.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                ExceptionLog.WriteException("Delete Group", ex);
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
                Response.Redirect("groups.aspx?saved=t");
            }
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (DeleteEntity())
        {
            Response.Redirect("groups.aspx?deleted=t");
        }
    }
}