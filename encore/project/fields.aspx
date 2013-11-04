<%@ Page Title="" Language="C#" MasterPageFile="~/master/global.master" AutoEventWireup="true" CodeFile="fields.aspx.cs" Inherits="project_fields" %>
<%@ Register src="~/controls/TextBoxControl.ascx" tagPrefix="encore" tagName="TextBox" %>
<%@ Register src="~/controls/SelectControl.ascx" tagPrefix="encore" tagName="Select" %>
<%@ Register src="~/controls/FormButtons.ascx" tagPrefix="encore" tagName="Buttons" %>
<%@ Register Assembly="com.Encore.jControls" TagPrefix="jquery" Namespace="com.Encore.jControls"%>
<%@ MasterType virtualpath="~/master/global.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<h1><asp:Literal ID="litTitle" runat="server" /></h1>
<h2><asp:Literal ID="litProjectTitle" runat="server" /> </h2>
 <fieldset class="panel dataentry panelscroll">
    <asp:Repeater ID="rptMatch" runat="server">
        <ItemTemplate>
            <div class="dataentryrow clearfix">
                <asp:HiddenField runat="server" ID="hdnID" Value='<%#Eval("ID") %>'/>
                <span class="sourcefield"><%#Eval("NAME") %></span>
                <encore:Select ID="ddlEncoreSite" runat="server"  />
                <a href="addfield.aspx?name=<%#Eval("NAME") %>" class="button search lightbox">Add New</a>
            </div>
        </ItemTemplate>
    </asp:Repeater>
 </fieldset>
    <encore:Buttons ID="btnFormButtons" runat="server" />
</asp:Content>
