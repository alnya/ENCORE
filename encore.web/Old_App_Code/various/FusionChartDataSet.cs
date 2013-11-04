using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Web.UI.WebControls;
using System.Xml;

namespace com.Encore.Web
{
    public class FusionChartDataSet
    {
        #region private variables
        private string _caption = string.Empty;
        private string _subcaption = string.Empty;
        private string _xname = string.Empty;
        private string _yname = string.Empty;
        private bool _compressedDataFormat = false;
        private bool _ms = false;
        private List<FusionChartDataCollection> coll = new List<FusionChartDataCollection>();
        private List<ListItem> attributes = new List<ListItem>();
        #endregion

        #region Colors
        private static string[] colors = new string[14];
        #endregion

        #region public variables
        ///////////////////////////////////////////////////////
        /// <summary>
        /// The caption of the graph
        /// </summary>
        ///////////////////////////////////////////////////////
        public string Caption
        {
            get { return _caption; }
            set { _caption = value; }
        }

        ///////////////////////////////////////////////////////
        /// <summary>
        /// Does the graph contain multiple data sets
        /// </summary>
        ///////////////////////////////////////////////////////
        public bool MultiSeries
        {
            get { return _ms; }
            set { _ms = value; }
        }

        ///////////////////////////////////////////////////////
        /// <summary>
        /// The subcaption of the graph
        /// </summary>
        ///////////////////////////////////////////////////////
        public string Subcaption
        {
            get { return _subcaption; }
            set { _subcaption = value; }
        }

        ///////////////////////////////////////////////////////
        /// <summary>
        /// The y caption of the graph
        /// </summary>
        ///////////////////////////////////////////////////////
        public string Yname
        {
            get { return _yname; }
            set { _yname = value; }
        }

        ///////////////////////////////////////////////////////
        /// <summary>
        /// The x caption of the graph
        /// </summary>
        ///////////////////////////////////////////////////////
        public string Xname
        {
            get { return _xname; }
            set { _xname = value; }
        }

        ///////////////////////////////////////////////////////
        /// <summary>
        /// Output in compressed format
        /// </summary>
        ///////////////////////////////////////////////////////
        public bool CompressData
        {
            get { return _compressedDataFormat; }
            set { _compressedDataFormat = value; }
        }

        public List<FusionChartDataCollection> Collection
        {
            get { return coll; }
            set { coll = value; }
        }

        public static string[] Colors
        {
            get
            {
                colors[0] = "CC3333";
                colors[1] = "CC6633";
                colors[2] = "CC9933";
                colors[3] = "99CC33";
                colors[4] = "33CC33";
                colors[5] = "33CCCC";
                colors[6] = "3399CC";
                colors[7] = "3366CC";
                colors[8] = "3333CC";
                colors[9] = "6633CC";
                colors[10] = "9933CC";
                colors[11] = "CC33CC";
                colors[12] = "CC3399";
                colors[13] = "CC3366";
                return colors;
            }
        }

        public List<ListItem> Attributes
        {
            get { return attributes; }
            set { attributes = value; }
        }        
        #endregion

        #region GetXML
        public string GetXML()
        {
            StringWriter sw = new StringWriter();

            XmlTextWriter writer = new XmlTextWriter(sw);

            int c = 0;

            writer.WriteStartElement("chart");
            writer.WriteAttributeString("showNames", "1");

            foreach (ListItem item in attributes)
                writer.WriteAttributeString(item.Text, item.Value);

            if (this.Caption != string.Empty)
                writer.WriteAttributeString("caption", this.Caption);
            if (this.Subcaption != string.Empty)
                writer.WriteAttributeString("subcaption", this.Subcaption);
            if (this.Xname != string.Empty)
                writer.WriteAttributeString("xAxisName", this.Xname);
            if (this.Yname != string.Empty)
                writer.WriteAttributeString("yAxisName", this.Yname);

            if (_compressedDataFormat)
            {
                writer.WriteAttributeString("compactDataMode", "1");
                writer.WriteAttributeString("dataSeparator", "|");

                List<string> cats = new List<string>();
                StringBuilder sb = new StringBuilder();
                foreach (FusionChartDataCollection col in this.Collection)
                {
                    if (col.Values.Count > 0)
                    {
                        foreach (FusionChartDataValue cat in col.Values)
                        {
                            if (!cats.Contains(cat.Name))
                            {
                                if (sb.Length > 0) sb.Append("|");
                                sb.Append(cat.Name);
                                cats.Add(cat.Name);
                            }
                        }
                    }
                }
                writer.WriteStartElement("categories");
                writer.WriteValue(sb.ToString());
                writer.WriteEndElement();

                // get datasets
                foreach (FusionChartDataCollection col in this.Collection)
                {
                    if (col.Values.Count > 0)
                    {
                        sb = new StringBuilder();
                        writer.WriteStartElement("dataset");
                        if (col.Color != string.Empty)
                            writer.WriteAttributeString("color", col.Color);
                        else if (Colors.Length > c)
                            writer.WriteAttributeString("color", Colors[c]);
                        writer.WriteAttributeString("seriesName", col.Name);

                        foreach (string category in cats)
                        {
                            foreach (FusionChartDataValue val in col.Values)
                            {
                                if (val.Name == category)
                                {
                                    if (val.Value.HasValue)
                                    {
                                        if (sb.Length > 0) sb.Append("|");
                                        sb.Append(val.Value.ToString());
                                    }
                                }
                            }
                        }

                        writer.WriteValue(sb.ToString());
                        writer.WriteEndElement();
                    }
                }
            }
            else
            {

                if (_ms && Collection.Count != 0)
                {
                    writer.WriteStartElement("categories");

                    // get categories
                    List<string> cats = new List<string>();
                    foreach (FusionChartDataCollection col in this.Collection)
                    {
                        if (col.Values.Count > 0)
                        {
                            foreach (FusionChartDataValue cat in col.Values)
                            {
                                if (!cats.Contains(cat.Name))
                                {
                                    writer.WriteStartElement("category");
                                    writer.WriteAttributeString("label", cat.Name);
                                    writer.WriteEndElement();
                                    cats.Add(cat.Name);
                                }
                            }
                        }
                    }

                    writer.WriteEndElement();

                    // get datasets
                    foreach (FusionChartDataCollection col in this.Collection)
                    {
                        if (col.Values.Count > 0)
                        {
                            writer.WriteStartElement("dataset");
                            if (col.Color != string.Empty)
                                writer.WriteAttributeString("color", col.Color);
                            else if (Colors.Length > c)
                                writer.WriteAttributeString("color", Colors[c]);
                            writer.WriteAttributeString("seriesName", col.Name);

                            foreach (string category in cats)
                            {
                                writer.WriteStartElement("set");

                                foreach (FusionChartDataValue val in col.Values)
                                {
                                    if (val.Name == category)
                                    {
                                        if (val.Value.HasValue)
                                        {
                                            writer.WriteAttributeString("value", val.Value.ToString());
                                        }
                                        break;
                                    }
                                }

                                writer.WriteEndElement();
                            }

                            writer.WriteEndElement();

                            c++;
                        }
                    }
                }
                else if (Collection.Count != 0)
                {
                    // simple
                    foreach (FusionChartDataValue val in Collection[0].Values)
                    {
                        writer.WriteStartElement("set");
                        writer.WriteAttributeString("name", val.Name);
                        if (val.Value.HasValue)
                        {
                            writer.WriteAttributeString("value", val.Value.ToString());
                        }
                        if (val.Color != string.Empty)
                            writer.WriteAttributeString("color", val.Color);
                        else if (Colors.Length > c)
                            writer.WriteAttributeString("color", Colors[c]);
                        writer.WriteEndElement();
                        c++;
                    }
                }
            }
            writer.WriteEndElement();
            writer.Close();

            return sw.ToString();
        }
        #endregion
    }

    public class FusionChartDataCollection
    {
        string _name = string.Empty;
        string _color = string.Empty;

        List<FusionChartDataValue> values = new List<FusionChartDataValue>();

        ///////////////////////////////////////////////////////
        /// <summary>
        /// The name of this collection
        /// </summary>
        ///////////////////////////////////////////////////////
        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        ///////////////////////////////////////////////////////
        /// <summary>
        /// The color of this item
        /// </summary>
        ///////////////////////////////////////////////////////
        public string Color
        {
            get { return _color; }
            set { _color = value; }
        }

        public List<FusionChartDataValue> Values
        {
            get { return values; }
            set { values = value; }
        }
    }

    public class FusionChartDataValue
    {
        string _name = string.Empty;
        decimal? _val = null;
        string _color = string.Empty;

        ///////////////////////////////////////////////////////
        /// <summary>
        /// The name of this item
        /// </summary>
        ///////////////////////////////////////////////////////
        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        ///////////////////////////////////////////////////////
        /// <summary>
        /// The value of this item
        /// </summary>
        ///////////////////////////////////////////////////////
        public decimal? Value
        {
            get { return _val; }
            set { _val = value; }
        }

        ///////////////////////////////////////////////////////
        /// <summary>
        /// The color of this item
        /// </summary>
        ///////////////////////////////////////////////////////
        public string Color
        {
            get { return _color; }
            set { _color = value; }
        }

        public FusionChartDataValue(string name, decimal? value, string color)
        {
            _name = name;
            _val = value;
            _color = color;
        }

        public FusionChartDataValue(string name, decimal? value)
        {
            _name = name;
            _val = value;
        }
    }
}