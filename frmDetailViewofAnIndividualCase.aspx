<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmDetailViewofAnIndividualCase.aspx.cs" Inherits="frmDetailViewofAnIndividualCase" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Detail View of An Individual Case</title>
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
                <td style="width: 100%; text-align: center; height: 19px;">
                    <strong><span style="font-size: 10pt; font-family: Verdana">Detail View of An Indifidual
                        Case</span></strong>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 100%; text-align: center">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 12.50%">
                            </td>
                            <td style="width: 12.50%">
                            </td>
                            <td style="width: 12.50%">
                            </td>
                            <td style="width: 12.50%">
                                <asp:DropDownList ID="ddlSelect" runat="server" CssClass="textBox" Width="150px">
                                    <asp:ListItem Value="typeofprocurement">Type of Procurement</asp:ListItem>
                                    <asp:ListItem Value="sourceoffunding">Source of Funding</asp:ListItem>
                                </asp:DropDownList></td>
                            <td style="width: 12.50%; text-align: left;">
                                <asp:TextBox ID="txtSearch" runat="server" CssClass="textBox"></asp:TextBox></td>
                            <td style="width: 12.50%">
                            </td>
                            <td style="width: 12.50%">
                            </td>
                            <td style="width: 12.50%">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 12.50%">
                            </td>
                            <td style="width: 12.50%">
                            </td>
                            <td style="width: 12.50%">
                            </td>
                            <td style="width: 12.50%">
                                <asp:Button ID="btnFilter" runat="server" CssClass="button"
                                    Text="Filter" Width="150px" OnClick="btnFilter_Click" /></td>
                            <td style="width: 12.50%">
                            </td>
                            <td style="width: 12.50%">
                            </td>
                            <td style="width: 12.50%">
                            </td>
                            <td style="width: 12.50%">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 12.50%">
                            </td>
                            <td style="width: 12.50%">
                            </td>
                            <td style="width: 12.50%">
                            </td>
                            <td style="width: 12.50%">
                                <asp:Button ID="btnDownloadExcel" runat="server" BackColor="White" Font-Bold="True" Font-Names="Verdana"
                                    Font-Size="8pt" OnClick="btnDownloadExcel_Click" Text="Download Excel" /></td>
                            <td style="width: 12.50%">
                                <asp:LinkButton ID="btnGoBack" runat="server" CssClass="labelFont" OnClick="btnGoBack_Click">Go Back</asp:LinkButton></td>
                            <td style="width: 12.50%">
                            </td>
                            <td style="width: 12.50%">
                            </td>
                            <td style="width: 12.50%">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 100%; text-align: center">
                    &nbsp;<asp:GridView ID="gvDetail" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField HeaderText="Sr">
                                <ItemTemplate>
                                    <asp:Label ID="lblSr" runat="server" CssClass="labelFont"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="typeofprocurement" HeaderText="Type of Procurement">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="sourceoffunding" HeaderText="Source of Funding">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="diaryindate" HeaderText="Diary In Date">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="tender_quotation_date" HeaderText="Tender/Quotation Date">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="cpcmeeting" HeaderText="CPC Meeting">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="finalapprovaldate" HeaderText="Final Approval Date">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="approvedamount" HeaderText="Approved Amount">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="supplyorderdate" HeaderText="Supply Order Date">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="vendor" HeaderText="Vendor">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="supplydate" HeaderText="Supply Date">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="stockentryforwardeddate" HeaderText="Stock Entry Forwarded Date">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="completioncertificatedate" HeaderText="Completion Certificate Date">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="filesentforpaymentdate" HeaderText="File Sent For Payment Date">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="paymentmadedate" HeaderText="Payment Made Date">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
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
