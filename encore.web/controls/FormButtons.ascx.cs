using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class controls_FormButtons : System.Web.UI.UserControl
{
    public event EventHandler Save;
    public event EventHandler Delete;

    public bool ShowDelete
    {
        get { return btnDelete.Visible; }
        set { btnDelete.Visible = value; }
    }

    public bool ShowSave
    {
        get { return btnSubmit.Visible; }
        set { btnSubmit.Visible = value; }
    }

    public bool ShowCancel
    {
        get { return btnCancel.Visible; }
        set { btnCancel.Visible = value; }
    }

    public int? EntityID
    {
        get
        {
            if (!string.IsNullOrEmpty(hdnID.Value))
                return int.Parse(hdnID.Value);
            return null;
        }
        set { hdnID.Value = value.ToString(); }
    }

    public bool LightBoxMode
    {
        get { return btnCancel.OnClientClick == "window.top.$.closeDOMWindow();"; }
        set
        {
            if (value)
            {
                btnCancel.OnClientClick = "window.top.$.closeDOMWindow();";
            }
        }
    }
    
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Save!= null)
        {
            Save(sender, e);
        }
    }
    
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (Delete != null)
        {
            Delete(sender, e);
        }
    }
}