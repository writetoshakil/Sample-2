<%@ Page Language="C#" MasterPageFile="~/mp.master" AutoEventWireup="true" CodeFile="frmCPCMeeting.aspx.cs" Inherits="frmCPCMeeting" Title="::CPC Meeting Schedule::" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderPublic" Runat="Server">
    <script type="text/javascript" src="jquery-1.7.1.js"></script>
	<script type="text/javascript"  src="ui/jquery.ui.core.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.datepicker.js"></script>
	<script type="text/javascript" language="javascript">
	$(function() {
		$( "#datepicker" ).datepicker();
	});
	$(function() {
		$( "#fromDate" ).datepicker();
	});
	$(function() {
		$( "#toDate" ).datepicker();
	});
	</script>
    <table align="center" width="950">
        <tr>
            <td style="width: 237px; text-align: left">
            </td>
            <td colspan="2" style="font-size: small; color: white; font-family: Verdana; background-color: #333333;
                text-align: center">
                <strong>CPC Meeting Schedule</strong></td>
            <td style="width: 237px; text-align: left">
            </td>
        </tr>
        <tr>
            <td style="width: 237px; text-align: left">
            </td>
            <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                From</td>
            <td style="width: 326px; text-align: left">
                <input id="fromDate" class="textBox" name="datepickerFrom" type="text" /></td>
            <td style="width: 237px; text-align: left">
                </td>
        </tr>
        <tr style="color: #000000">
            <td style="width: 237px; text-align: left">
            </td>
            <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                To</td>
            <td style="width: 326px; text-align: left">
                <input id="toDate" class="textBox" name="datepickerTo" type="text" /></td>
            <td style="width: 237px; text-align: left">
                </td>
        </tr>
        <tr>
            <td style="width: 237px; text-align: left">
            </td>
            <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
            </td>
            <td style="width: 326px; text-align: left">
                <asp:Button ID="Button1" runat="server" CssClass="button" Text="Get Records" OnClick="Button1_Click" Width="138px" />&nbsp;</td>
            <td style="width: 237px; text-align: left">
            </td>
        </tr>
        <tr>
            <td style="width: 237px; text-align: left">
            </td>
            <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
            </td>
            <td style="width: 326px; text-align: left">
                <asp:Button ID="Button2" runat="server" BackColor="White" Font-Bold="True" Font-Names="Verdana"
                    Font-Size="8pt" OnClick="Button2_Click" Text="Download Excel" Width="138px" /></td>
            <td style="width: 237px; text-align: left">
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
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:GridView ID="gvCPCMeeting" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="Sr">
                            <ItemTemplate>
                                <asp:Label ID="lblSr" runat="server" CssClass="labelFont" Text="Label"></asp:Label>
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
                        <asp:BoundField DataField="tenderopeningdate" HeaderText="Tender Opening Date">
                            <HeaderStyle CssClass="gridHeader" />
                            <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="expectedDOD" HeaderText="Expected DOD">
                            <HeaderStyle CssClass="gridHeader" />
                            <ItemStyle CssClass="gridItem" />
                        </asp:BoundField>
                        <asp:BoundField DataField="VendorName" HeaderText="Vendor Name">
                            <HeaderStyle CssClass="gridHeader" />
                            <ItemStyle CssClass="gridItem" />
                        </asp:BoundField>
                        <asp:BoundField DataField="cooptedmembers" HeaderText="Co-opted Members">
                            <HeaderStyle CssClass="gridHeader" />
                            <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

