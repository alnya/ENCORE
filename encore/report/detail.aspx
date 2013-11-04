<%@ Page Title="" Language="C#" MasterPageFile="~/master/twocolumn.master" AutoEventWireup="true" CodeFile="detail.aspx.cs" Inherits="report_detail" %>
<%@ Register src="~/controls/TextBoxControl.ascx" tagPrefix="encore" tagName="TextBox" %>
<%@ Register src="~/controls/SelectControl.ascx" tagPrefix="encore" tagName="Select" %>
<%@ Register src="~/controls/FormButtons.ascx" tagPrefix="encore" tagName="Buttons" %>
<%@ Register Assembly="com.Encore.jControls" TagPrefix="jquery" Namespace="com.Encore.jControls"%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <fieldset class="panel dataentry">
        <div class="dataentryrow">
            <encore:TextBox ID="txtName" FieldSize="Medium" Required="true" runat="server" Label="Report Name:"
            HelpTitle="Report Name"
            HelpText="This name will be used to identify the report"  />
        </div>
        <div class="dataentryrow">
            <encore:TextBox ID="txtDateFrom" FieldSize="Small" Required="true" runat="server" Label="Date Range:" DataType="DateTime"  />
            - <encore:TextBox ID="txtDateTo" FieldSize="Small" Required="true" runat="server" DataType="DateTime"  />
        </div>
    </fieldset> 
   
    <jquery:jTabView runat="server" ID="tvTabs">
            <Tabs>
            <jquery:jTab ID="tab1" runat="server" Title="Fields">
                <fieldset class="panel dataentry">
                     <jquery:jSortable runat="server" ID="jsReportFields" CssClass="connected_fields" DataURL="../field/fielddata.aspx"/>
                </fieldset> 
            </jquery:jTab>
            <jquery:jTab ID="tab2" runat="server" Title="Sites">
                 <fieldset class="panel dataentry">
                    <jquery:jSortable runat="server" ID="jsReportSites" CssClass="connected_sites" DataURL="../site/sitedata.aspx"/>
                </fieldset> 
            </jquery:jTab>
        </Tabs>
    </jquery:jTabView>
       
    <encore:Buttons ID="btnFormButtons" runat="server" OnSave="btnSubmit_Click" OnDelete="btnDelete_Click" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SupportingContent" Runat="Server">
    <h2>Report Summary</h2>
    <div class="panel infopanel">
        <p>This report will return xxx rows, xx% with data</p>
    </div>
     <h2>Help</h2>
    <div class="panel">
        <p>Lorem ipsum</p>
    </div>
</asp:Content>