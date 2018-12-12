<%@ Page Language="C#" MasterPageFile="~/mp.master" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" Title="Untitled Page" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderPublic" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" Height="150px" ScrollBars="Vertical" 
        Width="326px">
        <asp:CheckBoxList ID="CheckBoxList1" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="Name" 
            DataValueField="VendorID" CssClass="checkBox" Width="326px">
        </asp:CheckBoxList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:PurchaseConnectionString %>" 
            SelectCommand="SELECT [VendorID], [Name] FROM [tblVendor]">
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

