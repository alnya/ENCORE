<%@ Page Title="" Language="C#" MasterPageFile="~/master/twocolumn.master" AutoEventWireup="true" Inherits="page_dashboard" Codebehind="dashboard.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="panel dataentry column leftcol" style="width:270px; text-align:center;">
    <img src="../css/img/icon/newreport.png" alt="New Report"/>
    <div class="buttonrow">
        <asp:Button ID="btnNewAccount" CausesValidation="false" runat="server" Width="98%"
            CssClass="button save" Text="Create New Report" onclick="btnNewReport_Click" />
    </div>
 </div>
<div class="panel dataentry column rightcol" style="width:270px;">
    <p>Fpr the purposes of testing, we can force the application to run a summary synchronization task:</p>
    <asp:Button ID="btnSyncSummaries"  CausesValidation="false" runat="server" Width="98%"
            CssClass="button delete" Text="Sync Summaries" onclick="btnSync_Click" />

    <p>For the purposes of testing, we can force the application to run a report retrieval task:</p>
    <asp:Button ID="btnProcessTasks"  CausesValidation="false" runat="server" Width="98%"
            CssClass="button delete" Text="Run Tasks" onclick="btnRunTasks_Click" />
    
 </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SupportingContent" Runat="Server">

     <h2>Welcome to ENCORE</h2>
    <div class="panel">
        <p>Lorem ipsum</p>
    </div>
</asp:Content>

