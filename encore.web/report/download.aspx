<%@ Page Title="" Language="C#" MasterPageFile="~/master/lightbox.master" AutoEventWireup="true" CodeBehind="download.aspx.cs" Inherits="report_download" %>
<%@ Register src="~/controls/TextBoxControl.ascx" tagPrefix="encore" tagName="TextBox" %>
<%@ Register src="~/controls/FormButtons.ascx" tagPrefix="encore" tagName="Buttons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="LightBoxContent" Runat="Server">
    <h1>Download report to excel</h1>
    <fieldset class="panel dataentry">
        <div class="dataentryrow">
            <encore:TextBox ID="txtReason" TextMode="MultiLine" FieldSize="Large" Required="true" runat="server" Label="Reason for download:"  />
        </div>
    </fieldset> 
    <encore:Buttons ID="btnFormButtons" runat="server" LightBoxMode="true" OnSave="btnSubmit_Click" />
</asp:Content>
