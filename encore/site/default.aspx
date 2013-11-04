<%@ Page Title="" Language="C#" MasterPageFile="~/master/twocolumn.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="site_default" %>
<%@ Register Assembly="com.Encore.jControls" TagPrefix="encore" Namespace="com.Encore.jControls"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<encore:jGrid ID="ProjectList" runat="server" Width="600" Height="300" Title="ENCORE Site Directory" DataURL="listdata.aspx" RowClickURL="detail.aspx">
    <Columns>
        <encore:jGridColumn Title="Name" Width="570" ColumnName="Name" Sortable="true" Searchable="true" />
    </Columns>
</encore:jGrid>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SupportingContent" runat="server">
   
</asp:Content>