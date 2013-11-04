<%@ Page Title="" Language="C#" MasterPageFile="~/master/twocolumn.master" AutoEventWireup="true" Inherits="_Default" Codebehind="Default.aspx.cs" %>
<%@ Register src="~/controls/TextBoxControl.ascx" tagPrefix="encore" tagName="TextBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SupportingContent" Runat="Server">
 <h2>Login</h2>
     <fieldset class="panel dataentry">
        <asp:Panel ID="pnlLogin" runat="server" DefaultButton="btnSubmit">
            <div class="dataentryrow">
                <encore:TextBox ID="txtUsername" DataType="EmailAddress" FieldSize="Medium" Required="true" runat="server" Label="Email Address:" 
                HelpTitle="Please enter your email address" />
            </div>
            <div class="dataentryrow">
                <encore:TextBox ID="txtPassword" FieldSize="Medium" Required="true" runat="server" Label="Password:" TextMode="Password" 
                HelpTitle="Please enter your password"
                HelpText="If you have forgotten your password, <a href='user/forgotten.aspx'>click here</a>" />
            </div>
           <div class="buttonrow">
                <asp:Button ID="btnSubmit" runat="server" CssClass="button login" Text="Login" onclick="btnSubmit_Click"/>
            </div>
        </asp:Panel>
    </fieldset>
    <fieldset class="panel dataentry">
        <h3>Create an Account</h3>
         <div class="buttonrow">
             <asp:Button ID="btnNewAccount" CausesValidation="false" runat="server" CssClass="button save" Text="Create Account" 
                onclick="btnNewAccount_Click"/>
        </div>
     </fieldset>
</asp:Content>