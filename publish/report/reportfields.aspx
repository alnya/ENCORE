<%@ Page Title="" Language="C#" MasterPageFile="~/master/lightbox.master" AutoEventWireup="true" CodeBehind="reportfields.aspx.cs" Inherits="encore.web.report.reportfields" %>
<%@ Register src="~/controls/TextBoxControl.ascx" tagPrefix="encore" tagName="TextBox" %>
<%@ Register src="~/controls/SelectControl.ascx" tagPrefix="encore" tagName="Select" %>
<%@ Register src="~/controls/FormButtons.ascx" tagPrefix="encore" tagName="Buttons" %>
<%@ Register Assembly="com.Encore.jControls" TagPrefix="jquery" Namespace="com.Encore.jControls"%>

<asp:Content ID="Content1" ContentPlaceHolderID="LightBoxContent" runat="server">
<script type="text/javascript" src="../js/sitespecific.js"></script>
    <h1>Report Fields</h1>
    <jquery:jTabView runat="server" ID="tvTabs">
        <Tabs>
            <jquery:jTab ID="tab1" runat="server" Title="By Project">
                <fieldset class="panel dataentry">
                    <encore:Select ID="ddlProject" Label="Project" BlankFirstRow="true" runat="server" DataTextField="NAME" DataValueField="ID"  />


                </fieldset> 
            </jquery:jTab>
            <jquery:jTab ID="tab2" runat="server" Title="By Group">
                 <fieldset class="panel dataentry">
                    <encore:Select ID="ddlGroup" Label="Group" BlankFirstRow="true" runat="server" DataTextField="NAME" DataValueField="ID"  />
                    

                </fieldset> 
            </jquery:jTab>
        </Tabs>
    </jquery:jTabView> 
    <encore:Buttons ID="btnFormButtons" runat="server" LightBoxMode="true" OnSave="btnSubmit_Click" />
    <script language="javascript" type="text/javascript">
        Encore.setupTabs();
    </script>
</asp:Content>