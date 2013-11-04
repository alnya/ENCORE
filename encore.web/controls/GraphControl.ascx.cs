using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using com.Encore.Web;

namespace encore.web.controls
{
    public partial class GraphControl : System.Web.UI.UserControl
    {
        #region Private Variables

        private string _graphPath;
        private string _bgColor;
        private Unit _width;
        private Unit _height;
        private FusionChartDataSet _dataset;
        private string _dataURL = string.Empty;

        #endregion

        #region Public Variables

        ///////////////////////////////////////////////////////
        /// <summary>
        /// The path to the graph SWF
        /// </summary>
        ///////////////////////////////////////////////////////
        public FusionChartDataSet Dataset
        {
            get { return _dataset; }
            set { _dataset = value; }
        }

        ///////////////////////////////////////////////////////
        /// <summary>
        /// Raw XML data
        /// </summary>
        ///////////////////////////////////////////////////////
        public String XMLData
        {
            get
            {
                if (this.ViewState["XMLData"] != null)
                    return this.ViewState["XMLData"].ToString();
                else
                    return string.Empty;
            }
            set { this.ViewState["XMLData"] = value; }
        }

        ///////////////////////////////////////////////////////
        /// <summary>
        /// The path to the graph SWF
        /// </summary>
        ///////////////////////////////////////////////////////
        public string GraphPath
        {
            get { return _graphPath; }
            set { _graphPath = value; }
        }

        ///////////////////////////////////////////////////////
        /// <summary>
        /// The background color of the graph
        /// </summary>
        ///////////////////////////////////////////////////////
        public string BgColor
        {
            get { return _bgColor; }
            set { _bgColor = value; }
        }

        ///////////////////////////////////////////////////////
        /// <summary>
        /// The width of the graph
        /// </summary>
        ///////////////////////////////////////////////////////
        public Unit Width
        {
            get { return _width; }
            set { _width = value; }
        }

        ///////////////////////////////////////////////////////
        /// <summary>
        /// The height of the graph
        /// </summary>
        ///////////////////////////////////////////////////////
        public Unit Height
        {
            get { return _height; }
            set { _height = value; }
        }

        ///////////////////////////////////////////////////////
        /// <summary>
        /// The URL of the XML file to load
        /// </summary>
        ///////////////////////////////////////////////////////
        public string DataURL
        {
            get { return _dataURL; }
            set { _dataURL = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CreateControl();
        }

        #endregion

        /// <summary>
        /// Create the control details
        /// </summary>
        public void CreateControl()
        {
            if (!this.Visible)
                return;

            Page.ClientScript.RegisterClientScriptInclude("fusioncharts","../js/FusionCharts.js");

            if (!string.IsNullOrEmpty(XMLData) || !string.IsNullOrEmpty(DataURL))
            {
                graph.Style.Add("width", Width.Value + "px");
                graph.Style.Add("height", Height.Value + "px");
                
                var script = (string.Format("var {0}_chart = new FusionCharts('{1}','{0}','{2}','{3}','0','1');{0}_chart.setDataURL('{4}');{0}_chart.render('{5}');",
                   ClientID, GraphPath, Width.Value, Height.Value, _dataURL, graph.ClientID));

                ScriptManager.RegisterStartupScript(this, typeof(UserControl), this.ClientID, script, true);
            }
        }
    }
}