<%@ Page Title="" Language="C#" MasterPageFile="~/master/twocolumn.master" AutoEventWireup="true" CodeFile="mydetails.aspx.cs" Inherits="user_mydetails" %>
<%@ Register src="~/controls/TextBoxControl.ascx" tagPrefix="encore" tagName="TextBox" %>
<%@ Register src="~/controls/SelectControl.ascx" tagPrefix="encore" tagName="Select" %>
<%@ Register src="~/controls/FormButtons.ascx" tagPrefix="encore" tagName="Buttons" %>

<%@ Register Assembly="com.Encore.jControls" TagPrefix="jquery" Namespace="com.Encore.jControls"%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <jquery:jTabView runat="server" ID="tvTabs">
            <Tabs>
            <jquery:jTab ID="tab1" runat="server" Title="Security">
                <fieldset class="panel dataentry">
                    <div class="dataentryrow">
                        <encore:TextBox ID="txtEmailAddress" FieldSize="Medium" DataType="EmailAddress" Required="true" runat="server" Label="Email Address:" 
                            HelpTitle="Please enter a valid email address" 
                            HelpText="This email address will be used to log into the site and for all communication." />
                    </div>
                    <div class="dataentryrow">
                        <encore:TextBox ID="txtPassword" FieldSize="Medium" Required="false" runat="server" Label="Change Password:" 
                        TextMode="Password"  
                        HelpTitle="User Password" 
                        HelpText="Entering a password here will change your login password." />
                    </div>
                    <div class="dataentryrow">
                         <encore:TextBox ID="txtName" FieldSize="Medium" Required="true" runat="server" Label="Name:"   />
                    </div>
                </fieldset> 
            </jquery:jTab>
            <jquery:jTab ID="tab2" runat="server" Title="Organisation">
                <fieldset class="panel dataentry">
                     <div class="dataentryrow">
                         <encore:TextBox ID="txtOrganisation" FieldSize="Medium" Required="false" runat="server" 
                         Label="Name of your Organisation:" />
                    </div>
                    <div class="dataentryrow">
                       <encore:TextBox ID="txtAreaOfResearch" FieldSize="Large" TextMode="MultiLine" Required="false" runat="server" 
                         Label="Area Of Research:" />
                    </div>
                </fieldset>
            </jquery:jTab>
            <jquery:jTab ID="tab3" runat="server" Title="Social Media">
                <fieldset class="panel dataentry">
                    <div class="dataentryrow">
                         <encore:TextBox ID="txtURL" FieldSize="Medium" runat="server" Label="URL:"   />
                    </div>
                    <div class="dataentryrow">
                         <encore:TextBox ID="txtTwitter" FieldSize="Medium" runat="server" Label="Twitter Username:"   />
                    </div>
                    <div class="dataentryrow">
                         <encore:TextBox ID="txtFacebook" FieldSize="Medium" runat="server" Label="Facebook URL:"   />
                    </div>
                    <div class="dataentryrow">
                         <encore:TextBox ID="txtLinkedIn" FieldSize="Medium" runat="server" Label="Linked In Profile:"   />
                    </div>
                </fieldset>
            </jquery:jTab>
        </Tabs>
    </jquery:jTabView>
       
    <encore:Buttons ID="btnFormButtons" runat="server" OnSave="btnSubmit_Click" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SupportingContent" runat="server">
    <h2>Help</h2>
    <div class="panel">
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc gravida imperdiet dui. Donec posuere, purus vel ultrices consequat, dui massa iaculis leo, vitae facilisis libero dolor eget diam. Vestibulum bibendum venenatis leo in varius. Maecenas et pellentesque est. In auctor mi ac tortor lobortis porttitor. Phasellus sit amet sagittis orci. Vestibulum id felis id odio feugiat eleifend. Sed sed lectus mi. Sed vitae massa felis. Maecenas id tellus in lorem facilisis eleifend eget quis odio. Sed turpis diam, varius eget dapibus non, tincidunt congue quam. Mauris vel elit lacus.</p>
    </div>
</asp:Content>