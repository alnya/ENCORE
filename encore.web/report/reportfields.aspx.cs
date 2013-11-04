using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityFramework;
using com.Encore.Web;

namespace encore.web.report
{
    public partial class reportfields : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
//                BindData();
                CopyToForm();
            }
        }

        private void BindData()
        {
            using (var ctx = new Entities())
            {
                // Get projects
                var projects = ctx.PROJECTs.Where(p => p.DELETED == 0);
                ddlProject.DataSource = projects.ToList();
                ddlProject.DataBind();

                // Get groups
                var groups = ctx.FIELDGROUPs.Where(g => g.DELETED == 0);
                ddlGroup.DataSource = groups.ToList();
                ddlGroup.DataBind();
            }

        }

        private void CopyToForm()
        {

        }

        private bool CopyFromForm()
        {
            
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
}