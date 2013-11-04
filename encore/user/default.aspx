<%@ Page Title="Users" Language="C#" MasterPageFile="~/master/twocolumn.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="user_default" %>
<%@ Register Assembly="com.Encore.jControls" TagPrefix="encore" Namespace="com.Encore.jControls"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<encore:jGrid ID="UsersList" runat="server" Width="600" Height="300" Title="Users" DataURL="listdata.aspx" RowClickURL="detail.aspx">
    <Columns>
        <encore:jGridColumn Title="Name" Width="200" ColumnName="Name" Sortable="true" Searchable="true" />
        <encore:jGridColumn Title="Email Address" Width="400" ColumnName="Email" />
    </Columns>
</encore:jGrid>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SupportingContent" runat="server">
    <asp:panel runat="server" ID="pnlNewRecord" CssClass="panel noheader" DefaultButton="btnNewAccount">
        <div class="buttonrow">
            <asp:Button ID="btnNewAccount" CausesValidation="false" runat="server" 
                CssClass="button save" Text="Create User" onclick="btnNewAccount_Click" />
        </div>
    </asp:panel>
</asp:Content>