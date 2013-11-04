using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityFramework;
using com.Encore.Web;

public partial class master_global : System.Web.UI.MasterPage
{
    private readonly Navigation _navConfig = new Navigation("~/page.config");
    private NavigationPage _thispage;

    /////////////////////////////////////////////////////////////////
    /// <summary>
    /// The URL Of the page
    /// </summary>
    /////////////////////////////////////////////////////////////////
    public string ThisURL
    {
        get
        {
            return this.Request.AppRelativeCurrentExecutionFilePath;
        }
    }

    /// <summary>
    /// The Current Logged In User
    /// </summary>
    public SYSTEMUSER LoggedInUser
    {
        get
        {
            if (HttpContext.Current.Session["user"] != null)
                return (SYSTEMUSER)HttpContext.Current.Session["user"];
            return null;
        }
        set { HttpContext.Current.Session["user"] = value; }
    }

    /////////////////////////////////////////////////////////////////
    /// <summary>
    /// The Navigation Page Object
    /// </summary>
    /////////////////////////////////////////////////////////////////
    public NavigationPage ThisPage
    {
        get { return _thispage ?? (_thispage = _navConfig.GetThisPage(Context, ThisURL)); }
    }

    #region Init
    ///////////////////////////////////////////////////////////////////////////
    /// <summary>
    /// Check for any confirmation messages required
    /// </summary>
    ///////////////////////////////////////////////////////////////////////////
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request["saved"] != null)
            {
               if (this.Page is BasePage)
               {
                   ((BasePage)this.Page).ShowMessage(MessageType.Success,"Record has been saved successfully");
               }
            }
            if (Request["deleted"] != null)
            {
                if (this.Page is BasePage)
                {
                    ((BasePage)this.Page).ShowMessage(MessageType.Success, "Record has been deleted successfully");
                }
            }
        }
    }

    ///////////////////////////////////////////////////////////////////////////
    /// <summary>
    /// Initialize page and check authorization
    /// </summary>
    ///////////////////////////////////////////////////////////////////////////
    protected override void OnInit(EventArgs e)
    {
        PrimaryNavigation.Pages = _navConfig.GetPages(Context);
        PrimaryNavigation.CurrentPage = ThisPage;

        //BreadcrumbNavigation.Pages = _navConfig.GetPages(Context);
        //BreadcrumbNavigation.CurrentPage = ThisPage;
        
        SetupMetaData();
       
        CheckPageIsAuthorized();

        base.OnInit(e);
    }
    #endregion

    protected override void Render(HtmlTextWriter writer)
    {
        const string validatorOverrideScripts = "<script src=\"/encore/js/validators.js\" type=\"text/javascript\"></script>";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "ValidatorOverrideScripts", validatorOverrideScripts, false);
        base.Render(writer);
    }

    /////////////////////////////////////////////////////////////////
    /// <summary>
    /// Add keywords, title, description
    /// </summary>
    /////////////////////////////////////////////////////////////////
    private void SetupMetaData()
    {
        if (ThisPage != null)
        {
            this.Head1.Title = ThisPage.Title + " - ENCORE";
        }
    }

    ///////////////////////////////////////////////////////////////////////////
    /// <summary>
    /// Check that this page is authorized for view
    /// </summary>
    ///////////////////////////////////////////////////////////////////////////
    private void CheckPageIsAuthorized()
    {
        if (LoggedInUser != null)
        {
            lnkLogout.Visible = true;
            lnkLogout.Text += " " + LoggedInUser.NAME;
        }

        var refererPath = this.Request.AppRelativeCurrentExecutionFilePath;
        if (Request["ID"] != null)
        {
            refererPath += "&ID=" + Request["ID"];
        }

        //if (ThisPage != null && !ThisPage.IsAuthorized())
        //    Response.Redirect("~/default.aspx?path=" + refererPath);
    }
}
