using System;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Web.UI;
using Encore.DataStore;
using EntityFramework;

namespace com.Encore.Web
{
    public partial class graphxml : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BuildReport();
        }

        private void BuildReport()
        {
            var id = -1;
            if (Request["id"] != null)
            {
                if (!int.TryParse(Request["id"], out id))
                {
                    return;
                }
            }

            // get columns
            using (var ctx = new Entities())
            {
                // load report
                var report = ctx.REPORTs.FirstOrDefault(u => u.ID == id);

                // get columns
                var report_fields = ctx.VWREPORTFIELDs.Where(f => f.REPORTID == id);

                var datastore = new DataStore(ConfigurationSettings.AppSettings["datastore_path"]);

                var data = datastore.Retrieve(id);

                var xmlOutput = new StringBuilder();
                xmlOutput.Append(
                    "<chart compactDataMode='1' dataSeparator='|' displayStartIndex='1' displayEndIndex='30' showValues='0' labelStep='1' anchorRadius='0' xAxisName='" +
                    report.NAME + "' yAxisName='Value'>");
                xmlOutput.Append("<categories>");
                xmlOutput.Append(string.Join("|", data.Select(r => r.RowDateTime.ToString("dd MMM yy HH:mm"))));
                xmlOutput.Append("</categories>");

                var i = 0;
                foreach (var col in report_fields)
                {
                    xmlOutput.Append(string.Format("<dataset seriesName='{0}' color='#{1}'>", col.NAME, FusionChartDataSet.Colors[i]));
                    xmlOutput.Append(string.Join("|", data.Select(r => r.Values[i])));
                    xmlOutput.Append("</dataset>");
                    i++;
                }

                xmlOutput.Append("</chart>");
                Controls.Add(new LiteralControl(xmlOutput.ToString()));
            }
        }
    }
}