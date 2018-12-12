<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmFollowUpReport.aspx.cs" Inherits="frmFollowUpReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Follow Up Report</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" width="100%">
            <tr>
                <td style="width: 100%; text-align: center">
                </td>
            </tr>
            <tr>
                <td style="width: 100%; text-align: center">
                    <strong><span style="font-size: 10pt; font-family: Verdana">Follow Up Report</span></strong>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 100%; text-align: center">
                    <table style="width:100%">
                        <tr>
                            <td style="width:14.29%">
                            </td>
                            <td style="width:14.29%">
                            </td>
                            <td style="width:14.29%; text-align: left;">
                                <span style="font-size: 8pt; font-family: Verdana">Select Option 1</span></td>
                            <td style="width:14.29%">
                                <asp:DropDownList ID="ddlOption1" runat="server" CssClass="textBox" Width="150px">
                                    <asp:ListItem Value="FileNo">File No</asp:ListItem>
                                    <asp:ListItem>Subject</asp:ListItem>
                                    <asp:ListItem Value="description">End User</asp:ListItem>
                                    <asp:ListItem>Remarks</asp:ListItem>
                                    <asp:ListItem Value="FollowUpRemarks">Follow Up Remarks</asp:ListItem>
                                </asp:DropDownList></td>
                            <td style="width:14.29%; text-align: left;">
                                <asp:TextBox ID="txtOption1" runat="server" CssClass="textBox"></asp:TextBox></td>
                            <td style="width:14.29%">
                                </td>
                            <td style="width:14.29%">
                            </td>
                            
                        </tr>
                        <tr>
                            <td style="width: 14.29%">
                            </td>
                            <td style="width: 14.29%">
                            </td>
                            <td style="width: 14.29%; text-align: left;">
                                <span style="font-size: 8pt; font-family: Verdana">Select Option 2</span></td>
                            <td style="width: 14.29%"><asp:DropDownList ID="ddlOption2" runat="server" CssClass="textBox" Width="150px">
                                <asp:ListItem Value="fileno">File No</asp:ListItem>
                                <asp:ListItem>Subject</asp:ListItem>
                                <asp:ListItem Value="Description">End User</asp:ListItem>
                                <asp:ListItem>Remarks</asp:ListItem>
                                <asp:ListItem Value="FollowUpRemarks">Follow Up Remarks</asp:ListItem>
                            </asp:DropDownList></td>
                            <td style="width: 14.29%; text-align: left;">
                                <asp:TextBox ID="txtOption2" runat="server" CssClass="textBox"></asp:TextBox></td>
                            <td style="width: 14.29%">
                            </td>
                            <td style="width: 14.29%">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 14.29%; height: 19px;">
                            </td>
                            <td style="width: 14.29%; height: 19px;">
                            </td>
                            <td style="width: 14.29%; height: 19px;">
                            </td>
                            <td style="width: 14.29%; height: 19px;">
                                <asp:Button ID="btnFilter" runat="server" CssClass="button" Text="Filter" Width="150px" OnClick="btnFilter_Click" /></td>
                            <td style="width: 14.29%; height: 19px;">
                                <asp:LinkButton ID="lblGoBack" runat="server" CssClass="labelFont" OnClick="lblGoBack_Click">Go Back</asp:LinkButton></td>
                            <td style="width: 14.29%; height: 19px;">
                            </td>
                            <td style="width: 14.29%; height: 19px;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 14.29%">
                            </td>
                            <td style="width: 14.29%">
                            </td>
                            <td style="width: 14.29%">
                            </td>
                            <td style="width: 14.29%">
                                <asp:Button ID="btnDownload" runat="server" OnClick="btnDownload_Click" Text="Download Excel" BackColor="White" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" CssClass="button" /></td>
                            <td style="width: 14.29%">
                                <asp:Label ID="lblError" runat="server" CssClass="error_text"></asp:Label>
                            </td>
                            <td style="width: 14.29%">
                            </td>
                            <td style="width: 14.29%">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 100%; margin-left:auto; margin-right:auto; text-align:center; vertical-align:middle">
                    <div style="margin-right:auto; margin-left:auto">
                    <asp:GridView ID="gvFollowUp" runat="server" AutoGenerateColumns="False" OnRowCommand="gvFollowUp_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Sr">
                                <ItemTemplate>
                                    <asp:Label ID="lblSr" runat="server" CssClass="labelFont"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="RemarksSr" HeaderText="Rem. No">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="fileno" HeaderText="File No">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="subject" HeaderText="Subject">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="description" HeaderText="End User/Initiator">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="remarks" HeaderText="Remarks" Visible="False">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FollowUpDate" HeaderText="Follow Up Date">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FollowUpRemarks" HeaderText="Follow Up Remarks">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:ButtonField CommandName="Remove" HeaderText="Remove" Text="Remove">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" />
                            </asp:ButtonField>
                        </Columns>
                    </asp:GridView>
                    </div>
                 </td>
            </tr>
            <tr>
                <td style="width: 100%; text-align: center">
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
