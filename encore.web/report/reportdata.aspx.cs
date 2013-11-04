using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using Encore.DataStore;
using EntityFramework;
using com.Encore.jControls;
using com.Encore.Web;

public partial class report_data : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var id = -1;
        if (Request["id"] != null)
        {
            if (!int.TryParse(Request["id"], out id))
            {
                return;
            }
        }

        Response.Clear();
        Response.ContentType = "text/x-json";
        Response.Write(GetPagedContent(id));
        Response.Flush();
        Response.End();
    }

    private string GetPagedContent(int id)
    {
        var page = Convert.ToInt32(Request.Params["page"]);
        var rp = Convert.ToInt32(Request.Params["rp"]);
        var qtype = Request.Params["qtype"];
        var query = Request.Params["query"];
        var sortname = Request.Params["sortname"];
        var sortorder = Request.Params["sortorder"];

        var datastore = new DataStore(ConfigurationSettings.AppSettings["datastore_path"]);
        var total = 0;
        var data = datastore.Retrieve(id, rp, page, out total);

        var flexigrid = new FlexigridViewData { page = page, total = total };

        int i = 0;
        foreach (var row in data)
        {
            i++;
            var fgRow = new FlexigridRow {id = i, cell = new List<string>()};
            fgRow.cell.Add(row.RowDateTime.ToString("dd MMM yyyy HH:mm"));
            fgRow.cell.Add(row.SiteID.ToString());
            fgRow.cell.AddRange(row.Values);

            flexigrid.rows.Add(fgRow);
        }

        var serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        return serializer.Serialize(flexigrid);
    }
}