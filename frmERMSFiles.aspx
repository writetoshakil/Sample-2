<%@ Page Language="C#" MasterPageFile="~/mp.master" AutoEventWireup="true" CodeFile="frmERMSFiles.aspx.cs" Inherits="frmERMSFiles" Title="ERMS Box Files" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderPublic" Runat="Server">
    <div style="width:800px; margin-left:auto; margin-right:auto">
    <table style="width:800px">
        <tr>
            <td style="width:200px">
                <asp:Label ID="lblMessage" runat="server" CssClass="error_text" 
                    Text="No Documents Found of This File" Visible="False"></asp:Label>
            </td>
            <td colspan="2">
                &nbsp;</td>
            <td style="width:200px">
            </td>
        </tr>
        <tr>
            <td style="width: 200px; font-family: Verdana; font-size: 10pt;">
                File No :</td>
            <td colspan="3" style="text-align: left">
                <asp:Label ID="lblFileNo" runat="server" CssClass="labelFont"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 200px; font-family: Verdana; font-size: 10pt;">
                Subject :
            </td>
            <td colspan="3" style="text-align: left">
                <asp:Label ID="lblSubject" runat="server" CssClass="labelFont"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 200px; font-family: Verdana; font-size: 10pt;">
                End User :
            </td>
            <td colspan="3" style="text-align: left">
                <asp:Label ID="lblEndUser" runat="server" CssClass="labelFont"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 200px; font-family: Verdana; font-size: 10pt;">
                Event :</td>
            <td colspan="3" style="text-align: left">
                <asp:Label ID="lblEvent" runat="server" CssClass="labelFont"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 200px; font-family: Verdana; font-size: 10pt;">
                Type :
            </td>
            <td colspan="3" style="text-align: left">
                <asp:Label ID="lblType" runat="server" CssClass="labelFont"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 200px; font-family: Verdana; font-size: 10pt;">
                Request Approval Date :
            </td>
            <td colspan="2" style="text-align: left">
                <asp:Label ID="lblRequestApprovalDate" runat="server" CssClass="labelFont"></asp:Label>
            </td>
            <td style="width: 200px">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan = "4" style="width:200px; text-align:center">
                <asp:GridView ID="gvERMS" runat="server" AutoGenerateColumns="False" 
                    onrowcommand="gvERMS_RowCommand" onrowdatabound="gvERMS_RowDataBound">
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
                                <asp:HyperLink ID="HlFile" runat="server" CssClass="labelFont" Target="_blank">Browse Document</asp:HyperLink>
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
</asp:Content>

