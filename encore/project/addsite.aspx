<%@ Page Title="" Language="C#" MasterPageFile="~/master/lightbox.master" AutoEventWireup="true" CodeFile="addsite.aspx.cs" Inherits="project_addsite" %>
<%@ Register src="~/controls/TextBoxControl.ascx" tagPrefix="encore" tagName="TextBox" %>
<%@ Register src="~/controls/SelectControl.ascx" tagPrefix="encore" tagName="Select" %>
<%@ Register src="~/controls/FormButtons.ascx" tagPrefix="encore" tagName="Buttons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="LightBoxContent" Runat="Server">
    <h1>Add New Site</h1>
    <fieldset class="panel dataentry">
        <div class="dataentryrow">
            <encore:TextBox ID="txtSitename" FieldSize="Medium" Required="true" runat="server" Label="Site Name:"  />
        </div>
        <div class="dataentryrow">
                <encore:TextBox ID="txtDescription" TextMode="MultiLine" FieldSize="Large" Required="true" runat="server" Label="Description:"   />
        </div>
    </fieldset> 
    <encore:Buttons ID="btnFormButtons" runat="server" LightBoxMode="true" OnSave="btnSubmit_Click" />
</asp:Content>

