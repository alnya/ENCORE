<%@ Control Language="C#" AutoEventWireup="true" Inherits="Controls_SelectControl" Codebehind="SelectControl.ascx.cs" %>
<asp:Label ID="lblLabel" runat="server" AssociatedControlID="ddlDropDownList"/>
 <asp:DropDownList ID="ddlDropDownList" runat="server" CssClass="field"/>
<div id="divHelp" runat="server" class="contexthelp" Visible="false"><h2><asp:Literal ID="litHelpTitle" runat="server" /></h2><p><asp:Literal ID="litHelpText" runat="server" /></p></div>
<asp:RequiredFieldValidator ID="rfvDropDownList" runat="server" ControlToValidate="ddlDropDownList" Enabled="false" />