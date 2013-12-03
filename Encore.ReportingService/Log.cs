using System;
using System.Configuration;
using System.Xml;

namespace Encore.ReportingService
{
	///////////////////////////////////////////////////////////////////////
	/// <summary>
	/// Static utilities to write exceptions to an xml exceptions log file
	/// </summary>
	///////////////////////////////////////////////////////////////////////
	public class Log
	{

        ///////////////////////////////////////////////////////////////////////
        /// <summary>
        /// Write exception to the log file (and if not present, create it)
        /// </summary>
        ///////////////////////////////////////////////////////////////////////
        public static void Write(Exception ex)
        {
            Write(ex.Source, ex.Message, ex);
        }

        ///////////////////////////////////////////////////////////////////////
        /// <summary>
        /// Write exception to the log file (and if not present, create it)
        /// </summary>
        ///////////////////////////////////////////////////////////////////////
        public static void Write(string Source, string Message)
        {
            Write(Source, Message, null);
        }

		///////////////////////////////////////////////////////////////////////
		/// <summary>
		/// Write exception to the log file (and if not present, create it)
		/// </summary>
		///////////////////////////////////////////////////////////////////////
        public static void Write(string Source, string Message, Exception inner)
		{
            if (ConfigurationSettings.AppSettings["WriteLog"] != null &&
                Convert.ToBoolean(ConfigurationSettings.AppSettings["WriteLog"]))
            {
                string path = System.IO.Path.Combine(
                    ConfigurationSettings.AppSettings["LogPath"].ToString(),
                    DateTime.Now.ToString("yyyy-MM-dd") + ".xml");

                try
                {
                    if (!System.IO.File.Exists(path))
                    {
                        XmlTextWriter xmlLogDoc = new XmlTextWriter(path, null);
                        xmlLogDoc.WriteStartDocument();
                        xmlLogDoc.WriteStartElement("LogEntries");

                        xmlLogDoc.WriteEndElement();
                        xmlLogDoc.WriteEndDocument();
                        xmlLogDoc.Close();
                    }

                    XmlDocument xmlDoc = new XmlDocument();
                    xmlDoc.Load(path);

                    XmlElement root = xmlDoc.DocumentElement;
                    XmlElement exception = xmlDoc.CreateElement("Log");

                    exception.SetAttribute("time", DateTime.Now.ToString());
                    exception.SetAttribute("source", Source);
                    exception.InnerText = Message;
                    root.AppendChild(exception);

                    xmlDoc.Save(path);
                }
                catch (Exception e)
                {
                    string exceptionMessage = e.Message;
                }
            }
		}
	
		///////////////////////////////////////////////////////////////////////
		/// <summary>
		/// Create Text node and value
		/// </summary>
		///////////////////////////////////////////////////////////////////////
		private static void AddTextElement( XmlDocument doc, XmlElement nodeParent, string strTag, string strValue )
		{
			XmlElement nodeElem = doc.CreateElement( strTag );
			XmlText nodeText = doc.CreateTextNode( strValue );
			nodeParent.AppendChild( nodeElem );
			nodeElem.AppendChild( nodeText );
		} 

	}
}
