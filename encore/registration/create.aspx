<%@ Page Title="Register New User" Language="C#" MasterPageFile="~/master/twocolumn.master" AutoEventWireup="true" CodeFile="create.aspx.cs" Inherits="registration_create" %>
<%@ Register src="~/controls/TextBoxControl.ascx" tagPrefix="encore" tagName="TextBox" %>
<%@ Register src="~/controls/SelectControl.ascx" tagPrefix="encore" tagName="Select" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <fieldset class="panel dataentry">
       <div class="dataentryrow">
            <encore:TextBox ID="txtEmailAddress" DataType="EmailAddress" FieldSize="Medium" Required="true" runat="server" Label="Email Address:" 
                HelpTitle="Please enter your email address" 
                HelpText="Please enter your valid email address" />
        </div>
        <div class="dataentryrow">
            <encore:TextBox ID="txtPassword" FieldSize="Medium" Required="true" runat="server" Label="Password:" TextMode="Password" 
            HelpTitle="Please enter your password"
            HelpText="Enter the password you would like to use" />
        </div>
        <div class="dataentryrow">
            <encore:TextBox ID="txtPasswordConfirm" FieldSize="Medium" Required="true" runat="server" 
            Label="Confirm Your Password:" TextMode="Password" 
            HelpTitle="Please re-enter your password" />
        </div>
        <div class="dataentryrow">
             <encore:TextBox ID="txtName" FieldSize="Medium" Required="true" runat="server" Label="Name:"   />
        </div>
         <div class="dataentryrow">
             <encore:TextBox ID="txtOrganisation" FieldSize="Medium" Required="false" runat="server" 
             Label="Name of your Organisation:" />
        </div>
        <div class="dataentryrow">
           <encore:TextBox ID="txtAreaOfResearch" FieldSize="Large" TextMode="MultiLine" Required="false" runat="server" 
             Label="Area Of Research:" />
        </div>
        <div class="buttonrow">
            <asp:Button ID="btnCancel" CausesValidation="false" OnClientClick="history.back(); return false;" runat="server" CssClass="button cancel" Text="Cancel" />
            <asp:Button ID="btnSubmit" runat="server" CssClass="button save" Text="Save" onclick="btnSubmit_Click"/>
        </div>
    </fieldset>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SupportingContent" runat="server">
    <h2>Help</h2>
    <div class="panel">
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc gravida imperdiet dui. Donec posuere, purus vel ultrices consequat, dui massa iaculis leo, vitae facilisis libero dolor eget diam. Vestibulum bibendum venenatis leo in varius. Maecenas et pellentesque est. In auctor mi ac tortor lobortis porttitor. Phasellus sit amet sagittis orci. Vestibulum id felis id odio feugiat eleifend. Sed sed lectus mi. Sed vitae massa felis. Maecenas id tellus in lorem facilisis eleifend eget quis odio. Sed turpis diam, varius eget dapibus non, tincidunt congue quam. Mauris vel elit lacus.</p>
    </div>
</asp:Content>