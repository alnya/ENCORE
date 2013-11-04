<%@ Page Title="Import user account" Language="C#" MasterPageFile="~/master/twocolumn.master" AutoEventWireup="true" Inherits="registration_import" Codebehind="import.aspx.cs" %>
<%@ Register src="~/controls/TextBoxControl.ascx" tagPrefix="encore" tagName="TextBox" %>
<%@ Register src="~/controls/SelectControl.ascx" tagPrefix="encore" tagName="Select" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <fieldset class="panel dataentry">
       <div class="dataentryrow">
             <encore:TextBox ID="txtEmailAddress" DataType="EmailAddress" FieldSize="Medium" Required="true" runat="server" Label="Email Address:" 
            HelpTitle="Please enter your email address" HelpText="Please enter the email address used on the ENCORE partner site" />
        </div>
        <div class="dataentryrow">
            <encore:TextBox ID="txtPassword" FieldSize="Medium" Required="true" runat="server" Label="Password:" TextMode="Password" 
            HelpTitle="Please enter your password"
            HelpText="Enter the password used to log into the ENCORE partner site" />
        </div>
        <div class="dataentryrow">
             <encore:Select ID="ddlPartner" Required="true" runat="server" 
             Label="I would like to import from an ENCORE partner.  Get my details from:"
            HelpTitle="Choose the ENCORE partner you wish to import from"
            DataTextField="Name" DataValueField="ID" />
        </div>
        <div class="buttonrow">
            <asp:Button ID="btnCancel" CausesValidation="false" OnClientClick="history.back(); return false;" runat="server" CssClass="button cancel" Text="Cancel" />
            <asp:Button ID="btnSubmit" runat="server" CssClass="button save" Text="Import" onclick="btnSubmit_Click"/>
        </div>
    </fieldset>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SupportingContent" runat="server">
    <h2>Help</h2>
    <div class="panel">
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc gravida imperdiet dui. Donec posuere, purus vel ultrices consequat, dui massa iaculis leo, vitae facilisis libero dolor eget diam. Vestibulum bibendum venenatis leo in varius. Maecenas et pellentesque est. In auctor mi ac tortor lobortis porttitor. Phasellus sit amet sagittis orci. Vestibulum id felis id odio feugiat eleifend. Sed sed lectus mi. Sed vitae massa felis. Maecenas id tellus in lorem facilisis eleifend eget quis odio. Sed turpis diam, varius eget dapibus non, tincidunt congue quam. Mauris vel elit lacus.</p>
    </div>
</asp:Content>