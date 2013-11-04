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

public partial class controls_PrimaryNavigation : System.Web.UI.UserControl
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
        PrimaryNavigation.Controls.Clear();

        PrimaryNavigation.Controls.Add(new LiteralControl("<ul id='navigation' class='clearfix'>"));

        if (Pages != null)
        {
            foreach (NavigationPage page in Pages)
            {
                if (page.Visible && page.IsAuthorized())
                {
                    var sb = new StringBuilder();
                    sb.Append("<li");
                    if (page.Url == CurrentPage.Url || IsInChildren(CurrentPage, page.Children))
                    {
                        sb.Append(" class='selected'");
                    }

                    sb.Append(">");

                    PrimaryNavigation.Controls.Add(new LiteralControl(sb.ToString()));

                    var link = new HyperLink {Text = page.Title, NavigateUrl = page.Url.Replace("~", "..")};

                    PrimaryNavigation.Controls.Add(link);

                    // any sub children
                    PrimaryNavigation.Controls.Add(new LiteralControl(GetSubChildren(page.Children)));
                }
            }
        }

        PrimaryNavigation.Controls.Add(new LiteralControl("</ul>"));
    }

    private string GetSubChildren(List<NavigationPage> list)
    {
        var sb = new StringBuilder();

        foreach (var page in list)
        {
            if (page.Visible &&
                page.IsAuthorized() && 
                page.Subnav != string.Empty)
            {
                sb.Append("<li");
                if (page.CssClass != string.Empty)
                {
                    sb.Append(" class='");
                    sb.Append(page.CssClass);
                    sb.Append("'");
                }

                sb.Append("><a href='");
                sb.Append(page.Url.Replace("~", ".."));
                sb.Append("'>");
                sb.Append(page.Title);
                sb.Append("</a></li>");
            }
        }

        if (sb.Length > 0)
        {
            sb.Insert(0, "<ul class='nav_sub'>");
            sb.Append("</ul>");
        }

        return sb.ToString();
    }

    /////////////////////////////////////////////////////////////////
    /// <summary>
    /// Does the current page exist in the children
    /// </summary>
    /////////////////////////////////////////////////////////////////
    private bool IsInChildren(NavigationPage thispage, List<NavigationPage> pages)
    {
        var isinchild = false;
        if (pages == null)
            return false;

        foreach (var page in pages)
        {
            if (page.Url == thispage.Url) isinchild = true;
            if (!isinchild && page.Children.Count > 0) isinchild = IsInChildren(thispage, page.Children);
        }

        return isinchild;
    }
    #endregion
}
