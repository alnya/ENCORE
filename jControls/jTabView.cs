using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Security.Permissions;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace com.Encore.jControls
{
    [ParseChildren(true),
     ToolboxData("<{0}:jTabView runat=\"server\"> </{0}:jTabView>")]
    public class jTabView : Panel, IPostBackDataHandler
    {

        #region Private Variables
        private string _selectedTab = string.Empty;
        private bool _saveSelectedTab = false;
        private string _cssClass = string.Empty;
        #endregion

        #region Public Attributes

        [PersistenceMode(PersistenceMode.InnerProperty)]
        public List<jTab> Tabs { get; set; }


        ////////////////////////////////////////////////////////////////////////////////
        /// <summary>
        /// The ID of the tab initially selected
        /// </summary>
        ////////////////////////////////////////////////////////////////////////////////
        [
        Bindable(true),
        Category("Appearance"),
        DefaultValue(""),
        Description("The ID of the initially selected tab (if blank will default to "
            + "the first tab in the list)"),
        Localizable(true)
        ]
        public string SelectedTab
        {
            get { return _selectedTab;  }
            set { _selectedTab = value; }
        }

        ////////////////////////////////////////////////////////////////////////////////
        /// <summary>
        /// Remember selected tab
        /// </summary>
        ////////////////////////////////////////////////////////////////////////////////
        [
        Bindable(true),
        Category("Appearance"),
        DefaultValue(""),
        Description("Remember selected Tab"),
        Localizable(true)
        ]
        public bool SaveSelectedTab
        {
            get { return _saveSelectedTab; }
            set { _saveSelectedTab = value; }
        }
        #endregion

        #region Render
        ////////////////////////////////////////////////////////////////////////////////
        /// <summary>
        /// Handle the PreRender event and register javascript      
        /// </summary>
        ////////////////////////////////////////////////////////////////////////////////
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            if (this.Page != null)
                this.Page.RegisterRequiresPostBack(this);
        }

        ////////////////////////////////////////////////////////////////////////////////
        /// <summary>
        /// Handle the Render event and write the controls  
        /// </summary>
        ////////////////////////////////////////////////////////////////////////////////
        protected override void  OnInit(EventArgs e)
        {
            var lit = new Literal();
            var container = new Panel {CssClass = "tab_container"};
            this.Controls.Add(container);

            // A workaround before finding a solution
            var hidden = new HiddenField {ID = UniqueID, Value = string.Empty};
            this.Controls.Add(hidden);

            var sb = new StringBuilder();

            if (Tabs != null && Tabs.Count > 0)
            {
                sb.Append(@"<ul id='");
                sb.Append(this.ClientID);
                sb.Append("tabstrip' class='tabs'><input type='hidden' name='");
                sb.Append(this.ClientID);
                sb.Append(@"_Valu' value='");
                sb.Append(SelectedTab);
                sb.Append(@"' />");

                var tabCnt = 0;

                foreach (var tab in Tabs)
                {
                    if (tab.Visible)
                    {
                        container.Controls.Add(tab);

                        // hide the tab
                        tab.CssClass = "tab_content";
                        if (SelectedTab == tab.ID || SelectedTab == tab.ClientID ||
                        (SelectedTab == string.Empty && tabCnt == 0))
                        {
                            //tab.CssClass = "active";
                            sb.Append(BuildLink(tab,true));
                        }
                        else
                            sb.Append(BuildLink(tab,false));

                        tabCnt++;
                        
                    }
                }

                sb.Append("</ul>");
            }

            lit.Text = sb.ToString();
            this.Controls.AddAt(0, lit);

            base.OnInit(e);
        }  
        #endregion

        #region Private functions
        ////////////////////////////////////////////////////////////////////////////////
        /// <summary>
        /// Build the link for this page
        /// </summary>
        ////////////////////////////////////////////////////////////////////////////////
        private string BuildLink(jTab tab, bool selected)
        {
            var sb = new StringBuilder();

            sb.Append(@"<li class='");
            if (selected) sb.Append("active");
            sb.Append("'>");

            sb.Append("<a href='#");
            sb.Append(tab.ClientID);
            sb.Append("' title='Show this tab'>");
            sb.Append(tab.Title);
            sb.Append("</a>");

            return sb.ToString();
        }

        
        #endregion

        #region IPostBackDataHandler Members

        bool IPostBackDataHandler.LoadPostData(string postDataKey, System.Collections.Specialized.NameValueCollection postCollection)
        {
            try
            {
                SelectedTab = this.Page.Request[this.ClientID + "_Value"];
            }
            catch (Exception e)
            {
                var ex = e.Message;
                return false;
            }

            return true;
        }

        void IPostBackDataHandler.RaisePostDataChangedEvent()
        {
            // new Exception("The method or operation is not implemented.");
        }

        #endregion
    }

    ////////////////////////////////////////////////////////////////////////////////////
    /// <summary>
    /// A tab, for the tabview control
    /// </summary>
    ////////////////////////////////////////////////////////////////////////////////////
    [
        AspNetHostingPermission(SecurityAction.Demand,
        Level = AspNetHostingPermissionLevel.Minimal),
        AspNetHostingPermission(SecurityAction.InheritanceDemand,
        Level = AspNetHostingPermissionLevel.Minimal),
        DefaultProperty("Title"),
        ToolboxData("<{0}:jTab runat=\"server\"> </{0}:jTab>")
    ]
    public class jTab : Panel
    {
        #region Public Attributes
        ////////////////////////////////////////////////////////////////////////////////
        /// <summary>
        /// The title for the control.
        /// </summary>
        ////////////////////////////////////////////////////////////////////////////////
        [
        Bindable(true),
        Category("Appearance"),
        DefaultValue(""),
        Description("The Title for the tab"),
        Localizable(true)
        ]
        public String Title
        {
            get
            {
                var s = (string)this.ViewState["Title"];
                return s ?? String.Empty;
            }
            set
            {
                this.ViewState["Title"] = value;
            }
        }
        #endregion
    }
}
