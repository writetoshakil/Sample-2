<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmSummaryView.aspx.cs" Inherits="frmSummaryView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Summary View</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
    <style type="text/css">
        .style1
        {
            font-family: Verdana;
            font-weight: bold;
            font-size: 12pt;
        }
        .style2
        {
            width: 100%;
            height: 474px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" width="100%">
           
            <tr>
                <td style="text-align: center">
                    <table style="width:100%">
                        <tr>
                            <td style="width:12.5%">
                                &nbsp;</td>
                            <td style="width:12.5%">
                                &nbsp;</td>
                            <td class="style1" colspan="4">
                                Summary View of All Procurement Cases</td>
                            <td style="width:12.5%">
                                &nbsp;</td>
                            <td style="width:12.5%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width:12.5%">
                            </td>
                            <td style="width:12.5%">
                            </td>
                            <td style="width:12.5%">
                            </td>
                            <td style="width:12.5%; text-align: left;">
                                <asp:DropDownList ID="ddlOption1" runat="server" CssClass="textBox" Width="150px">
                                    <asp:ListItem Value="fileno">File No</asp:ListItem>
                                    <asp:ListItem>Subject</asp:ListItem>
                                    <asp:ListItem Value="enduser">End User</asp:ListItem>
                                </asp:DropDownList></td>
                            <td style="width:12.5%; text-align: left;">
                                <asp:TextBox ID="txtOption1" runat="server" Width="150px" CssClass="textBox"></asp:TextBox></td>
                            <td style="width:12.5%">
                            </td>
                            <td style="width:12.5%">
                            </td>
                            <td style="width:12.5%">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 12.5%">
                            </td>
                            <td style="width: 12.5%">
                            </td>
                            <td style="width: 12.5%">
                            </td>
                            <td style="width: 12.5%; text-align: left"><asp:DropDownList ID="ddlOption2" runat="server" CssClass="textBox" Width="150px">
                                <asp:ListItem Value="fileno">File No</asp:ListItem>
                                <asp:ListItem>Subject</asp:ListItem>
                                <asp:ListItem Value="enduser">End User</asp:ListItem>
                            </asp:DropDownList></td>
                            <td style="width: 12.5%; text-align: left">
                                <asp:TextBox CssClass="textBox" ID="txtOption2" runat="server" Width="150px" /></td>
                            <td style="width: 12.5%">
                            </td>
                            <td style="width: 12.5%">
                            </td>
                            <td style="width: 12.5%">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 12.5%">
                            </td>
                            <td style="width: 12.5%">
                            </td>
                            <td style="width: 12.5%">
                            </td>
                            <td style="width: 12.5%; text-align: left">
                                </td>
                            <td style="width: 12.5%; text-align: left">
                                <asp:Button ID="btnFilter" runat="server" CssClass="button" OnClick="btnFilter_Click"
                                    Text="Filter" Width="150px" /></td>
                            <td style="width: 12.5%; text-align: left">
                                </td>
                            <td style="width: 12.5%">
                            </td>
                            <td style="width: 12.5%">
                            </td>
                        </tr>
                        </table>
               </td>
            </tr>
            <tr>
                <td style="width: 100%; text-align: center">
                </td>
            </tr>
            <tr>
                <td style="width: 100%; text-align:center">
                    &nbsp;<asp:GridView ID="gvTenderCases" runat="server" AutoGenerateColumns="False"
                        OnPageIndexChanging="OnPageIndexChanging">
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
                            <asp:BoundField DataField="type" HeaderText="File Type">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" />
                            </asp:BoundField>
                            <asp:BoundField DataField="typeofprocurement" HeaderText="Procurement Type">
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
                            <asp:BoundField DataField="requisitiondate" HeaderText="Request Approval">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="tenderopeningdate" HeaderText="Tender/Quotation Date">
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
                    &nbsp;</td>
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
