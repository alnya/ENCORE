<%@ Page Title="" Language="C#" MasterPageFile="~/master/global.master" AutoEventWireup="true" Inherits="project_fields" Codebehind="fields.aspx.cs" %>
<%@ Register src="~/controls/TextBoxControl.ascx" tagPrefix="encore" tagName="TextBox" %>
<%@ Register src="~/controls/SelectControl.ascx" tagPrefix="encore" tagName="Select" %>
<%@ Register src="~/controls/FormButtons.ascx" tagPrefix="encore" tagName="Buttons" %>
<%@ Register Assembly="com.Encore.jControls" TagPrefix="jquery" Namespace="com.Encore.jControls"%>
<%@ MasterType virtualpath="~/master/global.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<h1><asp:Literal ID="litTitle" runat="server" /></h1>
<h2><asp:Literal ID="litProjectTitle" runat="server" /> </h2>
 <fieldset class="panel dataentry clearfix">
    <asp:Repeater ID="rptMatch" runat="server">
        <HeaderTemplate>
            <div class="mappingheader">
                <h2><span class="src">Source Field</span> <span>Encore Field</span></h2>
            </div>
            <ul class="panelscroll mappinglist">            
        </HeaderTemplate>
        <ItemTemplate>
            <li id="<%#Eval("ID") %>" map="<%#Eval("FIELDID") %>">
                <span title='<%# Eval("DESCRIPTION") %>' class="src"><%#Eval("NAME") %> (<%#Eval("UNIT") %>)</span><span class="map"></span>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>
    <div class="buttonrow">
      <asp:Button ID="btnSync" runat="server" CssClass="button search" Text="Synchronise" onclick="btnSync_Click" />
    </div>
 </fieldset>
 <encore:Buttons ID="btnFormButtons" runat="server" ShowCancel="true" ShowSave="false" ShowDelete="false" />
    
 <script type="text/javascript" src="../js/dictionary.js"></script>
 <script type="text/javascript" language="javascript">
     $(document).ready(function() {
         EncoreDictionary.Init( <asp:Literal ID="fieldJSON" runat="server" /> , 'addfield.aspx');
     }); 
</script>
</asp:Content>
