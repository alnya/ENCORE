<%@ Page Title="" Language="C#" MasterPageFile="~/master/twocolumn.master" AutoEventWireup="true" CodeFile="detail.aspx.cs" Inherits="site_detail" %>
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
                        <encore:TextBox ID="txtSitename" FieldSize="Medium" Required="true" runat="server" Label="Site Name:"  />
                    </div>
                    <div class="dataentryrow">
                         <encore:TextBox ID="txtDescription" TextMode="MultiLine" FieldSize="Large" Required="true" runat="server" Label="Description:"   />
                    </div>
                     <div class="dataentryrow">
                         <encore:TextBox ID="txtLatitude" FieldSize="Small" runat="server" Label="Latitude / Longitude:" DataType="Decimal"   />
                         <encore:TextBox ID="txtLongitude" FieldSize="Small" runat="server" DataType="Decimal" />
                    </div>
                </fieldset> 
            </jquery:jTab>
            <jquery:jTab ID="tab2" runat="server" Title="Contacts">
                <fieldset class="panel dataentry">
                     
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