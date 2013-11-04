<%@ Page Title="" Language="C#" MasterPageFile="~/master/global.master" AutoEventWireup="true" Inherits="report_viewreport" Codebehind="viewreport.aspx.cs" %>
<%@ Register TagPrefix="encore" Namespace="com.Encore.jControls" Assembly="com.Encore.jControls" %>

<asp:Content ID="changePasswordContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h1>Report Data</h1>
        <h2><asp:Literal ID="litReportTitle" runat="server" /></h2>
        <encore:jGrid ID="ReportGrid" runat="server" Width="980" Height="400" DataURL="reportdata.aspx">
            <Columns>
                <encore:jGridColumn Title="Date" ColumnName="valuedate" Width="100"></encore:jGridColumn>
                <encore:jGridColumn Title="Site" ColumnName="site" Width="100"></encore:jGridColumn>
            </Columns>
        </encore:jGrid>
        <asp:panel runat="server" ID="pnlNewRecord">
        <div class="buttonrow">
            <asp:HyperLink ID="hlDownload" NavigateUrl="download.aspx" CssClass="button save lightbox" runat="server">Download to Excel</asp:HyperLink>
        </div>
    </asp:panel>
    </div>
</asp:Content>