using System;
using System.Collections.Generic;
using System.Linq;

using EntityFramework;
using com.Encore.jControls;
using com.Encore.Web;

public partial class field_listdata : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        Response.ContentType = "text/x-json";
        Response.Write(GetPagedContent());
        Response.Flush();
        Response.End();
    }

    private string GetPagedContent()
    {
        var page = Convert.ToInt32(Request.Params["page"]);
        var rp = Convert.ToInt32(Request.Params["rp"]);
        var qtype = Request.Params["qtype"];
        var query = Request.Params["query"];
        var sortname = Request.Params["sortname"];
        var sortorder = Request.Params["sortorder"];

        using (var ctx = new Entities())
        {
            var q = from u in ctx.VWFIELDUNITs select u;

            if (!string.IsNullOrEmpty(qtype) && !string.IsNullOrEmpty(query))
            {
                q = q.Where(u => u.NAME.ToLower().Contains(query.ToLower()));
            }

            if (!string.IsNullOrEmpty(sortname) && !string.IsNullOrEmpty(sortorder))
            {
                q = q.OrderBy(sortname, (sortorder == "asc"));
            }

            var count = q.ToList().Count;

            q = q.Skip((page - 1) * rp).Take(rp);

            var results = q.ToList();

            var flexigrid = new FlexigridViewData { page = page, total = count };

            foreach (var result in results)
            {
                var fgRow = new FlexigridRow {id = result.ID, cell = new List<string> {result.NAME, result.UNITNAME}};
                flexigrid.rows.Add(fgRow);
            }

            var serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return serializer.Serialize(flexigrid);
        }
    }
}