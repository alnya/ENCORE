using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

using EntityFramework;

namespace encore.web.report
{
    [WebService(Description = "Utility web services for reporting.", Namespace = "http://encore.ceh.ac.uk/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public partial class AJAXTools : Page
    {
        [WebMethod(Description = "Gets the books matching part of a title.")]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string GetReportSummary(string sites, string fields)
        {
            var searchSites = sites.Split(',').Select(NullableTryParseShort).ToArray();
            var searchFields = fields.Split(',').Select(NullableTryParseShort).ToArray();

            using (var ctx = new Entities())
            {
                var summaries = ctx.VWREPORTSITEFIELDSUMMARies.Where(
                    s => (searchFields.Count() == 0 || searchFields.Contains(s.FIELDID)) &&
                         (searchSites.Count() == 0 || searchSites.Contains(s.SITEID))
                    )
                    .ToList();

                if (summaries == null || summaries.Count == 0)
                {
                    return string.Empty;
                }

                var summary = new ReportSummary
                {
                    RowCount = summaries.Sum(s => s.ROWCOUNT),
                    MaxDate = summaries.Max(s => s.VALUEMAXDATE).Value.ToString("dd MMM yyyy"),
                    MinDate = summaries.Min(s => s.VALUEMINDATE).Value.ToString("dd MMM yyyy")
                };

                if (summary.RowCount< 0)
                {
                    return string.Empty;
                }

                var js = new JavaScriptSerializer();
                return js.Serialize(summary);
            }
        }

        public class ReportSummary
        {
            public int? RowCount;
            public string MaxDate;
            public string MinDate;
        }

        public static short? NullableTryParseShort(string text)
        {
            short value;
            return short.TryParse(text, out value) ? (short?)value : null;
        }

        public class NVP
        {
            public NVP(string name, string value, string description)
            {
                Name = name;
                Value = value;
                Description = description;
            }
            public string Name;
            public string Value;
            public string Description;
        }

        [WebMethod(Description = "Fields search.")]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string GetFields(string letter, int? projectID, int? groupID)
        {
            using (var ctx = new Entities())
            {
                var restrictedFields = new List<short?>();
                if (projectID.HasValue && projectID.Value != 0)
                {
                    restrictedFields = ctx.PROJECTFIELDs.Where(f => f.PROJECTID == projectID).Select(f => f.FIELDID).ToList();
                }

                if (groupID.HasValue && groupID.Value != 0)
                {
                    restrictedFields.AddRange(
                        ctx.FIELDGROUPFIELDs.Where(f => f.FIELDGROUPID == groupID).Select(f => f.FIELDID).ToList()
                        );
                }

                var q = from f in ctx.VWFIELDUNITs where f.NAME.StartsWith(letter) && (restrictedFields.Count == 0 || restrictedFields.Contains(f.ID)) orderby f.NAME select f;
                if (letter == "all")
                {
                    q = from f in ctx.VWFIELDUNITs where (restrictedFields.Count == 0 || restrictedFields.Contains(f.ID)) orderby f.NAME select f;
                }

                var results = q.ToList();
                var listitems = results.Select(
                    f =>
                    new NVP(
                        f.NAME + " (" + f.UNITNAME + ")",
                        f.ID.ToString(),
                        string.IsNullOrEmpty(f.DESCRIPTION) ? string.Empty : f.DESCRIPTION)
                    )
                    .ToArray();

                var js = new JavaScriptSerializer();
                return js.Serialize(listitems);
            }
        }
    }
}