<%@ Page Title="" Language="C#" MasterPageFile="~/master/twocolumn.master" AutoEventWireup="true" CodeFile="groups.aspx.cs" Inherits="field_groups" %>
<%@ Register Assembly="com.Encore.jControls" TagPrefix="encore" Namespace="com.Encore.jControls"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<encore:jGrid ID="ProjectList" runat="server" Width="600" Height="300" Title="Field Groups" DataURL="groupdata.aspx" RowClickURL="group.aspx">
    <Columns>
        <encore:jGridColumn Title="Name" Width="470" ColumnName="Name" Sortable="true" />
    </Columns>
</encore:jGrid>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SupportingContent" runat="server">
    <asp:panel runat="server" ID="pnlNewRecord" CssClass="panel noheader">
        <div class="buttonrow">
            <asp:Button ID="btnNewGroup" CausesValidation="false" runat="server" 
                CssClass="button save" Text="Add New Group" 
                onclick="btnNewGroup_Click" />
        </div>
    </asp:panel>
</asp:Content>