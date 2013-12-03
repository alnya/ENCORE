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

        protected override void OnInit(EventArgs e)
        {
            foreach (var tab in Tabs.Where(tab => tab.Visible))
            {
                // hide the tab
                tab.CssClass = "tab_content clearfix";
                this.Controls.Add(tab);
            }

            base.OnInit(e);
        }

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
        protected override void Render(HtmlTextWriter writer)
        {
            writer.AddAttribute(HtmlTextWriterAttribute.Class, "tab_container clearfix");
            writer.RenderBeginTag(HtmlTextWriterTag.Div);

            writer.AddAttribute(HtmlTextWriterAttribute.Id, UniqueID);
            writer.AddAttribute(HtmlTextWriterAttribute.Type, "hidden");
            writer.AddAttribute(HtmlTextWriterAttribute.Name, UniqueID);
            writer.AddAttribute(HtmlTextWriterAttribute.Value, string.Empty);
            writer.RenderBeginTag(HtmlTextWriterTag.Input);
            writer.RenderEndTag();

            if (Tabs != null && Tabs.Count > 0)
            {
                writer.AddAttribute(HtmlTextWriterAttribute.Id, this.ClientID + "tabstrip");
                writer.AddAttribute(HtmlTextWriterAttribute.Class, "tabs clearfix");
                writer.RenderBeginTag(HtmlTextWriterTag.Ul);

                writer.AddAttribute(HtmlTextWriterAttribute.Id, ClientID + "_Valu");
                writer.AddAttribute(HtmlTextWriterAttribute.Type, "hidden");
                writer.AddAttribute(HtmlTextWriterAttribute.Name, ClientID + "_Valu");
                writer.AddAttribute(HtmlTextWriterAttribute.Value, SelectedTab);
                writer.RenderBeginTag(HtmlTextWriterTag.Input);
                writer.RenderEndTag();

                var tabCnt = 0;

                foreach (var tab in Tabs.Where(tab => tab.Visible))
                {
                    var selected = (SelectedTab == tab.ID || SelectedTab == tab.ClientID ||
                                    (SelectedTab == string.Empty && tabCnt == 0));

                    BuildLink(tab, selected, writer);
                    tabCnt++;
                }

                writer.RenderEndTag();
            }
            writer.RenderEndTag();

            base.RenderContents(writer);
        }  
        #endregion

        #region Private functions
        ////////////////////////////////////////////////////////////////////////////////
        /// <summary>
        /// Build the link for this page
        /// </summary>
        ////////////////////////////////////////////////////////////////////////////////
        private void BuildLink(jTab tab, bool selected, HtmlTextWriter writer)
        {
            writer.AddAttribute(HtmlTextWriterAttribute.Class, selected ? "active" : string.Empty);
            writer.RenderBeginTag(HtmlTextWriterTag.Li);

            writer.AddAttribute(HtmlTextWriterAttribute.Title, "Show this tab");
            writer.AddAttribute(HtmlTextWriterAttribute.Href, "#" + tab.ClientID);
            writer.RenderBeginTag(HtmlTextWriterTag.A);
            writer.Write(tab.Title);
            writer.RenderEndTag();
            writer.RenderEndTag();
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
