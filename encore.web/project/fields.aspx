<%@ Page Title="" Language="C#" MasterPageFile="~/master/global.master" AutoEventWireup="true" Inherits="project_fields" Codebehind="fields.aspx.cs" %>
<%@ Register src="~/controls/TextBoxControl.ascx" tagPrefix="encore" tagName="TextBox" %>
<%@ Register src="~/controls/SelectControl.ascx" tagPrefix="encore" tagName="Select" %>
<%@ Register src="~/controls/FormButtons.ascx" tagPrefix="encore" tagName="Buttons" %>
<%@ Register Assembly="com.Encore.jControls" TagPrefix="jquery" Namespace="com.Encore.jControls"%>
<%@ MasterType virtualpath="~/master/global.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<h1><asp:Literal ID="litTitle" runat="server" /></h1>
<h2><asp:Literal ID="litProjectTitle" runat="server" /> </h2>
 <fieldset class="panel dataentry clearfix">
     <h2 style="float:left; width:298px;"> Source Field</h2> <h2>Encore Field</h2>
    
     <div class="panelscroll">

        <asp:Repeater ID="rptMatch" runat="server" OnItemDataBound="rptMatch_ItemDataBound">
            <HeaderTemplate>
                <div class="pagedcontent">
            </HeaderTemplate>
            <ItemTemplate>
                <div class="dataentryrow clearfix">
                   <asp:HiddenField runat="server" ID="hdnID" Value='<%#Eval("ID") %>'/>
                    <asp:HiddenField runat="server" ID="hdnValue" Value='<%#Eval("FIELDID") %>'/>
                    <span class="sourcefield"><%#Eval("NAME") %></span>
                    <encore:Select ID="ddlEncoreField" BlankFirstRow="true" runat="server" DataTextField="NAME" DataValueField="ID"  />
                    <a href="addfield.aspx?name=<%#Eval("NAME") %>" class="button search lightbox">Add New</a>
                </div>
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>
        <div class="buttonrow" >
            <asp:Button ID="btnSync" runat="server" CssClass="button search" 
                Text="Synchronise" onclick="btnSync_Click" />
        </div>
    </div>
 </fieldset>
    <encore:Buttons ID="btnFormButtons" runat="server" OnSave="btnSubmit_Click" />
</asp:Content>
