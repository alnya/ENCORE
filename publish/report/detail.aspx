<%@ Page Title="" Language="C#" MasterPageFile="~/master/global.master" AutoEventWireup="true" Inherits="report_detail" Codebehind="detail.aspx.cs" %>
<%@ Register src="~/controls/TextBoxControl.ascx" tagPrefix="encore" tagName="TextBox" %>
<%@ Register src="~/controls/SelectControl.ascx" tagPrefix="encore" tagName="Select" %>
<%@ Register src="~/controls/FormButtons.ascx" tagPrefix="encore" tagName="Buttons" %>
<%@ Register Assembly="com.Encore.jControls" TagPrefix="jquery" Namespace="com.Encore.jControls"%>
<%@ MasterType virtualpath="~/master/global.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div class="clearfix">
       <div class="column leftcol"> 
            <h1><asp:Literal ID="litTitle" runat="server" /></h1>
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
        </div>
        <div class="column rightcol">
            <div class="panel infopanel" style="margin-top:65px">
                <p id="reportsummarycontent">Choose fields and sites for your report</p>
            </div>
        </div>
    </div>
    <div class="clearfix">

    <jquery:jTabView runat="server" ID="tvTabs">
        <Tabs>
            <jquery:jTab ID="tab1" runat="server" Title="Fields">
                <fieldset class="panel dataentry">
                    <div class="dataentryrow clearfix">
                        <div class="column" style="width:25%">
                            <encore:Select Label="Fields from Project" ID="ddlProject" FieldSize="Small" BlankFirstRow="true" runat="server" DataTextField="NAME" DataValueField="ID" />
                        </div>
                        <div class="column">
                            <encore:Select Label="Fields from Group" ID="ddlGroup" FieldSize="Small" BlankFirstRow="true" runat="server" DataTextField="NAME" DataValueField="ID" />
                        </div> 
                   </div>
                   <div class="dataentryrow clearfix">
                        <input type="hidden" id="jsReportFields_value" runat="server" />
                        <input type="hidden" id="jsReportFields_text" runat="server" />
                        <input type="hidden" id="jsReportFields_changed" runat="server" />

                        <ul id="fieldsAtoZ" class="atoz clearfix">    
					        <li><a href="#A">A</a></li><li><a href="#B">B</a></li><li><a href="#C">C</a></li><li><a href="#D">D</a></li><li><a href="#E">E</a></li><li><a href="#F">F</a></li><li><a href="#G">G</a></li><li><a href="#H">H</a></li><li><a href="#I">I</a></li><li><a href="#J">J</a></li><li><a href="#K">K</a></li><li><a href="#L">L</a></li><li><a href="#M">M</a></li><li><a href="#N">N</a></li><li><a href="#O">O</a></li><li><a href="#P">P</a></li><li><a href="#Q">Q</a></li><li><a href="#R">R</a></li><li><a href="#S">S</a></li><li><a href="#T">T</a></li><li><a href="#U">U</a></li><li><a href="#V">V</a></li><li><a href="#W">W</a></li><li><a href="#X">X</a></li><li><a href="#Y">Y</a></li><li><a href="#Z">Z</a></li><li><a href="#all">all</a></li>
				        </ul>
                        <ul id="jsReportFields_src" class="connected_siteslist droplist panelscroll droplistsource"></ul>
                        <ul id="jsReportFields_selected" runat="server" class="connected_siteslist droplist panelscroll droplisttarget"></ul>
                        <script language="javascript" type="text/javascript">
                            function SearchFields(searchphrase) {
                                var projectID = !$('#<%=ddlProject.ClientID %>').val()  ? 0 : $('#<%=ddlProject.ClientID %>').val();
                                var groupID = !$('#<%=ddlGroup.ClientID %>').val() ? 0 : $('#<%=ddlGroup.ClientID %>').val();

                                $.ajax({
                                    type: "POST",
                                    url: "AJAXTools.aspx/GetFields",
                                    data: " { letter: '" + searchphrase + "', projectID:" + projectID + ", groupID: " + groupID + "}",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (data) {
                                        var items = [];
                                        var currentlySelected = $('#<%=jsReportFields_value.ClientID %>').val().split(',');
                                        if (data != null && data.d != null) {
                                            var response = jQuery.parseJSON(data.d);
                                            jQuery.each(response, function () {
                                                if (jQuery.inArray(this.Value, currentlySelected) < 0) {
                                                    items.push('<li title="' + this.Description + '" id="' + this.Value + '">' + this.Name + '</li>');
                                                }
                                            });
                                            $('#jsReportFields_src').empty().append(items.join(''));
                                        }
                                    }
                                });
                            }

                            function GetSelectionSummary() {
                                var sites = $('#jsReportSites_value').val();
                                var fields = $('#<%=jsReportFields_value.ClientID %>').val();

                                if (sites == '' && fields == '') {
                                    $('#reportsummarycontent').html('Choose fields and sites for your report');
                                    return;
                                }

                                $.ajax({
                                    type: "POST",
                                    url: "AJAXTools.aspx/GetReportSummary",
                                    data: " { sites: '" + sites + "', fields:'" + fields + "'}",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (data) {
                                        if (data != null && data.d != null) {
                                            var response = jQuery.parseJSON(data.d);
                                            if (response == null) {
                                                $('#reportsummarycontent').html('There are no data for this report definition');
                                            }
                                            else {
                                                $('#reportsummarycontent').html(response.RowCount + ' rows of data from ' + response.MinDate + ' to ' + response.MaxDate);
                                            }
                                        }
                                    }
                                });
                            }

                            $('#<%=ddlProject.ClientID %>').change(function() { SearchFields('all'); });
                            $('#<%=ddlGroup.ClientID %>').change(function () { SearchFields('all'); });

                            $('#<%=jsReportFields_value.ClientID %>').change(function () { GetSelectionSummary(); });
                            $('#jsReportSites_value').change(function () { GetSelectionSummary(); });
                            
                            $(function () {
                                $('#jsReportFields_src').bind('sortcreate', function (event, ui) {
                                    SetValues(this, 'MainContent_jsReportFields', false);
                                });
                                $('#jsReportFields_src, #<%=jsReportFields_selected.ClientID %>').sortable(
                                    { connectWith: '.connected_siteslist' }).disableSelection();
                                $('#<%=jsReportFields_selected.ClientID %>').bind('sortreceive', function (event, ui) {
                                    SetValues(this, 'MainContent_jsReportFields', true);
                                });
                                $('#<%=jsReportFields_selected.ClientID %>').bind('sortremove', function (event, ui) {
                                    SetValues(this, 'MainContent_jsReportFields', true);
                                });
                                $('#fieldsAtoZ a').click(function (event) {
                                    $('#fieldsAtoZ a').removeClass('selected');
                                    event.preventDefault();
                                    SearchFields($(this).attr('href').split('#')[1]);
                                    $(this).addClass('selected');
                                });
                            });
                        </script>
                   </div>
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
</div>
</asp:Content>