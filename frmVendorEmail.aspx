<%@ Page Language="C#" MasterPageFile="~/mp.master" AutoEventWireup="true" CodeFile="frmVendorEmail.aspx.cs" Inherits="frmVendorEmail" Title="::Email to Vendors::" %>
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
	     <script type = "text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Are you sure to send Email(s)?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
    </script>
    <table align="center" width="950">
        <tr>
            <td style="width: 237px; text-align: left">
            </td>
            <td style="font-size: small; color: white; font-family: Verdana; background-color: #333333;
                text-align: center">
                <b>Email to Vendors</b></td>
            <td style="width: 237px; text-align: left">
            </td>
        </tr>
        <tr>
            <td style="text-align: left" colspan="3">
                <asp:Label ID="lblError" runat="server" CssClass="error_text"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:GridView ID="gvVendor" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="Sr">
                            <ItemTemplate>
                                <asp:Label ID="lblSr" runat="server" CssClass="labelFont" Text="Label"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="gridHeader" />
                            <ItemStyle CssClass="gridItem" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="vendorid" HeaderText="Vendor ID">
                            <HeaderStyle CssClass="gridHeader" />
                            <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="name" HeaderText="Name">
                            <HeaderStyle CssClass="gridHeader" />
                            <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="contactperson" HeaderText="Contact Person">
                            <HeaderStyle CssClass="gridHeader" />
                            <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="contactno" HeaderText="Contact No">
                            <HeaderStyle CssClass="gridHeader" />
                            <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="emailid" HeaderText="Email ID">
                            <HeaderStyle CssClass="gridHeader" />
                            <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="prequalified" HeaderText="Pre-Qualified">
                            <HeaderStyle CssClass="gridHeader" />
                            <ItemStyle CssClass="gridItem" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Select">
                            <ItemTemplate>
                                <asp:CheckBox ID="cbxSelect" runat="server" CssClass="checkBox" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="gridHeader" />
                            <ItemStyle CssClass="gridItem" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                        <asp:Button ID="btnEmail" runat="server" CssClass="button" OnClick="btnRemarksSingle_Click"
                            Text="Send Email" OnClientClick="Confirm()"/></td>
        </tr>
    </table>
</asp:Content>

