using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityFramework;
using com.Encore.Web;
using com.Encore.jControls;

public partial class report_viewreport : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        BindData();

    }

    private void BindData()
    {
        var id = -1;
        if (Request["ID"] != null)
        {
            if (!int.TryParse(Request["ID"], out id))
            {
                ShowMessage(MessageType.Error, "There was an error loading this record");
                return;
            }
            ReportGrid.DataURL += "?id=" + id;
            hlDownload.NavigateUrl += "?id=" + id;
        }
        else
        {
            Response.Redirect("default.aspx");
        }

        using (var ctx = new Entities())
        {
            // load report
            var report = ctx.REPORTs.FirstOrDefault(u => u.ID == id);
            litReportTitle.Text = report.NAME;
            ReportGrid.Title = report.NAME;

            // get columns
            var report_fields = ctx.VWREPORTFIELDs.Where(f => f.REPORTID == id);
            foreach(var field in report_fields)
            {
                ReportGrid.Columns.Add(new jGridColumn{ColumnName = field.ID.ToString(), Title = field.NAME, Width = 100});
            }

            // todo: check permissions
        }
    }
}