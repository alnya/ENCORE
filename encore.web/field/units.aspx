<%@ Page Title="" Language="C#" MasterPageFile="~/master/twocolumn.master" AutoEventWireup="true" Inherits="field_units" Codebehind="units.aspx.cs" %>
<%@ Register src="~/controls/TextBoxControl.ascx" tagPrefix="encore" tagName="TextBox" %>
<%@ Register src="~/controls/SelectControl.ascx" tagPrefix="encore" tagName="Select" %>
<%@ Register src="~/controls/FormButtons.ascx" tagPrefix="encore" tagName="Buttons" %>
<%@ Register TagPrefix="encore" Namespace="com.Encore.jControls" Assembly="com.Encore.jControls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <asp:Panel ID="pnlFields" runat="server" Visible="false">  
    <fieldset class="panel dataentry">
        <div class="dataentryrow">
            <encore:TextBox ID="txtName" FieldSize="Medium" Required="true" runat="server" Label="Unit :"  />
        </div>
        <div class="dataentryrow">
             <encore:Select ID="ddlDateType" runat="server" Label="Data Type:" />
        </div>
         <div class="dataentryrow">
            <encore:TextBox ID="txtDescription" TextMode="MultiLine" FieldSize="Large" Required="false" runat="server" Label="Description:"   />
        </div>
        <encore:Buttons ID="btnFormButtons" runat="server" OnSave="btnSubmit_Click" OnDelete="btnDelete_Click" />
    </fieldset>
  </asp:Panel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SupportingContent" Runat="Server">
     <h2></h2>
     <div class="panel">
        <div class="buttonrow">
            <asp:button ID="btnNewUnit" CausesValidation="false" Text="Add New Unit" runat="server" CssClass="button save" OnClick="btnNewUnit_Click" />
        </div>
        <encore:jGrid ID="UnitList" runat="server" Width="330" Height="300" Title="Units" DataURL="unitdata.aspx" RowClickURL="units.aspx">
            <Columns>
                <encore:jGridColumn Title="Unit" Width="300" ColumnName="Name" Sortable="true" Searchable="true" />
            </Columns>
        </encore:jGrid>
     </div>
</asp:Content>