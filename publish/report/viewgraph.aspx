<%@ Page Title="" Language="C#" MasterPageFile="~/master/twocolumn.master" AutoEventWireup="true" Inherits="report_viewgraph" Codebehind="viewgraph.aspx.cs" %>
<%@ Register Src="../controls/Graphcontrol.ascx" TagPrefix="encore" TagName="Graph" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
   <h2><asp:Literal runat="server" ID="litReportName"/></h2>
   <encore:Graph DataURL="graphxml.aspx" ID="ResultsGraph" runat="server" GraphPath="../graphs/ZoomLine.swf" Width="630px" Height="500px" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SupportingContent" Runat="Server">
    <fieldset class="panel noheader dataentry">
        <asp:Panel ID="pnlReportTweak" runat="server">
            <div class="dataentryrow">
                
            </div>
            <div class="dataentryrow">
               
            </div>
           <div class="buttonrow">
                
            </div>
        </asp:Panel>
    </fieldset>
</asp:Content>