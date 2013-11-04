using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Collections;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using com.Encore.Web;

public partial class controls_Breadcrumb : System.Web.UI.UserControl
{
    #region Private Variables
    protected NavigationPage _page;
    protected List<NavigationPage> _pages;
    #endregion

    #region Public Variables
    /////////////////////////////////////////////////////////////////
    /// <summary>
    /// The current page
    /// </summary>
    /////////////////////////////////////////////////////////////////
    public NavigationPage CurrentPage
    {
        get { return _page; }
        set { _page = value; }
    }

    /////////////////////////////////////////////////////////////////
    /// <summary>
    /// The page collection
    /// </summary>
    /////////////////////////////////////////////////////////////////
    public List<NavigationPage> Pages
    {
        get { return _pages; }
        set { _pages = value; }
    }
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        BuildNavigation();
    }

    #region Building Functions
    /////////////////////////////////////////////////////////////////
    /// <summary>
    /// Build the top level only
    /// </summary>
    /////////////////////////////////////////////////////////////////
    private void BuildNavigation()
    {
        BreadCrumb.Controls.Clear();

        BreadCrumb.Controls.Add(new LiteralControl("<div id='breadcrumb_wrapper'><span>You are here:</span><ul class='nav_breadcrumb'>"));

        if (Pages != null)
        {
            parsePages(Pages,0);
        }

        BreadCrumb.Controls.Add(new LiteralControl("</ul></div>"));
    }

    /// <summary>
    /// parse all pages, creating the breadcrumb
    /// </summary>
    /// <param name="pages"></param>
    /// <param name="level"></param>
    private void parsePages(List<NavigationPage> pages, int level)
    {
        foreach (NavigationPage page in pages)
        {
            if (page.Url == CurrentPage.Url)
            {
                writeLink(page, level, false);
            }
            else if (IsInChildren(CurrentPage, page.Children))
            {
                writeLink(page, level, true);
                level++;
                parsePages(page.Children, level++);
            }
        }
    }

    /// <summary>
    /// Add the page to the breadcrumb
    /// </summary>
    /// <param name="page"></param>
    /// <param name="cnt"></param>
    private void writeLink(NavigationPage page, int level, bool isLink)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("<li");
        if (page.CssClass != string.Empty)
        {
            sb.Append(" class='pg");
            sb.Append(level);
            sb.Append("'");
        }

        sb.Append(">");

        BreadCrumb.Controls.Add(new LiteralControl(sb.ToString()));

        if (isLink)
        {
            HyperLink link = new HyperLink();
            link.Text = page.Title;

            link.NavigateUrl = page.Url.Replace("~", "..");
            BreadCrumb.Controls.Add(link);
        }
        else
        {
            BreadCrumb.Controls.Add(new LiteralControl("<strong>" + page.Title + "</strong>"));
        }
    }

    /////////////////////////////////////////////////////////////////
    /// <summary>
    /// Does the current page exist in the children
    /// </summary>
    /////////////////////////////////////////////////////////////////
    private bool IsInChildren(NavigationPage thispage, List<NavigationPage> pages)
    {
        bool isinchild = false;

        foreach (NavigationPage page in pages)
        {
            if (page.Url == thispage.Url) isinchild = true;
            if (!isinchild && page.Children.Count > 0) isinchild = IsInChildren(thispage, page.Children);
        }

        return isinchild;
    }
    #endregion
}
