<%@ Page Language="C#" MasterPageFile="~/mp.master" AutoEventWireup="true" CodeFile="frmERMSDocument.aspx.cs" Inherits="frmERMSDocument" Title="ERMS Documents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderPublic" Runat="Server">
    <div style="width:100%">
        <div style="width:800px; margin-left:auto; margin-right:auto">
            <table style="width:800px">
                <tr>
                    <td style="width:200px">
                        <span style="font-size: 8pt; font-family: Verdana">Select Box File</span></td>
                    <td colspan="2">
                        <asp:DropDownList ID="ddlBoxFile" runat="server" CssClass="textBox" Width="400px">
                        </asp:DropDownList></td>
                    <td style="width:200px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                    </td>
                    <td colspan="2" style="text-align: center">
                        <asp:Button ID="btnSelect" runat="server" CssClass="button" 
                            Text="Select Documents" OnClick="btnSelect_Click" /></td>
                    <td style="width: 200px">
                    </td>
                </tr>
                <tr>
                    <td colspan = "4" style="width:200px; text-align:center">
                        <asp:GridView ID="gvERMS" runat="server" AutoGenerateColumns="False" 
                            OnRowCommand="gvERMS_RowCommand" onrowdatabound="gvERMS_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSr" runat="server" CssClass="labelFont" Text="Label"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="documentid" HeaderText="Doc. ID">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:BoundField>
                                <asp:BoundField DataField="documenttype" HeaderText="Document Type">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="documentdescription" HeaderText="Description">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="status" HeaderText="Status">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="remarks" HeaderText="Remarks">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="filename" HeaderText="File Name">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Document">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hlFile" runat="server" CssClass="labelFont" Target="_blank">Browse Document</asp:HyperLink>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td style="width:200px">
                    </td>
                    <td style="width:200px">
                    </td>
                    <td style="width:200px">
                    </td>
                    <td style="width:200px">
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

