using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityFramework;
using com.Encore.Web;

public partial class project_addsite : System.Web.UI.Page
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
        if (Request["name"] != null)
        {
            txtSitename.Text = Request["name"];
        }
    }

    private bool CopyFromForm()
    {
        using (var ctx = new Entities())
        {
            try
            {
                var dataSource = new SITE
                                     {
                                         NAME = txtSitename.Text,
                                         DESCRIPTION = txtDescription.Text,
                                         CREATEDON = DateTime.Now,
                                         MODIFIEDON = DateTime.Now,
                                         DELETED = 0
                                     };


                ctx.AddToSITEs(dataSource);

                ctx.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                ExceptionLog.WriteException("Save Site", ex);
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
                Page.RegisterStartupScript("closeScript", "<script language='JavaScript'>window.top.$.closeDOMWindow();</script>");
            }
        }
    }
}