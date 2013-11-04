using System;
using com.Encore.Web;


public partial class report_download : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {

            Page.RegisterStartupScript("closeScript",
                                       "<script language='JavaScript'>window.top.$.closeDOMWindow();</script>");

        }
    }
}