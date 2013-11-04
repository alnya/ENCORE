using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using EntityFramework;
using com.Encore.jControls;
using com.Encore.Web;

public partial class site_sitedata : System.Web.UI.Page
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
            var q = from s in ctx.SITEs where s.NAME.StartsWith(letter) && s.DELETED == 0 orderby s.NAME select s;
            if (letter == "all")
            {
                q = from s in ctx.SITEs where s.DELETED == 0 orderby s.NAME select s;
            }
            var results = q.ToList();
            var listitems = results.Select(site => new NVP(site.NAME, site.ID.ToString())).ToList();

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