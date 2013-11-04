<%@ Page Title="" Language="C#" MasterPageFile="~/master/twocolumn.master" AutoEventWireup="true" Inherits="report_default" Codebehind="default.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ListView ID="rptReports" runat="server" DataSourceID="edsReports">
        <ItemTemplate>
            <div class="panel dataentry reportpanel clearfix">
                <h2><a href='detail.aspx?ID=<%#Eval("ID") %>'><%#Eval("Name") %></a></h2>
                <em><%#DataBinder.Eval(Container.DataItem, "CREATEDON", "{0:dd MMM yyyy}")%></em>: <%#Eval("RequestStatus")%>
                <div class="reportactions">
                    <asp:Button ID="btnGetData" CssClass="button search" CommandArgument='<%#Eval("ID") %>' runat="server" Visible='<%# (Eval("RequestStatus").ToString()==Encore.TaskManager.RequestStatus.New.ToString()) ? true : false %>' Text="Request Data" OnClick="btnGetData_Click" />
                    <asp:HyperLink ID="lnkViewData" CssClass="action data" runat="server" Visible='<%# (Eval("RequestStatus").ToString()==Encore.TaskManager.RequestStatus.Complete.ToString()) ? true : false %>' NavigateURL='<%# "viewreport.aspx?ID=" + Eval("ID") %>' Text="View Data" />
                    <asp:HyperLink ID="lnkViewGraph" CssClass="action graph" runat="server" Visible='<%# (Eval("RequestStatus").ToString()==Encore.TaskManager.RequestStatus.Complete.ToString()) ? true : false %>' NavigateURL='<%# "viewgraph.aspx?ID=" + Eval("ID") %>' Text="View Graph" />
                </div>
            </div>
        </ItemTemplate>
        
        <EmptyDataTemplate>
            <div class="panel">
                <p>You have not created any reports. <a href="detail.aspx">Click here</a> to create your first report.  </p>
            </div>
        </EmptyDataTemplate>
    </asp:ListView>
    <div class="pager">
        <asp:DataPager  ID="dpReports" runat="server" QueryStringField="Page" PagedControlID="rptReports" PageSize="10" >
           <Fields>
              <asp:NextPreviousPagerField FirstPageText="&lt;&lt;" ShowFirstPageButton="True" ShowNextPageButton="False" />
              <asp:NumericPagerField />
              <asp:NextPreviousPagerField LastPageText="&gt;&gt;" ShowLastPageButton="True" ShowPreviousPageButton="False" />
           </Fields>
        </asp:DataPager>
    </div>
    <asp:EntityDataSource ID="edsReports" runat="server" 
            ContextTypeName="EntityFramework.Entities" EnableFlattening="False" 
            EntitySetName="REPORTs"
            Where="it.DELETED==0 && it.SYSTEMUSERID==@UserID" OrderBy="it.NAME" EnableUpdate="false">
            <WhereParameters>
                <asp:ControlParameter ControlID="hdnUserID" Name="UserID" PropertyName="Value" Type="Int32"/>
          </WhereParameters>
    </asp:EntityDataSource>
    <asp:HiddenField ID="hdnUserID" runat="server" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SupportingContent" Runat="Server">
    <asp:panel runat="server" ID="pnlNewRecord" CssClass="panel noheader" DefaultButton="btnNewAccount">
        
        <div class="buttonrow">
            <asp:Button ID="btnNewAccount" CausesValidation="false" runat="server" 
                CssClass="button save" Text="Create New Report" onclick="btnNewAccount_Click" />
        </div>
    </asp:panel>
 
</asp:Content>

