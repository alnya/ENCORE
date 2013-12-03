<%@ Page Title="" Language="C#" MasterPageFile="~/master/twocolumn.master" AutoEventWireup="true" Inherits="site_contact" Codebehind="contact.aspx.cs" %>
<%@ Register src="~/controls/TextBoxControl.ascx" tagPrefix="encore" tagName="TextBox" %>
<%@ Register src="~/controls/SelectControl.ascx" tagPrefix="encore" tagName="Select" %>
<%@ Register src="~/controls/FormButtons.ascx" tagPrefix="encore" tagName="Buttons" %>

<%@ Register Assembly="com.Encore.jControls" TagPrefix="jquery" Namespace="com.Encore.jControls"%>
<%@ Register TagPrefix="encore" Namespace="com.Encore.jControls" Assembly="com.Encore.jControls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <fieldset class="panel dataentry">
        <div class="dataentryrow">
            <encore:TextBox ID="txtEmailAddress" FieldSize="Medium" DataType="EmailAddress" Required="true" runat="server" Label="Email Address:" 
                HelpTitle="Please enter a valid email address"  />
        </div>
        <div class="dataentryrow">
                <encore:TextBox ID="txtName" FieldSize="Medium" Required="true" runat="server" Label="Name:"   />
        </div>
        <div class="dataentryrow">
                <encore:TextBox ID="txtPhone" FieldSize="Medium" Required="false" runat="server" Label="Phone:"   />
        </div>
    </fieldset> 
    <asp:HiddenField runat="server" ID="hdnSiteId"/>
    <encore:Buttons ID="btnFormButtons" runat="server" OnSave="btnSubmit_Click" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SupportingContent" runat="server">
</asp:Content>