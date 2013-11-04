<%@ Page Title="" Language="C#" MasterPageFile="~/master/lightbox.master" AutoEventWireup="true" CodeFile="addfield.aspx.cs" Inherits="project_addfield" %>
<%@ Register src="~/controls/TextBoxControl.ascx" tagPrefix="encore" tagName="TextBox" %>
<%@ Register src="~/controls/SelectControl.ascx" tagPrefix="encore" tagName="Select" %>
<%@ Register src="~/controls/FormButtons.ascx" tagPrefix="encore" tagName="Buttons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="LightBoxContent" Runat="Server">
    <h1>Add New Field</h1>
    <fieldset class="panel dataentry">
        <div class="dataentryrow">
            <encore:TextBox ID="txtSitename" FieldSize="Medium" Required="true" runat="server" Label="Site Name:"  />
        </div>
        <div class="dataentryrow">
             <encore:Select ID="ddlUnit" runat="server" Label="Unit:" DataTextField="NAME" DataValueField="ID" />
        </div>
    </fieldset> 
    <encore:Buttons ID="btnFormButtons" runat="server" LightBoxMode="true" OnSave="btnSubmit_Click" />
</asp:Content>

