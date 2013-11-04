using System;

public partial class master_twocolumns : System.Web.UI.MasterPage
{
    public string Title
    {
        get { return litTitle.Text; }
        set { litTitle.Text = value; }
    }

    void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Master.ThisPage != null && string.IsNullOrEmpty(Title))
            {
                Title = Master.ThisPage.Title;
            }
        }
    }
}
