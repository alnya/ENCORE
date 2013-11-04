<%@ Page Title="" Language="C#" MasterPageFile="~/master/twocolumn.master" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="page_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
 <div class="panel dataentry column leftcol" style="width:270px; text-align:center;">
    <img src="../css/img/icon/newreport.png" alt="New Report"/>
    <div class="buttonrow">
        <asp:Button ID="btnNewAccount" CausesValidation="false" runat="server" Width="98%"
            CssClass="button save" Text="Create New Report" onclick="btnNewReport_Click" />
    </div>
 </div>
<div class="panel dataentry column rightcol" style="width:270px;">

 </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SupportingContent" Runat="Server">

     <h2>Welcome to ENCORE</h2>
    <div class="panel">
        <p>Lorem ipsum</p>
    </div>
</asp:Content>

