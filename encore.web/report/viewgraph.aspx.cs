using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityFramework;
using com.Encore.Web;
using com.Encore.jControls;

public partial class report_viewgraph : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            BuildReport();
    }

    /////////////////////////////////////////////////////////////////
    /// <summary>
    /// Build the report
    /// </summary>
    /////////////////////////////////////////////////////////////////
    private void BuildReport()
    {
        var id = -1;
        if (Request["ID"] != null)
        {
            if (!int.TryParse(Request["ID"], out id))
            {
                ShowMessage(MessageType.Error, "There was an error loading this record");
                return;
            }
            ResultsGraph.DataURL += "?id=" + id;
        }
        else
        {
            Response.Redirect("default.aspx");
        }

        using (var ctx = new Entities())
        {
            // load report
            var report = ctx.REPORTs.FirstOrDefault(u => u.ID == id);
            litReportName.Text = report.NAME;

            // todo: check permissions
        }

    }

    ///////////////////////////////////////////////////////
    /// <summary>
    /// Show / hide the graph controls
    /// </summary>
    ///////////////////////////////////////////////////////
    private void SetupDisplay()
    {
        ResultsGraph.CreateControl();
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        
    }
}