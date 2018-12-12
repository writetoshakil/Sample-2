<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmFileLocationReport.aspx.cs" Inherits="frmFileLocationReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>File Location Report</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
    <style type="text/css">
        .style2
        {
            width: 363px;
        }
        .style7
        {
            font-family: Verdana;
            font-weight: bold;
            font-size: 12pt;
        }
        .style8
        {
            font-family: Verdana;
            font-size: 10pt;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:100%; margin-right:auto; margin-left:auto">
        <div style="width:800px; margin-left:auto; margin-right:auto">
            <table style="width:800px">
            <tr>
                <td style="width:250px">
                        <asp:Label ID="lblMessage" runat="server" CssClass="labelFont" ForeColor="Green"
                            Visible="False"></asp:Label>
                </td>
                <td style="width:450px" class="style7">
                        File Location Report</td>
                <td style="width:100px">
                </td>
            </tr>
            <tr>
                <td style="width:250px" class="style8">
                                    Department</td>
                <td style="width:450px">
                        <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="textBox" 
                            Width="326px" onselectedindexchanged="ddlDepartment_SelectedIndexChanged">
                        </asp:DropDownList>
                </td>
                <td style="width:100px">
                                <asp:Button ID="btnSelect" runat="server" CssClass="button" Text="Select" 
                                        Width="100px" onclick="btnSelect_Click"/>
                </td>
            </tr>
            <tr>
                <td style="width:250px" class="style8">
                                    File Status (In/Out)</td>
                <td style="width:450px">
                                    <asp:DropDownList ID="ddlInOut" runat="server" CssClass="textBox">
                                        <asp:ListItem>In</asp:ListItem>
                                        <asp:ListItem>Out</asp:ListItem>
                                    </asp:DropDownList>
                </td>
                <td style="width:100px">
                                <asp:Button ID="btnInOut" runat="server" CssClass="button" Text="Select" 
                                        Width="100px" onclick="btnInOut_Click"/>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="text-align:center">
                        <asp:GridView ID="gvFileLocation" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSr" runat="server" CssClass="labelFont"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Center" Width="50px" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="File No" DataField="fileno">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="175px" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Subject" DataField="subject">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="375px" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Location Chage Date" DataField="locationchangedate">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="150px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="description" HeaderText="Department">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                </td>
            </tr>
            <tr>
                <td style="width:250px">
                </td>
                <td style="width:450px; text-align:center">
                        <asp:Button ID="btnSMS" runat="server" CssClass="button" Text="Import To Excel" 
                            OnClick="btnSMS_Click" />
                </td>
                <td style="width:100px">
                </td>
            </tr>
                
           <!--      <tr>
                                <td style="width:300px">
                                </td>
                                <td style="width:100px; text-align:left" class="style1">
                                    Department
                                </td>
                                <td style="width:300px; text-align:left">
                        <input type="text" id="fromDate" class="textBox" name="datepickerFrom" /></td>
                                <td style="width:300px; text-align:left">
                        <asp:Label ID="lblErrorFrom" runat="server" CssClass="error_text"></asp:Label>
                                </td>
                            </tr>  
                            -->
                 </table>
        </div>
    </div>    
    </form>
</body>
</html>
