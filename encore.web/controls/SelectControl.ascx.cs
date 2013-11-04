using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using com.Encore.Web;

public partial class Controls_SelectControl : System.Web.UI.UserControl
{
    public override string ClientID
    {
        get
        {
            return ddlDropDownList.ClientID;
        }
    }

    public string Value
    {
        get { return ddlDropDownList.SelectedValue.Trim(); }
        set { ddlDropDownList.SelectedValue = value; }
    }

    public string Label
    {
        get { return lblLabel.Text; }
        set { lblLabel.Text = value; }
    }

    public bool Required
    {
        get { return rfvDropDownList.Enabled; }
        set
        {
            rfvDropDownList.Enabled = value;
            if (value)
            {
                BlankFirstRow = true;
            }
        }
    }

    public string HelpTitle
    {
        get { return litHelpTitle.Text.Trim(); }
        set { litHelpTitle.Text = value; divHelp.Visible = true; }
    }

    public string HelpText
    {
        get { return litHelpText.Text.Trim(); }
        set { litHelpText.Text = value; divHelp.Visible = true; }
    }

    public FieldSize FieldSize
    {
        set { ddlDropDownList.CssClass += " " + value.ToString().ToLower(); }
    }

    public bool BlankFirstRow
    {
        set { this.ViewState["BlankFirstRow"] = value; }
        get
        {
            if (this.ViewState["BlankFirstRow"] != null)
            {
                return (bool) this.ViewState["BlankFirstRow"];
            }
            return false;
        }
    }

    public object DataSource
    {
        set
        {
            ddlDropDownList.DataSource = value;
            ddlDropDownList.DataBind();
            if (BlankFirstRow)
            {
                ddlDropDownList.Items.Insert(0, new ListItem("", ""));
            }
        }
    }

    public string DataTextField
    {
        get { return ddlDropDownList.DataTextField; }
        set { ddlDropDownList.DataTextField = value; }
    }

    public string DataValueField
    {
        get { return ddlDropDownList.DataValueField; }
        set { ddlDropDownList.DataValueField = value; }
    }
}