using System;
using System.Configuration;
using System.Xml;

namespace com.Encore.Web
{
	///////////////////////////////////////////////////////////////////////
    /// <summary>
    /// Static utilities to write exceptions to an xml exceptions log file
    /// </summary>
    ///////////////////////////////////////////////////////////////////////
    public class ExceptionLog
    {

        ///////////////////////////////////////////////////////////////////////
        /// <summary>
        /// Write exception to the log file (and if not present, create it)
        /// </summary>
        ///////////////////////////////////////////////////////////////////////
        public static void WriteException(string source, Exception ex)
        {
            WriteException(
                ConfigurationManager.AppSettings["ExceptionReportingPath"] + DateTime.Now.ToString("yyyy-MM-dd") + ".xml", 
                source, ex);
        }

        ///////////////////////////////////////////////////////////////////////
        /// <summary>
        /// Write exception to the log file (and if not present, create it)
        /// </summary>
        ///////////////////////////////////////////////////////////////////////
        public static void WriteException(string message)
        {
            WriteException(ConfigurationManager.AppSettings["ExceptionReportingPath"] + DateTime.Now.ToString("yyyy-MM-dd") + ".xml", 
                message, null);
        }

        ///////////////////////////////////////////////////////////////////////
        /// <summary>
        /// Write exception to the log file (and if not present, create it)
        /// </summary>
        ///////////////////////////////////////////////////////////////////////
        public static void WriteException(string path, string source, Exception inner)
        {
            try
            {
                if (!System.IO.File.Exists(@path))
                {
                    var xmlLogDoc = new XmlTextWriter(@path, null);
                    xmlLogDoc.WriteStartDocument();
                    xmlLogDoc.WriteStartElement("ExceptionList");

                    xmlLogDoc.WriteEndElement();
                    xmlLogDoc.WriteEndDocument();
                    xmlLogDoc.Close();
                }

                var xmlDoc = new XmlDocument();
                xmlDoc.Load(@path);

                XmlElement root = xmlDoc.DocumentElement;
                XmlElement exception = xmlDoc.CreateElement("Exception");
                root.AppendChild(exception);

                AddTextElement(xmlDoc, exception, "Time", DateTime.Now.ToString());
                AddTextElement(xmlDoc, exception, "Source", source);

                if (inner != null)
                {
                    AddTextElement(xmlDoc, exception, "Exception", inner.Message);
                    AddTextElement(xmlDoc, exception, "Stack", inner.StackTrace);
                }

                xmlDoc.Save(path);
            }
            catch (Exception e)
            {
                string exceptionMessage = e.Message;
            }
        }

        ///////////////////////////////////////////////////////////////////////
        /// <summary>
        /// Create Text node and value
        /// </summary>
        ///////////////////////////////////////////////////////////////////////
        private static void AddTextElement(XmlDocument doc, XmlElement nodeParent, string strTag, string strValue)
        {
            var nodeElem = doc.CreateElement(strTag);
            var nodeText = doc.CreateTextNode(strValue);
            nodeParent.AppendChild(nodeElem);
            nodeElem.AppendChild(nodeText);
        }

    }
}
