using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Encore.TaskManager;
using com.Encore.Web;

public partial class page_dashboard :BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnNewReport_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/report/detail.aspx");
    }

    protected void btnRunTasks_Click(object sender, EventArgs e)
    {
        var task = new TaskManager();
        task.ProcessReportQueue();

        ShowMessage(MessageType.Success, "Running data requests");
    }

    protected void btnSync_Click(object sender, EventArgs e)
    {
        var task = new TaskManager();
        task.SyncProjectSummaries();
        ShowMessage(MessageType.Success, "Running sync request");
    }
}