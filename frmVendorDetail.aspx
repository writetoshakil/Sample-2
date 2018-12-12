<%@ Page Language="C#" MasterPageFile="~/mp.master" AutoEventWireup="true" CodeFile="frmVendorDetail.aspx.cs" Inherits="frmVendorDetail" Title="Vendor Information" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderPublic" Runat="Server">
    <asp:MultiView ID="mv" runat="server">
        <asp:View ID="vwBook" runat="server">
            
            <table align="center" width="950">
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td colspan="2" style="font-size: small; font-family: Verdana; text-align:center; background-color:#333333; color:White">
                        <b>All Vendor&#39;s Detail</b></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                    </td>
                    <td style="width: 326px; text-align: left">
                    </td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
            </table>
            <table align="center" width="950">
                <tr>
                    <td style="width: 175px; text-align: left">
                    </td>
                    <td style="width: 600px; text-align: left">
                        <asp:GridView ID="gvLocation" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSr" runat="server" CssClass="labelFont"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="gridHeader" HorizontalAlign="Center" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Center" Width="30px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Name" HeaderText="Name">
                                    <HeaderStyle CssClass="gridHeader" HorizontalAlign="Center" />
                                    <ItemStyle CssClass="gridItem" Width="30px" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ContactPerson" HeaderText="Contact Person">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" Width="500px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ContactNo" HeaderText="Contact No">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:BoundField>
                                <asp:BoundField DataField="MobileNo" HeaderText="Mobile No">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        &nbsp;
                    </td>
                    <td style="width: 175px; text-align: left">
                    </td>
                </tr>
                
            </table>
        </asp:View>
        &nbsp; &nbsp;
    </asp:MultiView>
</asp:Content>

