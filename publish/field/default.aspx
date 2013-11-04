<%@ Page Title="" Language="C#" MasterPageFile="~/master/twocolumn.master" AutoEventWireup="true" Inherits="field_default" Codebehind="default.aspx.cs" %>
<%@ Register Assembly="com.Encore.jControls" TagPrefix="encore" Namespace="com.Encore.jControls"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<encore:jGrid ID="ProjectList" runat="server" Width="600" Height="300" Title="ENCORE Field Dictionary" DataURL="listdata.aspx" RowClickURL="detail.aspx">
    <Columns>
        <encore:jGridColumn Title="Name" Width="470" ColumnName="Name" Sortable="true" Searchable="true" />
        <encore:jGridColumn Title="Unit" width="100" ColumnName="UNITNAME" />
    </Columns>
</encore:jGrid>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SupportingContent" runat="server">
    <asp:panel runat="server" ID="pnlNewRecord" CssClass="panel noheader">
        <div class="buttonrow">
            <asp:Button ID="btnNewGroup" CausesValidation="false" runat="server" 
                CssClass="button save" Text="Add New Field" 
                onclick="btnNewField_Click" />
        </div>
        <div class="buttonrow">
            <asp:Button ID="btnManageFields" CausesValidation="false" runat="server" 
                CssClass="button search" Text="Manage Field Units" 
                onclick="btnManageFields_Click" />
        </div>
         <div class="buttonrow">
            <asp:Button ID="btnManageGroups" CausesValidation="false" runat="server" 
                CssClass="button search" Text="Manage Field Groups" 
                 onclick="btnManageGroups_Click" />
        </div>
    </asp:panel>
</asp:Content>