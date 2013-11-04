using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using com.Encore.Web;

public partial class Controls_TextboxControl : System.Web.UI.UserControl
{
    public override string ClientID
    {
        get
        {
            return txtTextBox.ClientID;
        }
    }

    public string Text
    {
        get { return txtTextBox.Text.Trim(); }
        set { txtTextBox.Text = value; }
    }

    public string Label
    {
        get { return lblLabel.Text; }
        set
        {
            lblLabel.Text = value;
            lblLabel.Visible = true;
        }
    }

    public TextBoxDataType DataType
    {
        set
        {
            switch(value)
            {
                case TextBoxDataType.Decimal:
                    regexTextBox.ValidationExpression = @"^[-+]?\d+(\.\d+)?$";
                    regexTextBox.ErrorMessage = "Please enter a valid number (0-9.00)";
                    regexTextBox.Enabled = true;
                    txtTextBox.CssClass += " mask-num";
                    break;
                case TextBoxDataType.Int:
                    regexTextBox.ValidationExpression = "^[0-9]+$";
                    regexTextBox.ErrorMessage = "Please enter a valid number (0-9)";
                    regexTextBox.Enabled = true;
                    txtTextBox.CssClass += " mask-int";
                    break;
                case TextBoxDataType.EmailAddress:
                     regexTextBox.ValidationExpression = @"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";
                    regexTextBox.ErrorMessage = "Please enter a valid email address";
                    regexTextBox.Enabled = true;
                    break;
                case TextBoxDataType.DateTime:
                    //regexTextBox.ValidationExpression = "^[0-9]+$";
                    //regexTextBox.ErrorMessage = "Please enter a valid number (0-9)";
                    //regexTextBox.Enabled = true;
                    txtTextBox.CssClass += " datepicker";
                    break;
            }
        }
    }

    public bool Required
    {
        get { return rfvTextBox.Enabled; }
        set { rfvTextBox.Enabled = value; }
    }

    public string HelpTitle
    {
        get { return litHelpTitle.Text.Trim(); }
        set
        {
            litHelpTitle.Text = value;
            divHelp.Visible = true;
        }
    }

    public string HelpText
    {
        get { return litHelpText.Text.Trim(); }
        set
        {
            litHelpText.Text = value;
            divHelp.Visible = true;
        }
    }

    public FieldSize FieldSize
    {
        set { txtTextBox.CssClass += " " + value.ToString().ToLower(); }
    }

    public TextBoxMode TextMode
    {
        get { return txtTextBox.TextMode; }
        set { txtTextBox.TextMode = value; }
    }
}