<%@ Page Title="" Language="C#" MasterPageFile="~/master/twocolumn.master" AutoEventWireup="true" Inherits="site_detail" Codebehind="detail.aspx.cs" %>
<%@ Register src="~/controls/TextBoxControl.ascx" tagPrefix="encore" tagName="TextBox" %>
<%@ Register src="~/controls/SelectControl.ascx" tagPrefix="encore" tagName="Select" %>
<%@ Register src="~/controls/FormButtons.ascx" tagPrefix="encore" tagName="Buttons" %>

<%@ Register Assembly="com.Encore.jControls" TagPrefix="jquery" Namespace="com.Encore.jControls"%>
<%@ Register TagPrefix="encore" Namespace="com.Encore.jControls" Assembly="com.Encore.jControls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <jquery:jTabView runat="server" ID="tvTabs">
            <Tabs>
            <jquery:jTab ID="tab1" runat="server" Title="Details">
                <fieldset class="panel dataentry">
                    <div class="dataentryrow">
                        <encore:TextBox ID="txtSitename" FieldSize="Medium" Required="true" runat="server" Label="Site Name:"  />
                    </div>
                    <div class="dataentryrow">
                         <encore:TextBox ID="txtDescription" TextMode="MultiLine" FieldSize="Large" Required="true" runat="server" Label="Description:"   />
                    </div>
                    <div class="dataentryrow">
                         <encore:Select ID="ddlSiteType" runat="server" Label="Type:" DataTextField="NAME" DataValueField="ID" />
                    </div>
                </fieldset> 
            </jquery:jTab>
            <jquery:jTab ID="JTab2" runat="server" Title="Location">
                <fieldset class="panel dataentry">
                    <div class="dataentryrow">
                        <encore:TextBox ID="txtGMTOffset" FieldSize="Small" HelpTitle="Time Difference" HelpText="What is the number, in hours, difference from GMT?" DataType="Decimal" runat="server" Label="GMT Offset:"  />
                    </div>
                    <div class="dataentryrow">
                        <encore:TextBox ID="txtElevation" FieldSize="Small" runat="server" Label="Elevation:"  />
                    </div>
                    <div class="dataentryrow">
                        <encore:TextBox ID="txtCountry" FieldSize="Medium" runat="server" Label="Country:"  />
                    </div>
                    <div class="dataentryrow">
                         <encore:TextBox ID="txtLatitude" FieldSize="Small" runat="server" Label="Latitude / Longitude:" DataType="Decimal"   />
                         <encore:TextBox ID="txtLongitude" FieldSize="Small" runat="server" DataType="Decimal" />
                    </div>
                 </fieldset>
            </jquery:jTab>
            <jquery:jTab ID="tab3" runat="server" Title="Contacts">
                <fieldset class="panel dataentry">
                    <div class="buttonrow">
                        <asp:Button ID="btnNewAccount" CausesValidation="false" runat="server" 
                            CssClass="button save" Text="Add contact" onclick="btnNewContact_Click" />
                    </div>
                     <encore:jGrid ID="ContactsList" runat="server" Width="600" Height="200" Title="Site Contacts" DataURL="contactdata.aspx" RowClickURL="contact.aspx">
                        <Columns>
                            <encore:jGridColumn Title="Name" Width="570" ColumnName="Name" Sortable="true" Searchable="true" />
                        </Columns>
                    </encore:jGrid>
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