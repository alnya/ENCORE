using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using EntityFramework;
using com.Encore.jControls;
using com.Encore.Web;

public partial class group_fielddata : System.Web.UI.Page
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
        var letter = Request.Params["letter"];

        using (var ctx = new Entities())
        {
            var q = from f in ctx.VWFIELDUNITs where f.NAME.StartsWith(letter) orderby f.NAME select f;

            var results = q.ToList();
            var listitems = results.Select(vwfieldunit => new NVP(vwfieldunit.NAME, vwfieldunit.ID.ToString())).ToList();

            var serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return serializer.Serialize(listitems);
        }
    }

    private class NVP
    {
        public NVP(string name, string value)
        {
            Name = name;
            Value = value;
        }
        public string Name;
        public string Value;
    }
}