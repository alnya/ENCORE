<%@ Page Title="Create New Account" Language="C#" MasterPageFile="~/master/twocolumn.master" AutoEventWireup="true" CodeFile="start.aspx.cs" Inherits="registration_start" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <fieldset class="panel dataentry">
        <div class="dataentryrow">
            <asp:Button ID="btnImport" runat="server" CssClass="button save" 
                Text="I would like to import an account from an ENCORE partner" 
                onclick="btnImport_Click" />
        </div>
        <div class="dataentryrow">
            <asp:Button ID="btnCreate" runat="server" CssClass="button save" 
                Text="I would like to create a new account" onclick="btnCreate_Click"/>
        </div>
        <div class="buttonrow">
            <asp:Button ID="btnCancel" CausesValidation="false" OnClientClick="history.back(); return false;" runat="server" CssClass="button cancel" Text="Cancel" />
        </div>
    </fieldset>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SupportingContent" runat="server">
    <h2>Help</h2>
    <div class="panel">
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc gravida imperdiet dui. Donec posuere, purus vel ultrices consequat, dui massa iaculis leo, vitae facilisis libero dolor eget diam. Vestibulum bibendum venenatis leo in varius. Maecenas et pellentesque est. In auctor mi ac tortor lobortis porttitor. Phasellus sit amet sagittis orci. Vestibulum id felis id odio feugiat eleifend. Sed sed lectus mi. Sed vitae massa felis. Maecenas id tellus in lorem facilisis eleifend eget quis odio. Sed turpis diam, varius eget dapibus non, tincidunt congue quam. Mauris vel elit lacus.</p>
    </div>
</asp:Content>