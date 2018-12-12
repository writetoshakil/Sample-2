<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmDepartmentWiseReport.aspx.cs" Inherits="frmDepartmentWiseReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Department Wise Cases Report</title>
    <link rel="Stylesheet" type="text/css" href="style.css" />
    <style type="text/css">
        .style1
        {
            font-size: 10pt;
            font-weight: normal;
        }
    </style>
    <script type="text/javascript" src="jquery-1.7.1.js"></script>
	<script type="text/javascript"  src="ui/jquery.ui.core.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.datepicker.js"></script>
	<link rel="stylesheet" href="themes/base/jquery.ui.all.css" />
    <script type="text/javascript" language="javascript">
        $(function() {
		$("#datepicker").datepicker();
	    });
	    $(function() {
		$("#fromDate").datepicker();
	    });
	    $(function() {
		$("#toDate").datepicker();
	    });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:100%; margin-left:auto; margin-right:auto">
        <div style="width:1000px; margin-left:auto; margin-right:auto">
            <table style="width:1000px">
                <tr>
                    <td style="width:1000px; text-align:center; font-family:Verdana; font-size:14px; font-weight:bold">
                        Department Wise Cases Report
                    </td>
                </tr>
                <tr>
                    <td style="width:1000px; text-align:center; font-family:Verdana; font-size:14px; font-weight:bold">
                        <table style="width:1000px">
                            <tr>
                                <td style="width:300px">
                                </td>
                                <td style="width:100px; text-align:left" class="style1">
                                    From
                                </td>
                                <td style="width:300px; text-align:left">
                        <input type="text" id="fromDate" class="textBox" name="datepickerFrom" /></td>
                                <td style="width:300px; text-align:left">
                        <asp:Label ID="lblErrorFrom" runat="server" CssClass="error_text"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:300px">
                                </td>
                                <td style="width:100px; text-align:left" class="style1">
                                    To
                                </td>
                                <td style="width:300px; text-align:left">
                        <input type="text" id="toDate" class="textBox" name="datepickerTo" /></td>
                                <td style="width:300px; text-align:left">
                        <asp:Label ID="lblErrorTo" runat="server" CssClass="error_text"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:300px">
                                </td>
                                <td style="width:100px; text-align:left">
                                </td>
                                <td style="width:300px">
                                <asp:Button ID="btnSelect" runat="server" CssClass="button" Text="Select" 
                                        Width="100px" onclick="btnSelect_Click"/>
                                </td>
                                <td style="width:300px">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width:1000px; text-align:center">
                        <asp:GridView ID="gvReport" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSr" runat="server" CssClass="labelFont"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Center" Width="50px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="department" HeaderText="Department">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="400px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="IP" HeaderText="IP">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Right" Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Delivered" HeaderText="Delivered">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Right" Width="200px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Completed" HeaderText="Completed">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Right" Width="50px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Pending" HeaderText="Pending">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="FollowUp" HeaderText="Follow Up">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Total Files">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TotalApprovedAmount" 
                                    HeaderText="Total Approved Amount">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Right" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td style="width:1000px; text-align:center">
                                <asp:Button ID="btnExport" runat="server" CssClass="button" 
                            Text="Export To Excel" Width="150px" onclick="btnExport_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
