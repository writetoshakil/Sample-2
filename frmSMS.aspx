<%@ Page Language="C#" MasterPageFile="~/mp.master" AutoEventWireup="true" CodeFile="frmSMS.aspx.cs" Inherits="frmSMS" Title="::.. SMS Page ..::" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderPublic" Runat="Server">
    <div style="width:100%">
        <div style="width:800px; margin-right:auto; margin-left:auto">
            <table style="width:800px">
                <tr>
                    <td colspan="2" style="text-align:center">  
                        <strong><span style="font-size: 10pt; font-family: Verdana">
                        SMS To Vendors</span> </strong>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center">  
                        <asp:Label ID="lblSMS" runat="server" CssClass="labelFont" ForeColor="Green" Text="Label"
                            Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center">  
                        <asp:GridView ID="gvVendor" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSr" runat="server" CssClass="labelFont"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Center" Width="50px" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Vendor Name" DataField="Name">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="275px" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Contact Person" DataField="ContactPerson">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="275px" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Mobile No" DataField="MobileNo">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="150px" />
                                </asp:BoundField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="cbHeader" runat="server" 
                                            oncheckedchanged="cbHeader_CheckedChanged" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbxSelect" runat="server" CssClass="checkBox" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Center" Width="50px" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:left; width:200px; vertical-align:top">
                        <span style="font-size: 10pt; font-family: Verdana"><strong>
                        SMS Text</strong></span>
                    </td>
                    <td style="text-align:left; width:600px">
                        <asp:TextBox ID="txtSMS" runat="server" CssClass="textBox" Height="75px" TextMode="MultiLine"
                            Width="600px">
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center">
                        <asp:Button ID="btnSMS" runat="server" CssClass="button" Text="Send SMS" OnClick="btnSMS_Click" /></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        &nbsp;</td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

