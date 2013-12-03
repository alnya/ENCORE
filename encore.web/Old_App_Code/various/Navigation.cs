using System;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Web;
using System.Web.Caching;
using System.Xml;
using EntityFramework;

namespace com.Encore.Web
{
	/////////////////////////////////////////////////////////////////
	/// <summary>
	/// The website navigation
	/// </summary>
	/////////////////////////////////////////////////////////////////
	public class Navigation
	{
        string _configFile = string.Empty;

        /////////////////////////////////////////////////////////////
        /// <summary>
        /// Build new navigation collection
        /// </summary>
        /// <param name="filePath">path to config file</param>
        ///////////////////////////////////////////////////////////// 
        public Navigation(string filePath)
        {
            _configFile = filePath;
        }

		#region Get Config
		/////////////////////////////////////////////////////////////////
		/// <summary>
		/// Load the config file into Cache
		/// </summary>
		/////////////////////////////////////////////////////////////////
		public XmlDocument GetNavigationConfig(HttpContext context)
		{
			XmlTextReader tr = null;
			XmlDocument config = (XmlDocument)context.Cache["navigationConfig"];
			
			if (config == null)
			{
				config = new XmlDocument();

				try
				{
                    tr = new XmlTextReader(context.Server.MapPath(_configFile));	

					// load xml config
					config.Load(tr);

                    context.Cache.Insert("navigationConfig", config, new CacheDependency(context.Server.MapPath(_configFile)));
				}
				catch(Exception ex)
				{
					ExceptionLog.WriteException("Navigation Config", ex);
				}
				finally
				{
					tr.Close();
				}
			}

			return config;

		}
		#endregion

		#region Get Heirarchical list
		/////////////////////////////////////////////////////////////////
		/// <summary>
		/// Build a hierarchical list of navigation pages
		/// </summary>
		/////////////////////////////////////////////////////////////////
		public List<NavigationPage> GetPages(HttpContext context)
		{
			XmlDocument config = GetNavigationConfig(context);

			return ParsePages(config.SelectNodes("Pages/Page"),null);
		}

		/////////////////////////////////////////////////////////////////
		/// <summary>
		/// Parse the pages collection
		/// </summary>
		/////////////////////////////////////////////////////////////////
        private List<NavigationPage> ParsePages(XmlNodeList pageNodes, NavigationPage parent)
		{
            var pages = new List<NavigationPage>();

			foreach(XmlNode pageNode in pageNodes)
			{
				NavigationPage page = BuildNavigationPage(pageNode);
				if (parent != null) page.Parent = parent;
				
				if (pageNode.SelectNodes("Page").Count > 0)
					page.Children = ParsePages(pageNode.SelectNodes("Page"),page);

				pages.Add(page);
			}

			return pages;
		}
		#endregion

		#region Get current page
		/////////////////////////////////////////////////////////////////
		/// <summary>
		/// Get the current page object
		/// </summary>
		/////////////////////////////////////////////////////////////////
		public NavigationPage GetThisPage(HttpContext context, string url)
		{
			var config = GetNavigationConfig(context);

            var pageNode = config.SelectSingleNode("//Page[@url='" + url + "']");
			if (pageNode != null)
				return BuildNavigationPage(pageNode);

			return null;
		}
		#endregion

		#region Process page
		/////////////////////////////////////////////////////////////////
		/// <summary>
		/// Bulid the NavigationPage object from the XML Node
		/// </summary>
		/////////////////////////////////////////////////////////////////
		public NavigationPage BuildNavigationPage(XmlNode node)
		{
            var page = new NavigationPage();

			// basic attributes
			if (node.Attributes["visible"] != null)
				page.Visible = bool.Parse(node.Attributes["visible"].Value);
			if (node.Attributes["accesskey"] != null)
				page.Accesskey = node.Attributes["accesskey"].Value;
			if (node.Attributes["url"] != null)
				page.Url = node.Attributes["url"].Value;
			if (node.Attributes["title"] != null)
				page.Title = node.Attributes["title"].Value;
            if (node.Attributes["CssClass"] != null)
                page.CssClass = node.Attributes["CssClass"].Value;
			if (node.Attributes["description"] != null)
				page.Description = node.Attributes["description"].Value;
			if (node.Attributes["keywords"] != null)
				page.Keywords = node.Attributes["keywords"].Value;
			if (node.Attributes["subnav"] != null)
				page.Subnav = node.Attributes["subnav"].Value;

			if (node.ParentNode != null && node.ParentNode.Attributes.Count > 0)
				page.Parent = BuildNavigationPage(node.ParentNode);

			// Roles
            var rolenodes = node.SelectNodes("Roles/Role");
            if (rolenodes.Count > 0)
                foreach (XmlNode rolenode in rolenodes)
                {
                    page.Roles.Add(rolenode.InnerText);
                }

			return page;
		}
		#endregion
	}

	/////////////////////////////////////////////////////////////////
	/// <summary>
	/// A Navigation page
	/// </summary>
	/////////////////////////////////////////////////////////////////
	public class NavigationPage
	{
		#region private variables
		private bool visible		= true;
		private string accesskey	= string.Empty;
		private string url			= string.Empty;
		private string title		= string.Empty;
        private string cssClass     = string.Empty;
		private string description	= string.Empty;
		private string keywords		= string.Empty;
		private string subnav		= string.Empty;
		private NavigationPage parent;
		private List<NavigationPage> children;
        private List<String> roles;
		#endregion
		
		#region public variables
		/////////////////////////////////////////////////////////////////
		/// <summary>
		/// Display in navigation
		/// </summary>
		/////////////////////////////////////////////////////////////////
		public bool Visible
		{
			get {return visible;}
			set {visible = value;}
		}
		/////////////////////////////////////////////////////////////////
		/// <summary>
		/// Access key (ALT + ??)
		/// </summary>
		/////////////////////////////////////////////////////////////////
		public string Accesskey
		{
			get {return accesskey;}
			set {accesskey = value;}
		}
		/////////////////////////////////////////////////////////////////
		/// <summary>
		/// URL of the page
		/// </summary>
		/////////////////////////////////////////////////////////////////
		public string Url
		{
			get {return url;}
			set {url = value;}
		}
		/////////////////////////////////////////////////////////////////
		/// <summary>
		/// Page title
		/// </summary>
		/////////////////////////////////////////////////////////////////
		public string Title
		{
			get {return title;}
			set {title = value;}
		}
		/////////////////////////////////////////////////////////////////
		/// <summary>
		/// URL of title image
		/// </summary>
		/////////////////////////////////////////////////////////////////
        public string CssClass
		{
            get { return cssClass; }
            set { cssClass = value; }
		}
		/////////////////////////////////////////////////////////////////
		/// <summary>
		/// (optional) Description of the page
		/// </summary>
		/////////////////////////////////////////////////////////////////
		public string Description
		{
			get {return description;}
			set {description = value;}
		}
		/////////////////////////////////////////////////////////////////
		/// <summary>
		/// (optional) Keywords for the page
		/// </summary>
		/////////////////////////////////////////////////////////////////
		public string Keywords
		{
			get {return keywords;}
			set {keywords = value;}
		}
		/////////////////////////////////////////////////////////////////
		/// <summary>
		/// (optional) Subnav for the page
		/// </summary>
		/////////////////////////////////////////////////////////////////
		public string Subnav
		{
			get {return subnav;}
			set {subnav = value;}
		}
		/////////////////////////////////////////////////////////////////
		/// <summary>
		/// Parent NavigationPage object
		/// </summary>
		/////////////////////////////////////////////////////////////////
		public NavigationPage Parent
		{
			get {return parent;}
			set {parent = value;}
		}
		/////////////////////////////////////////////////////////////////
		/// <summary>
		/// Child NavigationPage objects
		/// </summary>
		/////////////////////////////////////////////////////////////////
		public List<NavigationPage> Children
		{
			get 
			{
				if (children == null) children = new List<NavigationPage>();
				return children;
			}
			set {children = value;}
		}
		/////////////////////////////////////////////////////////////////
		/// <summary>
		/// Security permissions associated with the page
		/// </summary>
		/////////////////////////////////////////////////////////////////
        public List<String> Roles
		{
			get 
			{
                if (roles == null) roles = new List<String>();
				return roles;
			}
			set {roles = value;}
		}
		#endregion

        #region Check Authorization
        /////////////////////////////////////////////////////////////////
        /// <summary>
        /// Is the page the page authorized
        /// </summary>
        /////////////////////////////////////////////////////////////////
        public bool IsAuthorized(SYSTEMUSER systemUser)
        {
            // no roles for this page - no need to authenticate
            if (this.Roles.Count == 0)
                return true;

             // user is logged in, and page has * role
            if (systemUser != null && (this.Roles.Count == 1) && this.Roles[0] == "*")
                return true;

            // check if user has specific role
            if (roles != null && systemUser != null)
            {
                if (systemUser.ADMINISTRATOR == 1)
                    return true;
            }

            return false;
        }
        #endregion
    }
}
