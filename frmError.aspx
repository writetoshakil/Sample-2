<%@ Page Language="C#" MasterPageFile="~/mp.master" AutoEventWireup="true" CodeFile="frmError.aspx.cs" Inherits="frmError" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderPublic" Runat="Server">
    <asp:MultiView ID="mv" runat="server">
        <asp:View ID="vwBook" runat="server">
            <span style="font-size: 8pt; color: red; font-family: Verdana"></span>
            <asp:Label ID="lblMessage" runat="server" CssClass="labelFont"></asp:Label><br />
            <br />
            <br />
            <br />
            <br />
        </asp:View>
        &nbsp;&nbsp;
    </asp:MultiView>
</asp:Content>

