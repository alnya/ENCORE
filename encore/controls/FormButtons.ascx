<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FormButtons.ascx.cs" Inherits="controls_FormButtons" %>
<div class="buttonrow">
    <asp:HiddenField runat="server" ID="hdnID"/>
    <asp:Button ID="btnCancel" CausesValidation="false" OnClientClick="history.back(); return false;" runat="server" CssClass="button cancel" Text="Cancel" />
    <asp:Button ID="btnDelete" Visible="false" runat="server" 
        CssClass="button delete" Text="Delete" CausesValidation="false" 
        OnClientClick="return confirm('This will delete this record.  Are you sure?');" 
        onclick="btnDelete_Click"/>
    <asp:Button ID="btnSubmit" runat="server" CssClass="button save" Text="Save" 
        onclick="btnSubmit_Click"/>
</div>