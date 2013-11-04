<%@ Page Title="" Language="C#" MasterPageFile="~/master/twocolumn.master" AutoEventWireup="true" Inherits="site_default" Codebehind="default.aspx.cs" %>
<%@ Register Assembly="com.Encore.jControls" TagPrefix="encore" Namespace="com.Encore.jControls"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<encore:jGrid ID="ProjectList" runat="server" Width="600" Height="300" Title="ENCORE Site Directory" DataURL="listdata.aspx" RowClickURL="detail.aspx">
    <Columns>
        <encore:jGridColumn Title="Name" Width="570" ColumnName="Name" Sortable="true" Searchable="true" />
    </Columns>
</encore:jGrid>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SupportingContent" runat="server">
    <asp:panel runat="server" ID="pnlNewRecord" CssClass="panel noheader" DefaultButton="btnNewAccount">
        <div class="buttonrow">
            <asp:Button ID="btnNewAccount" CausesValidation="false" runat="server" 
                CssClass="button save" Text="Create Site" onclick="btnNewAccount_Click" />
        </div>
    </asp:panel>
</asp:Content>