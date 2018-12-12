<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmTenderCasesReport.aspx.cs" Inherits="frmTenderCasesReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Tender Cases</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
    <form id="frmTendedCases" runat="server">
    <div>
        <table align="center" width="100%">
            <tr>
                <td style="width: 100%; text-align: center">
                </td>
            </tr>
            <tr>
                <td style="width: 100%; text-align: center">
                    <strong><span style="font-size: 10pt; font-family: Verdana">Tender Cases Report</span></strong>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 100%; text-align: center">
                    <table style="width:100%">
                        <tr>
                            <td style="width:14.29%">
                            </td>
                            <td style="width:14.29%">
                            </td>
                            <td style="width:14.29%">
                                </td>
                            <td style="width:14.29%">
                                <asp:DropDownList ID="ddlSelect" runat="server" CssClass="textBox" Width="150px">
                                    <asp:ListItem>IP</asp:ListItem>
                                    <asp:ListItem>Pending</asp:ListItem>
                                    <asp:ListItem>Completed</asp:ListItem>
                                    <asp:ListItem>Delivered</asp:ListItem>
                                    <asp:ListItem>All</asp:ListItem>
                                </asp:DropDownList></td>
                            <td style="width:14.29%">
                                </td>
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
                            <td style="width: 14.29%">
                            </td>
                            <td style="width: 14.29%">
                                <asp:Button ID="btnFilter" runat="server" CssClass="button" Text="Filter" Width="150px" OnClick="btnFilter_Click" /></td>
                            <td style="width: 14.29%">
                            </td>
                            <td style="width: 14.29%">
                            </td>
                            <td style="width: 14.29%">
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
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Download Excel" BackColor="White" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" /></td>
                            <td style="width: 14.29%">
                                <asp:LinkButton ID="lblGoBack" runat="server" CssClass="labelFont" OnClick="lblGoBack_Click">Go Back</asp:LinkButton></td>
                            <td style="width: 14.29%">
                            </td>
                            <td style="width: 14.29%">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 100%; text-align:center">
                    <asp:GridView ID="gvTenderCases" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="OnPageIndexChanging">
                        <Columns>
                            <asp:TemplateField HeaderText="Sr">
                                <ItemTemplate>
                                    <asp:Label ID="lblSr" runat="server" CssClass="labelFont"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="fileno" HeaderText="File No">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="subject" HeaderText="Subject">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="enduser" HeaderText="End User">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="event" HeaderText="Event">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="type" HeaderText="File Type">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="typeofprocurement" HeaderText="Procurement Type">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="sourceoffunding" HeaderText="Source of Funding">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="requisitiondate" HeaderText="Request Approval">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="boqsdate" HeaderText="BOQs">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="diaryindate" HeaderText="Diary In Date">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="tenderopeningdate" HeaderText="Tender/Quotation Date">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="tenderno" HeaderText="TenderNo">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="purchasecommitteedate" HeaderText="CPC Meeting">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" />
                            </asp:BoundField>
                            <asp:BoundField DataField="finalapprovaldate" HeaderText="Final Approval">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" />
                            </asp:BoundField>
                            <asp:BoundField DataField="approvedamount" HeaderText="Approved Amount (Rs)">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="supplyorderdate" HeaderText="Supply Order">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" />
                            </asp:BoundField>
                            <asp:BoundField DataField="name" HeaderText="Vendor Name">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="supplydate" HeaderText="Supply/Delivery">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" />
                            </asp:BoundField>
                            <asp:BoundField DataField="stockentryforwardeddate" HeaderText="Stock Entry Forwarded Date">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" />
                            </asp:BoundField>
                            <asp:BoundField DataField="completioncertificatedate" HeaderText="Completion Certificate Date">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" />
                            </asp:BoundField>
                            <asp:BoundField DataField="filesentforpaymentdate" HeaderText="File Sent For Payment Date">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" />
                            </asp:BoundField>
                            <asp:BoundField DataField="paymentmadedate" HeaderText="Payment Made Date">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" />
                            </asp:BoundField>
                            <asp:BoundField DataField="expectedDOD" HeaderText="Expected DOD">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="remarks" HeaderText="Remarks">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="status" HeaderText="Final Status">
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
