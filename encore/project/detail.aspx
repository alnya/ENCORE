<%@ Page Title="" Language="C#" MasterPageFile="~/master/twocolumn.master" AutoEventWireup="true" CodeFile="detail.aspx.cs" Inherits="project_detail" %>
<%@ Register src="~/controls/TextBoxControl.ascx" tagPrefix="encore" tagName="TextBox" %>
<%@ Register src="~/controls/SelectControl.ascx" tagPrefix="encore" tagName="Select" %>
<%@ Register src="~/controls/FormButtons.ascx" tagPrefix="encore" tagName="Buttons" %>

<%@ Register Assembly="com.Encore.jControls" TagPrefix="jquery" Namespace="com.Encore.jControls"%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <jquery:jTabView runat="server" ID="tvTabs">
            <Tabs>
            <jquery:jTab ID="tab1" runat="server" Title="Details">
                <fieldset class="panel dataentry">
                    <div class="dataentryrow">
                        <encore:TextBox ID="txtName" FieldSize="Medium" Required="true" runat="server" Label="Site Name:"
                        HelpTitle="Project Name"
                        HelpText="This name will be used to identify the project"  />
                    </div>
                    <div class="dataentryrow">
                         <encore:TextBox ID="txtDescription" TextMode="MultiLine" FieldSize="Large" Required="true" runat="server" Label="Description:"   />
                    </div>
                     <div class="dataentryrow">
                        <encore:TextBox ID="txtURL" FieldSize="Medium" Required="true" runat="server" Label="Project URL:"
                        HelpTitle="Project URL"
                        HelpText="This is the URL of the project to load.  It should be the root of the project (e.g. 'http://ceh.ac.uk/nitroeurope/')"  />
                        <input type="button" ID="btnTest" runat="server" class="button search" Value="Test" />
                    </div>
                </fieldset> 
            </jquery:jTab>
            <jquery:jTab ID="tab2" runat="server" Title="Terms & Conditions">
                <fieldset class="panel dataentry">
                    <encore:TextBox ID="txtTerms" TextMode="MultiLine" FieldSize="Large" runat="server" Label="Terms and Conditions:" 
                    HelpTitle="Enter Terms and Conditions"
                    HelpText="Terms and conditions of viewing data from this project (this will be displayed to each used, and must be accepted any time it is changed)"  />
                </fieldset>
            </jquery:jTab>
        </Tabs>
    </jquery:jTabView>
       
    <encore:Buttons ID="btnFormButtons" runat="server" OnSave="btnSubmit_Click" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SupportingContent" runat="server">
    <h2>Help</h2>
    <div class="panel">
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
        <div class="buttonrow">
            <asp:Button ID="btnManageFields" CausesValidation="false" runat="server" 
                CssClass="button search" Text="Manage Project Fields" Visible="false"
                onclick="btnManageFields_Click" />
        </div>
         <div class="buttonrow">
            <asp:Button ID="btnManageSites" CausesValidation="false" runat="server" 
                CssClass="button search" Text="Manage Project Sites" Visible="false"
                 onclick="btnManageSites_Click" />
        </div>
    </div>
</asp:Content>