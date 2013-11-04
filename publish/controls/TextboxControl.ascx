<%@ Control Language="C#" AutoEventWireup="true" Inherits="Controls_TextboxControl" Codebehind="TextboxControl.ascx.cs" %>
<asp:Label ID="lblLabel" runat="server" AssociatedControlID="txtTextBox" Visible="false"/>
<asp:TextBox ID="txtTextBox" runat="server" CssClass="field textfield" />
<div id="divHelp" runat="server" class="contexthelp" Visible="false"><h2><asp:Literal ID="litHelpTitle" runat="server" /></h2><p><asp:Literal ID="litHelpText" runat="server" /></p></div>
<asp:RequiredFieldValidator ID="rfvTextBox" Display="Dynamic" runat="server" ControlToValidate="txtTextBox" Enabled="false" ErrorMessage="This field is required" />
<asp:RegularExpressionValidator runat="server" Display="Dynamic" Enabled="false" ControlToValidate="txtTextBox" ID="regexTextBox"/>