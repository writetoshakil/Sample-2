<%@ Page Language="C#" MasterPageFile="~/mp.master" AutoEventWireup="true" CodeFile="frmLocation.aspx.cs" Inherits="frmLocation" Title="Location Information" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderPublic" Runat="Server">
    <asp:MultiView ID="mv" runat="server">
        <asp:View ID="vwBook" runat="server">
            
            <table align="center" width="950">
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td colspan="2" style="font-size: small; font-family: Verdana; text-align:center; background-color:#333333; color:White">
                        <strong>
                            Add New File Location</strong></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Description</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtLocation" runat="server" CssClass="textBox" Width="326px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLocation"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 39px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 39px;">
                    </td>
                    <td style="width: 326px; text-align:right; height: 39px;">
                        <asp:ImageButton ID="ImageButton2" runat="server" Height="31px" ImageUrl="~/images/Save.jpg"
                            OnClick="ImageButton2_Click" Width="74px" />&nbsp;</td>
                    <td style="width: 237px; text-align: left; height: 39px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                    </td>
                    <td style="width: 326px; text-align: left">
                        <asp:Label ID="lblError" runat="server" CssClass="error_text"></asp:Label></td>
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
                                <asp:BoundField DataField="locationid" HeaderText="ID">
                                    <HeaderStyle CssClass="gridHeader" HorizontalAlign="Center" />
                                    <ItemStyle CssClass="gridItem" Width="30px" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Description" HeaderText="Description">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" Width="500px" />
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

