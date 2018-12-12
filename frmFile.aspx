<%@ Page Language="C#" MasterPageFile="~/mp.master" AutoEventWireup="true" CodeFile="frmFile.aspx.cs" Inherits="frmFile" Title="File Information" %>
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
		$( "#requisitionDate" ).datepicker();
	});
	$(function() {
		$( "[id$=EditrequisitionDate]" ).datepicker();
	});
	$(function() {
		$( "#diaryInDate" ).datepicker();
	});
	$(function() {
		$( "#boqDate" ).datepicker();
	});
	
	
	$(function() {
		$( "#atenderingDate" ).datepicker();
	});
	$(function() {
		$( "#atenderUploadedDate" ).datepicker();
	});
	$(function() {
		$( "#apurchaseCommitteeDate" ).datepicker();
	});
	$(function() {
		$( "#acomparativeStatementDate" ).datepicker();
	});
	$(function() {
		$( "#afinalApprovalDate" ).datepicker();
	});
	$(function() {
		$( "#asupplyOrderDate" ).datepicker();
	});
	$(function() {
		$( "#asupplyDate" ).datepicker();
	});
	$(function() {
		$( "#afileSentForPaymentDate" ).datepicker();
	});
	
	
	$(function() {
		$( "#btenderUploadedDate" ).datepicker();
	});
	$(function() {
		$( "#btechnicalOpeningDate" ).datepicker();
	});
	$(function() {
		$( "#btechnicalFinalizedDate" ).datepicker();
	});
	$(function() {
		$( "#bfinancialOpeningDate" ).datepicker();
	});
	$(function() {
		$( "#bpurchaseCommitteeDate" ).datepicker();
	});
	$(function() {
		$( "#bcomparativeStatementDate" ).datepicker();
	});
	$(function() {
		$( "#bfinalApprovalDate" ).datepicker();
	});
	$(function() {
		$( "#bsupplyOrderDate" ).datepicker();
	});
	$(function() {
		$( "#bsupplyDate" ).datepicker();
	});
	$(function() {
		$( "#bfileSentForPaymentDate" ).datepicker();
	});
	
	
	$(function() {
		$( "#cquotationInvitedDate" ).datepicker();
	});
	$(function() {
		$( "#cquotationOpeningDate" ).datepicker();
	});
	$(function() {
		$( "#cpurchaseCommitteeDate" ).datepicker();
	});
	$(function() {
		$( "#ccomparativeStatementDate" ).datepicker();
	});
	$(function() {
		$( "#cfinalApprovalDate" ).datepicker();
	});
	$(function() {
		$( "#csupplyOrderDate" ).datepicker();
	});
	$(function() {
		$( "#csupplyDate" ).datepicker();
	});
	$(function() {
		$( "#cfileSentForPaymentDate" ).datepicker();
	});
	
	$(function() {
		$( "#astockEntryForwardedDate" ).datepicker();
	});
	$(function() {
		$( "#acompletionCertificateDate" ).datepicker();
	});
	$(function() {
		$( "#apaymentMadeDate" ).datepicker();
	});
	
	$(function() {
		$( "#bstockEntryForwardedDate" ).datepicker();
	});
	$(function() {
		$( "#bcompletionCertificateDate" ).datepicker();
	});
	$(function() {
		$( "#bpaymentMadeDate" ).datepicker();
	});
	
	$(function() {
		$( "#cstockEntryForwardedDate" ).datepicker();
	});
	$(function() {
		$( "#ccompletionCertificateDate" ).datepicker();
	});
	$(function() {
		$( "#cpaymentMadeDate" ).datepicker();
	});
	$(function() {
		$( "#dpaymentMadeDate" ).datepicker();
	});
	
	$(function() {
		$( "#dsupplyDate" ).datepicker();
	});
	$(function() {
		$( "#dstockEntryForwardedDate" ).datepicker();
	});
	$(function() {
		$( "#dcompletionCertificateDate" ).datepicker();
	});
	$(function() {
		$( "#dfileSentForPaymentDate" ).datepicker();
	});
	
	$(function() {
		$( "#afollowUpDate" ).datepicker();
	});
	$(function() {
		$( "#bfollowUpDate" ).datepicker();
	});
	$(function() {
		$( "#cfollowUpDate" ).datepicker();
	});
	
	
	$(function() {
		$( "#aDOD" ).datepicker();
	});
	$(function() {
		$( "#bDOD" ).datepicker();
	});
	$(function() {
		$( "#cDOD" ).datepicker();
	});
	
	</script>
    <asp:MultiView ID="mv" runat="server">
        <asp:View ID="vwFile" runat="server">
            <table align="center" width="950">
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td colspan="2" style="font-size: small; font-family: Verdana; text-align:center; background-color:#333333; color:White">
                        <strong>
                            Add New File</strong></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        File No</td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                        <asp:TextBox ID="txtFileNo" runat="server" CssClass="textBox" Width="326px" 
                            Enabled="False">CIIT-LHR/Pur-</asp:TextBox></td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFileNo"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Subject</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtSubject" runat="server" CssClass="textBox" Width="326px" 
                            Height="80px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSubject"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        End User / Initiator</td>
                    <td style="width: 326px; text-align: left">
                        <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="textBox" 
                            Width="326px" onselectedindexchanged="ddlDepartment_SelectedIndexChanged">
                        </asp:DropDownList></td>
                    <td style="width: 237px; text-align: left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlDepartment"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Event</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtEvent" runat="server" CssClass="textBox" Width="326px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Type of Procurement</td>
                    <td style="width: 326px; text-align: left">
                        <asp:DropDownList ID="cbxTypeofProcurement" runat="server" CssClass="textBox" Width="326px">
                        </asp:DropDownList></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Source of Funding</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtSourceofFunding" runat="server" CssClass="textBox" Width="326px">CIIT Lahore</asp:TextBox></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        File Type</td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                        <asp:DropDownList ID="ddlFileType" runat="server" CssClass="textBox" Width="326px">
                        </asp:DropDownList></td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlFileType"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 20px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 20px;">
                        Request Approval Date</td>
                    <td style="width: 326px; text-align: left; height: 20px;">
                        <input type="text" id="requisitionDate" class="textBox" name="datepickerFrom" /></td>
                    <td style="width: 237px; text-align: left; height: 20px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 32px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 32px;">
                        BOQs Finalization Date</td>
                    <td style="width: 326px; text-align: left; height: 32px;">
                        <input type="text" id="boqDate" class="textBox" name="datepickerTo" /></td>
                    <td style="width: 237px; text-align: left; height: 32px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height:auto; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 39px; text-align: left">
                        BOQ Attached and OK</td>
                    <td style="width: 326px; height: 39px; text-align: left; vertical-align:middle">
                        <asp:RadioButtonList ID="rblBOQ" runat="server" CssClass="checkBox" RepeatDirection="Horizontal" DataValueField="1">
                            <asp:ListItem Value="1" Selected="True">Yes</asp:ListItem>
                            <asp:ListItem Value="0">No</asp:ListItem>
                        </asp:RadioButtonList></td>
                    <td style="width: 237px; height: 39px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 20px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 20px; text-align: left">
                        Diary In Date</td>
                    <td style="width: 326px; height: 20px; text-align: left">
                        <input type="text" id="diaryInDate" class="textBox" name="diaryInDate" /></td>
                    <td style="width: 237px; height: 20px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 20px; text-align: left">
                        &nbsp;</td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 20px; text-align: left">
                        Send&nbsp; Email to User</td>
                    <td style="width: 326px; height: 20px; text-align: left">
                        <asp:CheckBox ID="cbxSendEmail" runat="server" CssClass="checkBox" />
                    </td>
                    <td style="width: 237px; height: 20px; text-align: left">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 39px;">
                        &nbsp;</td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 39px;">
                        &nbsp;</td>
                    <td style="width: 326px; text-align:right; height: 39px;">
                        &nbsp;</td>
                    <td style="width: 237px; text-align: left; height: 39px;">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 39px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 39px;">
                    </td>
                    <td style="width: 326px; text-align:right; height: 39px;">
                        <asp:ImageButton ID="ImageButton2" runat="server" Height="31px" 
                            ImageUrl="~/images/Save.jpg" OnClick="ImageButton2_Click" Width="74px" />
                        &nbsp;</td>
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
                        <asp:Label ID="lblEmail" runat="server" CssClass="error_text"></asp:Label></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                    </td>
                    <td style="width: 326px; text-align: left">
                        <asp:Label ID="lblMessage" runat="server" CssClass="error_text"></asp:Label></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
            </table>
            <table style="text-align:center; width:950px">
                <tr>
                    <td style="width: 950px; height:auto; text-align: left">
                        <asp:Label ID="lblFileStatus" runat="server" CssClass="labelFont"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 950px; text-align:center; height: 164px;">
                        <asp:GridView ID="gvFile" runat="server" AutoGenerateColumns="False" 
                            OnRowCommand="gvFile_RowCommand" DataKeyNames="fileno" 
                            OnRowDataBound="gvFile_RowDataBound" OnRowUpdating="gvFile_RowUpdating" 
                            onrowediting="gvFile_RowEditing">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSr" runat="server" CssClass="labelFont"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="gridHeader" HorizontalAlign="Center" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="fileno" HeaderText="File#">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:BoundField>
                                <asp:BoundField DataField="subject" HeaderText="Subject">
                                    <HeaderStyle CssClass="gridHeader" HorizontalAlign="Left" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="enduser" HeaderText="End User">
                                    <HeaderStyle CssClass="gridHeader" HorizontalAlign="Left" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="event" HeaderText="Event">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="filetype" HeaderText="Type">
                                    <HeaderStyle CssClass="gridHeader" HorizontalAlign="Left" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="requisitiondate" HeaderText="Request Approval Date">
                                    <HeaderStyle CssClass="gridHeader" HorizontalAlign="Left" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="tenderno" HeaderText="Tender No">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="purchasecommitteedate" HeaderText="CPC Meeting">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:BoundField>
                                <asp:BoundField DataField="approvedamount" HeaderText="Approved Amount">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="supplyorderdate" HeaderText="Supply Order Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:BoundField>
                                <asp:BoundField DataField="supplydate" HeaderText="Supply Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:BoundField>
                                <asp:BoundField DataField="remarks" HeaderText="Remarks">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:ButtonField CommandName="Detail" HeaderText="Detail" Text="Detail">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Center" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="Remarks" HeaderText="Add Remarks" Text="Remarks" 
                                    Visible="False">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Center" />
                                </asp:ButtonField>
                                <asp:TemplateField HeaderText="Final Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' 
                                            Visible="False" />
                                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="textBox">
                                            <asp:ListItem Selected="True">Pending</asp:ListItem>
                                            <asp:ListItem>IP</asp:ListItem>
                                            <asp:ListItem>Completed</asp:ListItem>
                                            <asp:ListItem Value="FollowUp">Follow Up</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:TemplateField>
                                <asp:ButtonField CommandName="Update" HeaderText="Update" Text="Update">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="ERMS" HeaderText="ERMS" Text="ERMS">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:ButtonField>
                                <asp:ButtonField ButtonType="Image" CommandName="Edit" HeaderText="Edit" 
                                    ImageUrl="~/images/Edit.jpg">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Center" />
                                </asp:ButtonField>
                            </Columns>
                        </asp:GridView>
                        &nbsp;
                    </td>
                    
                </tr>
            </table>
        </asp:View>
        <asp:View ID="vwSingleStageOneEnvelopTender" runat="server" OnActivate="vwSingleStageOneEnvelopTender_Activate">
            <table align="center" width="950">
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td colspan="2" style="font-size: small; font-family: Verdana; text-align:center; background-color:#333333; color:White">
                        <strong>Add File Details (Single Stage One Envelop Tender)</strong></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        File No</td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                        <asp:TextBox ID="txtaFileNoDetail" runat="server" CssClass="textBox" Width="326px" ReadOnly="True"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                        </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Subject</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtaSubject" runat="server" CssClass="textBox" ReadOnly="True" Width="326px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        Tender Uploaded Date</td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                        <input type="text" id="atenderUploadedDate" class="textBox" name="txtaTenderUploadedDate" value = "<%=Session["tenderuploadeddate"]%>" /></td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                </tr>
                <!--
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Tendering Date</td>
                    <td style="width: 326px; text-align: left"><input type="text" id="atenderingDate" class="textBox" name="txtaTenderingDate" value="<%=Session["tenderuploadeddate"]%>" /></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                -->
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Tender No:</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtTenderNoSingle" runat="server" CssClass="textBox"
                            Width="326px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        CPC Meeting Date</td>
                    <td style="width: 326px; text-align: left"><input type="text" id="apurchaseCommitteeDate" class="textBox" name="txtaPurchaseCommitteeDate" value="<%=Session["purchasecommitteedate"]%>" /></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        CS Finalised Date</td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <input type="text" id="acomparativeStatementDate" class="textBox" name="txtaComparativeStatementDate" value="<%=Session["comparativestatementdate"]%>" /></td>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        Final Approval Date</td>
                    <td style="width: 326px; text-align: left; height: 19px;"><input type="text" id="afinalApprovalDate" class="textBox" name="txtaFinalApprovalDate" value="<%=Session["finalapprovaldate"] %>" /></td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Expected DOD</td>
                    <td style="width: 326px; text-align: left">
                        <input type="text" id="aDOD" class="textBox" name="txtaDOD" value="<%=Session["aDOD"] %>" /></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Approved Amount</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtaApprovedAmount" runat="server" CssClass="textBox" 
                            Width="123px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left">
                        </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        PO Date</td>
                    <td style="width: 326px; text-align: left"><input type="text" id="asupplyOrderDate" class="textBox" name="txtaSupplyOrderDate" value="<%=Session["supplyorderdate"] %>" /></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Vendor Name</td>
                    <td style="width: 326px; text-align: left"><asp:DropDownList ID="ddlaVendor" runat="server" CssClass="textBox" Width="326px">
                    </asp:DropDownList></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Supply Date</td>
                    <td style="width: 326px; text-align: left"><input type="text" id="asupplyDate" class="textBox" name="txtaSupplyDate" value="<%=Session["supplydate"] %>" /></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        Stock Entry Forwarded Date</td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <input type="text" id="astockEntryForwardedDate" class="textBox" name="txtaStockEntryForwardedDate" value="<%=Session["stockentryforwardeddate"] %>" /></td>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        Completion Certificate Date</td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <input type="text" id="acompletionCertificateDate" class="textBox" name="txtaCompletionCertificateDate" value="<%=Session["completioncertificatedate"] %>" /></td>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                        &nbsp;</td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        <asp:CheckBox ID="cbxWarrantyClaimSingleStageOneEnvelopTender" runat="server" 
                            CssClass="checkBox" 
                            oncheckedchanged="cbxWarrantyClaimSingleStageOneEnvelopTender_CheckedChanged" 
                            Text="Warranty Claim" TextAlign="Left" AutoPostBack="True" />
                    </td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <asp:TextBox ID="txtWarrantyMonthsSingleStageOneEnvelopTender" runat="server" 
                            CssClass="textBox" Enabled="False" ForeColor="Silver">Enter No of Months</asp:TextBox>
                    </td>
                    <td style="width: 237px; height: 19px; text-align: left">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        File Sent for Payment date</td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <input type="text" id="afileSentForPaymentDate" class="textBox" 
                            name="txtaFileSentForPaymentDate" 
                            value='<%=Session["filesentforpaymentdate"] %>' /></td>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        Payment Made Date</td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <input type="text" id="apaymentMadeDate" class="textBox" 
                            name="txtaPaymentMadeDate" value="<%=Session["paymentmadedate"] %>" /></td>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        Follow Up Date</td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <input ID="afollowUpDate" class="textBox" name="txtaFollowUpDate" type="text" 
                            value='<%=Session["paymentmadedate"] %>' /></td>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        Remarks</td>
                    <td style="width: 326px; text-align:left; height: 19px;">
                        <asp:TextBox ID="txtaFollowUpRemarks" runat="server" CssClass="textBox" 
                            Height="50px" TextMode="MultiLine" Width="326px"></asp:TextBox>
                    </td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                        </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 39px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 39px;">
                    </td>
                    <td style="width: 326px; text-align: right; height: 39px;">
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="31px" 
                            ImageUrl="~/images/Save.jpg" OnClick="ImageButton1_Click" Width="74px" />
                        &nbsp;</td>
                    <td style="width: 237px; text-align: left; height: 39px;">
                        <asp:Button ID="btnRemarksSingle" runat="server" CssClass="button" 
                            OnClick="btnRemarksSingle_Click" Text="Remarks" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                    </td>
                    <td style="width: 326px; text-align: left">
                        <asp:Label ID="lblFileDetail" runat="server" CssClass="error_text"></asp:Label>
                    </td>
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
                    <td style="width: 25px; height: 19px; text-align: left">
                    </td>
                    <td style="width: 900px; height: 19px; text-align: center">
                        <asp:GridView ID="gvSingleStageTenderDetailView" runat="server" 
                            AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSr" runat="server" CssClass="labelFont"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="typeofprocurement" HeaderText="Type of Procurement">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="sourceoffunding" HeaderText="Source of Funding">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="diaryindate" HeaderText="Diary in Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="tender_quotation_date" 
                                    HeaderText="Tender/Quotation Date">
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
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="supplyorderdate" HeaderText="Supply Order Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vendor" HeaderText="Vendor Name">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="supplydate" HeaderText="Supply Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="stockentryforwardeddate" 
                                    HeaderText="Stock Entry Forwarded Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="completioncertificatedate" 
                                    HeaderText="Completion Certificate Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="filesentforpaymentdate" 
                                    HeaderText="File Sent For Payment Date">
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
                    <td style="width: 25px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 25px; text-align: left">
                    </td>
                    <td style="width: 900px; text-align:center">
                        <asp:GridView ID="gvFileDetail" runat="server" AutoGenerateColumns="False" Visible="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSr" runat="server" CssClass="labelFont"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="gridHeader" HorizontalAlign="Center" Width="30px" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Center" Width="30px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="operationaldate" HeaderText="Operational Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:BoundField>
                                <asp:BoundField DataField="purchasecommitteedate" HeaderText="CPC Meeting Date">
                                    <HeaderStyle CssClass="gridHeader" Width="100px" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="finalapprovaldate" HeaderText="Final Approval Date">
                                    <HeaderStyle CssClass="gridHeader" Width="100px" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="approvedamount" HeaderText="Approved Amount">
                                    <HeaderStyle CssClass="gridHeader" Width="100px" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="supplyorderdate" HeaderText="Supply Order Date">
                                    <HeaderStyle CssClass="gridHeader" Width="100px" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="name" HeaderText="Vendor">
                                    <HeaderStyle CssClass="gridHeader" Width="270px" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="270px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="supplydate" HeaderText="Supply Date">
                                    <HeaderStyle CssClass="gridHeader" Width="100px" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="100px" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        &nbsp;
                    </td>
                    <td style="width: 25px; text-align: left">
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="vwFileRemarks" runat="server">
            <table align="center" width="950">
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td colspan="2" style="font-size: small; font-family: Verdana; text-align:center; background-color:#333333; color:White">
                        <strong>Add File Remarks (Single Stage One Envelop Tender)</strong></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        File No</td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                        <asp:TextBox ID="txtFileNoRemarks" runat="server" CssClass="textBox" Width="326px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        Location</td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                        <asp:DropDownList ID="ddlLocation" runat="server" CssClass="textBox" Width="326px">
                        </asp:DropDownList></td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Remarks</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtRemarks" runat="server" CssClass="textBox" Height="100px" TextMode="MultiLine"
                            Width="326px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 39px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 39px;">
                    </td>
                    <td style="width: 326px; text-align:right; height: 39px;">
                        <asp:ImageButton ID="ImageButton3" runat="server" Height="31px" ImageUrl="~/images/Save.jpg"
                            OnClick="ImageButton3_Click" Width="74px" />&nbsp;</td>
                    <td style="width: 237px; text-align: left; height: 39px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                    </td>
                    <td style="width: 326px; text-align: left">
                        <asp:Label ID="lblErrorRemarks" runat="server" CssClass="error_text"></asp:Label></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                    </td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                    </td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                </tr>
            </table>
            <table align="center" width="950">
                <tr>
                    <td style="width: 25px; text-align: left">
                    </td>
                    <td style="width: 900px; text-align:center">
                        <asp:GridView ID="gvFileRemarks" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSr" runat="server" CssClass="labelFont"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="gridHeader" HorizontalAlign="Center" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Center" Width="30px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="remarksdate" HeaderText="Remarks Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="remarks" HeaderText="Remarks">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="370px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="location" HeaderText="Location">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="200px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="recordby" HeaderText="Record By">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="200px" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        &nbsp;
                    </td>
                    <td style="width: 25px; text-align: left">
                    </td>
                </tr>
            </table>
        </asp:View>
        &nbsp;
        <asp:View ID="vwSingleStageTwoEnvelopTender" runat="server" OnActivate="vwSingleStageTwoEnvelopTender_Activate">
            <table align="center" width="950">
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td colspan="2" style="font-size: small; font-family: Verdana; text-align:center; background-color:#333333; color:White">
                        <strong>Add File Details (Single Stage Two Envelop Tender)</strong></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        File No</td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                        <asp:TextBox ID="txtbFileNoDetail" runat="server" CssClass="textBox" ReadOnly="True"
                            Width="326px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        Subject</td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <asp:TextBox ID="txtbSubject" runat="server" CssClass="textBox" ReadOnly="True" Width="326px"></asp:TextBox></td>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Tender Uploaded Date</td>
                    <td style="width: 326px; text-align: left">
                        <input type="text" id="btenderUploadedDate" class="textBox" name="txtbTenderUploadedDate" value="<%=Session["tenderuploadeddate"] %>" /></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Tender No:</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtTenderNoDouble" runat="server" CssClass="textBox"
                            Width="326px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Technical Opening Date</td>
                    <td style="width: 326px; text-align: left">
                        <input type="text" id="btechnicalOpeningDate" class="textBox" name="txtbTechnicalOpeningDate" value="<%=Session["technicalopeningdate"]%>"/></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Technical Finalized Date</td>
                    <td style="width: 326px; text-align: left">
                        <input type="text" id="btechnicalFinalizedDate" class="textBox" name="txtbTechnicalFinalizedDate" value="<%=Session["technicalfinaliseddate"] %>" /></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Financial Opening Date</td>
                    <td style="width: 326px; text-align: left">
                        <input type="text" id="bfinancialOpeningDate" class="textBox" name="txtbFinancialOpeningDate" value="<%=Session["financialopeningdate"] %>" /></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        CPC Meeting Date</td>
                    <td style="width: 326px; text-align: left">
                        <input type="text" id="bpurchaseCommitteeDate" class="textBox" name="txtbPurchaseCommitteeDate" value="<%=Session["purchasecommitteedate"] %>" /></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        CS Finalised Date</td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <input type="text" id="bcomparativeStatementDate" class="textBox" name="txtbComparativeStatementDate" value="<%=Session["comparativestatementdate"] %>" /></td>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        Final Approval Date</td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                        <input type="text" id="bfinalApprovalDate" class="textBox" name="txtbFinalApprovalDate" value="<%=Session["finalapprovaldate"] %>" /></td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        Expected DOD</td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <input type="text" id="bDOD" class="textBox" name="txtbDOD" value="<%=Session["bDOD"] %>" /></td>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Approved Amount</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtbApprovedAmount" runat="server" CssClass="textBox" 
                            Width="123px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left">
                        </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        PO Date</td>
                    <td style="width: 326px; text-align: left">
                        <input type="text" id="bsupplyOrderDate" class="textBox" name="txtbSupplyOrderDate" value="<%=Session["supplyorderdate"] %>" /></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Vendor Name</td>
                    <td style="width: 326px; text-align: left">
                        <asp:DropDownList ID="ddlbVendor" runat="server" CssClass="textBox" Width="326px">
                        </asp:DropDownList></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        Supply Date</td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                        <input type="text" id="bsupplyDate" class="textBox" name="txtbSupplyDate" value="<%=Session["supplydate"] %>" /></td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        Stock Entry Forwarded Date</td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <input type="text" id="bstockEntryForwardedDate" class="textBox" name="txtbStockEntryForwardedDate" value="<%=Session["stockentryforwardeddate"]%>" /></td>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        Completion Certificate Date</td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <input type="text" id="bcompletionCertificateDate" class="textBox" name="txtbCompletionCertificateDate" value="<%=Session["completioncertificatedate"]%>" /></td>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                        &nbsp;</td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        <asp:CheckBox ID="cbxWarrantyClaimSingleStageTwoEnvelopTender" runat="server" 
                            AutoPostBack="True" CssClass="checkBox" 
                            oncheckedchanged="cbxWarrantyClaimSingleStageTwoEnvelopTender_CheckedChanged" 
                            Text="Warranty Claim" TextAlign="Left" />
                    </td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <asp:TextBox ID="txtWarrantyMonthsSingleStageTwoEnvelopTender" runat="server" 
                            CssClass="textBox" Enabled="False" ForeColor="Silver">Enter No of Months</asp:TextBox>
                    </td>
                    <td style="width: 237px; height: 19px; text-align: left">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        File Sent for Payment</td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <input type="text" id="bfileSentForPaymentDate" class="textBox" 
                            name="txtbFileSentForPaymentDate" 
                            value='<%=Session["filesentforpaymentdate"]%>' /></td>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        Payment Made Date</td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <input type="text" id="bpaymentMadeDate" class="textBox" 
                            name="txtbPaymentMadeDate" value='<%=Session["paymentmadedate"]%>' /></td>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        Follow Up Date</td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <input ID="bfollowUpDate" class="textBox" name="txtbFollowUpDate" type="text" 
                            value='<%=Session["paymentmadedate"] %>' /></td>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        Remarks</td>
                    <td style="width: 326px; text-align:left; height: 19px;">
                        <asp:TextBox ID="txtbFollowUpRemarks" runat="server" CssClass="textBox" 
                            Height="50px" TextMode="MultiLine" Width="326px"></asp:TextBox>
                    </td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                        </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 39px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 39px;">
                    </td>
                    <td style="width: 326px; text-align: right; height: 39px;">
                        <asp:ImageButton ID="ImageButton4" runat="server" Height="31px" 
                            ImageUrl="~/images/Save.jpg" OnClick="ImageButton4_Click" Width="74px" />
                        &nbsp;</td>
                    <td style="width: 237px; text-align: left; height: 39px;">
                        <asp:Button ID="btnRemarksDouble" runat="server" CssClass="button" 
                            OnClick="btnRemarksDouble_Click" Text="Remarks" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                    </td>
                    <td style="width: 326px; text-align: left">
                        <asp:Label ID="lblbFileDetail" runat="server" CssClass="error_text"></asp:Label>
                    </td>
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
                    <td style="width: 25px; height: 19px; text-align: left">
                    </td>
                    <td style="width: 900px; height: 19px; text-align: center"><asp:GridView ID="gvTwoStageTenderDetailView" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField HeaderText="Sr">
                                <ItemTemplate>
                                    <asp:Label ID="lblSr" runat="server" CssClass="labelFont"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="typeofprocurement" HeaderText="Type of Procurement">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="sourceoffunding" HeaderText="Source of Funding">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="diaryindate" HeaderText="Diary in Date">
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
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="supplyorderdate" HeaderText="Supply Order Date">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="vendor" HeaderText="Vendor Name">
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
                    <td style="width: 25px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 25px; text-align: left">
                    </td>
                    <td style="width: 900px; text-align:center">
                        <asp:GridView ID="gvbFileDetail" runat="server" AutoGenerateColumns="False" Visible="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSr" runat="server" CssClass="labelFont"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="gridHeader" HorizontalAlign="Center" Width="30px" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Center" Width="30px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="operationaldate" HeaderText="Operational Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:BoundField>
                                <asp:BoundField DataField="tenderuploadeddate" HeaderText="Tender Upload Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:BoundField>
                                <asp:BoundField DataField="technicalopeningdate" HeaderText="Technical Opening Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:BoundField>
                                <asp:BoundField DataField="technicalfinaliseddate" HeaderText="Technical Finalized Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:BoundField>
                                <asp:BoundField DataField="financialopeningdate" HeaderText="Financial Opening Date">
                                    <HeaderStyle CssClass="gridHeader" Width="100px" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="purchasecommitteedate" HeaderText="CPC Meeting Date">
                                    <HeaderStyle CssClass="gridHeader" Width="100px" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="finalapproveddate" HeaderText="Final Approval Date">
                                    <HeaderStyle CssClass="gridHeader" Width="100px" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="approvedamount" HeaderText="Approved Amount">
                                    <HeaderStyle CssClass="gridHeader" Width="100px" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="supplyorderdate" HeaderText="Supply Order Date">
                                    <HeaderStyle CssClass="gridHeader" Width="100px" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="name" HeaderText="Vendor">
                                    <HeaderStyle CssClass="gridHeader" Width="270px" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="150px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="supplydate" HeaderText="Supply Date">
                                    <HeaderStyle CssClass="gridHeader" Width="100px" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="100px" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        &nbsp;
                    </td>
                    <td style="width: 25px; text-align: left">
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="vwSingleStageTwoEnvelopFileRemarks" runat="server">
            <table align="center" width="950">
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td colspan="2" style="font-size: small; font-family: Verdana; text-align:center; background-color:#333333; color:White">
                        <strong>Add File Remarks (Single Stage Two Envelop Tender)</strong></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        File No</td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                        <asp:TextBox ID="txtbFileNoRemarks" runat="server" CssClass="textBox" Width="326px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        Location</td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                        <asp:DropDownList ID="ddlbLocation" runat="server" CssClass="textBox" Width="326px">
                        </asp:DropDownList></td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Remarks</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtbRemarks" runat="server" CssClass="textBox" Height="100px" TextMode="MultiLine"
                            Width="326px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 39px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 39px;">
                    </td>
                    <td style="width: 326px; text-align:right; height: 39px;">
                        <asp:ImageButton ID="ImageButton5" runat="server" Height="31px" ImageUrl="~/images/Save.jpg"
                            OnClick="ImageButton5_Click" Width="74px" />&nbsp;</td>
                    <td style="width: 237px; text-align: left; height: 39px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                    </td>
                    <td style="width: 326px; text-align: left">
                        <asp:Label ID="lblbErrorRemarks" runat="server" CssClass="error_text"></asp:Label></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                    </td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                    </td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                </tr>
            </table>
            <table align="center" width="950">
                <tr>
                    <td style="width: 25px; text-align: left">
                    </td>
                    <td style="width: 900px; text-align:center">
                        <asp:GridView ID="gvbFileRemarks" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSr" runat="server" CssClass="labelFont"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="gridHeader" HorizontalAlign="Center" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Center" Width="30px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="remarksdate" HeaderText="Remarks Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="remarks" HeaderText="Remarks">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="370px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="location" HeaderText="Location">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="200px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="recordby" HeaderText="Record By">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="200px" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        &nbsp;
                    </td>
                    <td style="width: 25px; text-align: left">
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="vwQuotation" runat="server" OnActivate="vwQuotation_Activate">
            <table align="center" width="950">
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td colspan="2" style="font-size: small; font-family: Verdana; text-align:center; background-color:#333333; color:White">
                        <strong>Add File Details (Quotation Case)</strong></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        File No</td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                        <asp:TextBox ID="txtcFileNoDetail" runat="server" CssClass="textBox" ReadOnly="True" Width="326px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        Subject</td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <asp:TextBox ID="txtcSubject" runat="server" CssClass="textBox" ReadOnly="True" Width="326px"></asp:TextBox></td>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Quotation Invited Date</td>
                    <td style="width: 326px; text-align: left">
                        <input type="text" id="cquotationInvitedDate" class="textBox" name="txtcQuotationInvitedDate" value="<%=Session["quotationinviteddate"]%>" /></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        CPC Meeting Date</td>
                    <td style="width: 326px; text-align: left">
                        <input type="text" id="cpurchaseCommitteeDate" class="textBox" name="txtcPurchaseCommitteeDate" value="<%=Session["purchasecommitteedate"]%>" /></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        CS Finalised Date</td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <input type="text" id="ccomparativeStatementDate" class="textBox" name="txtcComparativeStatementDate" value="<%=Session["comparativestatementdate"]%>" /></td>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        Final Approval Date</td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                        <input type="text" id="cfinalApprovalDate" class="textBox" name="txtcFinalApprovalDate" value="<%=Session["finalapprovaldate"]%>" /></td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Approved Amount</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtcApprovedAmount" runat="server" CssClass="textBox" 
                            Width="123px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left">
                        </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        PO Date</td>
                    <td style="width: 326px; text-align: left">
                        <input type="text" id="csupplyOrderDate" class="textBox" name="txtcSupplyOrderDate" value="<%=Session["supplyorderdate"]%>" /></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Vendor Name</td>
                    <td style="width: 326px; text-align: left">
                        <asp:DropDownList ID="ddlcVendor" runat="server" CssClass="textBox" Width="326px">
                        </asp:DropDownList></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        Expected DOD</td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <input type="text" id="cDOD" class="textBox" name="txtcDOD" value="<%=Session["cDOD"]%>" /></td>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        Supply Date</td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                        <input type="text" id="csupplyDate" class="textBox" name="txtcSupplyDate" value="<%=Session["supplydate"]%>" /></td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        Stock Entry Forwarded Date</td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <input type="text" id="cstockEntryForwardedDate" class="textBox" name="txtcStockEntryForwardedDate" value="<%=Session["stockentryforwardeddate"]%>" /></td>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        Completion Certificate Date</td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <input type="text" id="ccompletionCertificateDate" class="textBox" name="txtcCompletionCertificateDate" value="<%=Session["completioncertificatedate"]%>" /></td>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                        &nbsp;</td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        <asp:CheckBox ID="cbxWarrantyClaimQuotationTender" runat="server" 
                            AutoPostBack="True" CssClass="checkBox" 
                            oncheckedchanged="cbxWarrantyClaimQuotationTender_CheckedChanged" 
                            Text="Warranty Claim" TextAlign="Left" />
                    </td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <asp:TextBox ID="txtWarrantyMonthsQuotationTender" runat="server" 
                            CssClass="textBox" Enabled="False" ForeColor="Silver">Enter No of Months</asp:TextBox>
                    </td>
                    <td style="width: 237px; height: 19px; text-align: left">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        File Sent for Payment</td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <input type="text" id="cfileSentForPaymentDate" class="textBox" 
                            name="txtcFileSentForPaymentDate" 
                            value='<%=Session["filesentforpaymentdate"]%>' /></td>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        Payment Made Date</td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <input type="text" id="cpaymentMadeDate" class="textBox" 
                            name="txtcPaymentMadeDate" value='<%=Session["paymentmadedate"]%>' /></td>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        Follow Up Date</td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <input ID="cfollowUpDate" class="textBox" name="txtcFollowUpDate" type="text" 
                            value='<%=Session["paymentmadedate"] %>' /></td>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        Remarks</td>
                    <td style="width: 326px; text-align:left; height: 19px;">
                        <asp:TextBox ID="txtcFollowUpRemarks" runat="server" CssClass="textBox" 
                            Height="50px" TextMode="MultiLine" Width="326px"></asp:TextBox>
                    </td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                        </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 39px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 39px;">
                    </td>
                    <td style="width: 326px; text-align: right; height: 39px;">
                        <asp:ImageButton ID="ImageButton6" runat="server" Height="31px" 
                            ImageUrl="~/images/Save.jpg" OnClick="ImageButton6_Click" Width="74px" />
                        &nbsp;</td>
                    <td style="width: 237px; text-align: left; height: 39px;">
                        <asp:Button ID="btnRemarksQuotation" runat="server" CssClass="button" 
                            OnClick="btnRemarksQuotation_Click" Text="Remarks" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                    </td>
                    <td style="width: 326px; text-align: left">
                        <asp:Label ID="lblcFileDetail" runat="server" CssClass="error_text"></asp:Label>
                    </td>
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
                    <td style="width: 25px; height: 19px; text-align: left">
                    </td>
                    <td style="width: 900px; height: 19px; text-align: center"><asp:GridView ID="gvQuotationDetailView" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField HeaderText="Sr">
                                <ItemTemplate>
                                    <asp:Label ID="lblSr" runat="server" CssClass="labelFont"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="typeofprocurement" HeaderText="Type of Procurement">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="sourceoffunding" HeaderText="Source of Funding">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="diaryindate" HeaderText="Diary in Date">
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
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="supplyorderdate" HeaderText="Supply Order Date">
                                <HeaderStyle CssClass="gridHeader" />
                                <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="vendor" HeaderText="Vendor Name">
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
                    <td style="width: 25px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 25px; text-align: left">
                    </td>
                    <td style="width: 900px; text-align:center">
                        <asp:GridView ID="gvcQuotation" runat="server" AutoGenerateColumns="False" Visible="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSr" runat="server" CssClass="labelFont"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="gridHeader" HorizontalAlign="Center" Width="30px" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Center" Width="30px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="operationaldate" HeaderText="Operational Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:BoundField>
                                <asp:BoundField DataField="quotationinviteddate" HeaderText="Quotation Invited Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:BoundField>
                                <asp:BoundField DataField="purchasecommitteedate" HeaderText="CPC Meeting Date">
                                    <HeaderStyle CssClass="gridHeader" Width="100px" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="comparativestatementdate" HeaderText="CS Finalised Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:BoundField>
                                <asp:BoundField DataField="finalapprovaldate" HeaderText="Final Approval Date">
                                    <HeaderStyle CssClass="gridHeader" Width="100px" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="approvedamount" HeaderText="Approved Amount">
                                    <HeaderStyle CssClass="gridHeader" Width="100px" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="supplyorderdate" HeaderText="Supply Order Date">
                                    <HeaderStyle CssClass="gridHeader" Width="100px" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vendorname" HeaderText="Vendor">
                                    <HeaderStyle CssClass="gridHeader" Width="270px" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="150px" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        &nbsp;
                    </td>
                    <td style="width: 25px; text-align: left">
                    </td>
                </tr>
            </table>
        </asp:View><asp:View ID="vwQuotationCaseRemarks" runat="server">
            <table align="center" width="950">
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td colspan="2" style="font-size: small; font-family: Verdana; text-align:center; background-color:#333333; color:White">
                        <strong>Add File Remarks (Quotation Case)</strong></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        File No</td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                        <asp:TextBox ID="txtcFileNoRemarks" runat="server" CssClass="textBox" Width="326px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        Location</td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                        <asp:DropDownList ID="ddlcLocation" runat="server" CssClass="textBox" Width="326px">
                        </asp:DropDownList></td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Remarks</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtcRemarks" runat="server" CssClass="textBox" Height="100px" TextMode="MultiLine"
                            Width="326px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 39px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 39px;">
                    </td>
                    <td style="width: 326px; text-align:right; height: 39px;">
                        <asp:ImageButton ID="ImageButton7" runat="server" Height="31px" ImageUrl="~/images/Save.jpg"
                            OnClick="ImageButton7_Click" Width="74px" />&nbsp;</td>
                    <td style="width: 237px; text-align: left; height: 39px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                    </td>
                    <td style="width: 326px; text-align: left">
                        <asp:Label ID="lblcErrorRemarks" runat="server" CssClass="error_text"></asp:Label></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                    </td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                    </td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                </tr>
            </table>
            <table align="center" width="950">
                <tr>
                    <td style="width: 25px; text-align: left">
                    </td>
                    <td style="width: 900px; text-align:center">
                        <asp:GridView ID="gvcFileRemarks" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSr" runat="server" CssClass="labelFont"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="gridHeader" HorizontalAlign="Center" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Center" Width="30px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="remarksdate" HeaderText="Remarks Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="remarks" HeaderText="Remarks">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="370px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="location" HeaderText="Location">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="200px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="recordby" HeaderText="Record By">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="200px" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        &nbsp;
                    </td>
                    <td style="width: 25px; text-align: left">
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View id="View1" onactivate="vwQuotation_Activate" runat="server">
            <TABLE width=950 align=center><TBODY>
                <tr><td style="WIDTH: 237px; TEXT-ALIGN: left"></td>
                    <td 
                        style="text-align: center; font-size: small; color: white; font-family: Verdana; background-color: #333333;" 
                        colspan="2"><strong>Add File Details (Petty Cash Case)</strong></td>
                    <td style="width: 237px; text-align: left"></td></tr>
                <TR><TD style="WIDTH: 237px; TEXT-ALIGN: left; height: 19px;"></TD>
                    <td 
                    style="FONT-SIZE: small; WIDTH: 150px; FONT-FAMILY: Verdana; HEIGHT: 19px; TEXT-ALIGN: left">File No</td>
                    <td style="WIDTH: 326px; HEIGHT: 19px; TEXT-ALIGN: left">
                        <asp:TextBox ID="txtdFileNoDetail" runat="server" CssClass="textBox" 
                            ReadOnly="True" Width="326px"></asp:TextBox></td>
                    <TD style="WIDTH: 237px; TEXT-ALIGN: left; height: 19px;"></TD></TR>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td 
                        style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Subject</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtPettyCashSubject" runat="server" CssClass="textBox" 
                            ReadOnly="True" Width="326px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <TR><TD style="WIDTH: 237px; TEXT-ALIGN: left"></TD>
                    <td 
                    style="FONT-SIZE: small; WIDTH: 150px; FONT-FAMILY: Verdana; TEXT-ALIGN: left">Approved Amount</td>
                    <td style="WIDTH: 326px; TEXT-ALIGN: left">
                        <asp:TextBox ID="txtdApprovedAmount" runat="server" CssClass="textBox" 
                            Width="326px"></asp:TextBox></td>
                    <TD style="WIDTH: 237px; TEXT-ALIGN: left"></TD></TR>
                <tr><td style="WIDTH: 237px; TEXT-ALIGN: left"></td>
                    <td 
                        style="FONT-SIZE: small; WIDTH: 150px; FONT-FAMILY: Verdana; TEXT-ALIGN: left">Supply Date</td>
                    <td style="WIDTH: 326px; TEXT-ALIGN: left">
            <input id="dsupplyDate" class="textBox" name="txtdSupplyDate" type="text" 
                            value='<%=Session["supplydate"]%>' /></td>
                    <td style="WIDTH: 237px; TEXT-ALIGN: left"></td></tr>
                <tr><td style="WIDTH: 237px; TEXT-ALIGN: left"></td>
                    <td 
                        style="FONT-SIZE: small; WIDTH: 150px; FONT-FAMILY: Verdana; TEXT-ALIGN: left">Vendor Name</td>
                    <td style="WIDTH: 326px; TEXT-ALIGN: left">
                        <asp:DropDownList ID="ddldVendor" runat="server" CssClass="textBox" 
                            Width="326px">
                        </asp:DropDownList></td><td style="WIDTH: 237px; TEXT-ALIGN: left"></td></tr><tr>
                    <td style="WIDTH: 237px; HEIGHT: 19px; TEXT-ALIGN: left"></td>
                    <td 
                    style="FONT-SIZE: small; WIDTH: 150px; FONT-FAMILY: Verdana; HEIGHT: 19px; TEXT-ALIGN: left">Stock Entry Forwarded Date</td>
                    <td style="WIDTH: 326px; HEIGHT: 19px; TEXT-ALIGN: left">
                        <input id="dstockEntryForwardedDate" class="textBox" 
                            name="txtdStockEntryForwardedDate" type="text" 
                            value='<%=Session["stockentryforwardeddate"]%>' /></td>
                    <td style="WIDTH: 237px; HEIGHT: 19px; TEXT-ALIGN: left"></td></tr>
                <tr><td style="WIDTH: 237px; HEIGHT: 19px; TEXT-ALIGN: left"></td>
                    <td 
                        style="FONT-SIZE: small; WIDTH: 150px; FONT-FAMILY: Verdana; HEIGHT: 19px; TEXT-ALIGN: left">Completion Certificate Date</td>
                    <td style="WIDTH: 326px; HEIGHT: 19px; TEXT-ALIGN: left">
                        <input id="dcompletionCertificateDate" class="textBox" 
                            name="txtdCompletionCertificateDate" type="text" 
                            value='<%=Session["completioncertificatedate"]%>' /></td>
                    <td style="WIDTH: 237px; HEIGHT: 19px; TEXT-ALIGN: left"></td></tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                        &#160;</td>
                    <td 
                        style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        <asp:CheckBox ID="cbxWarrantyClaimPettyCashTender" runat="server" 
                            AutoPostBack="True" CssClass="checkBox" 
                            oncheckedchanged="cbxWarrantyClaimPettyCashTender_CheckedChanged" 
                            Text="Warranty Claim" TextAlign="Left" />
                    </td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <asp:TextBox ID="txtWarrantyMonthsPettyCashTender" runat="server" 
                            CssClass="textBox" Enabled="False" ForeColor="Silver">Enter No of Months</asp:TextBox>
                    </td>
                    <td style="width: 237px; height: 19px; text-align: left">
                        &#160;</td>
                </tr>
                <tr><td style="WIDTH: 237px; HEIGHT: 19px; TEXT-ALIGN: left"></td>
                    <td 
                        style="FONT-SIZE: small; WIDTH: 150px; FONT-FAMILY: Verdana; HEIGHT: 19px; TEXT-ALIGN: left">File Sent for Payment</td>
                    <td style="WIDTH: 326px; HEIGHT: 19px; TEXT-ALIGN: left">
                        <input id="dfileSentForPaymentDate" class="textBox" 
                            name="txtdFileSentForPaymentDate" type="text" 
                            value='<%=Session["filesentforpaymentdate"]%>' /></td>
                    <td style="WIDTH: 237px; HEIGHT: 19px; TEXT-ALIGN: left"></td></tr>
                <tr>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                    <td 
                        style="font-size: small; width: 150px; font-family: Verdana; height: 19px; text-align: left">
                        Payment made date</td>
                    <td style="width: 326px; height: 19px; text-align: left">
                        <input id="dpaymentMadeDate" class="textBox" name="txtdPaymentMadeDate" 
                            type="text" value='<%=Session["paymentmadedate"]%>' /></td>
                    <td style="width: 237px; height: 19px; text-align: left">
                    </td>
                </tr>
                <tr><td style="WIDTH: 237px; HEIGHT: 39px; TEXT-ALIGN: left"></td>
                    <td 
                        style="FONT-SIZE: small; WIDTH: 150px; FONT-FAMILY: Verdana; HEIGHT: 39px; TEXT-ALIGN: left"></td>
                    <td style="WIDTH: 326px; HEIGHT: 39px; TEXT-ALIGN: right"><asp:ImageButton 
                            ID="ImageButton9" runat="server" Height="31px" ImageUrl="~/images/Save.jpg" 
                            onclick="ImageButton9_Click" Width="74px">
                        </asp:ImageButton>&#160;</td>
                    <td style="WIDTH: 237px; HEIGHT: 39px; TEXT-ALIGN: left">
                        <asp:Button ID="Button1" runat="server" CssClass="button" 
                            OnClick="Button1_Click" Text="Remarks" /></td></tr>
                <tr><td style="WIDTH: 237px; TEXT-ALIGN: left"></td>
                    <td 
                        style="FONT-SIZE: small; WIDTH: 150px; FONT-FAMILY: Verdana; TEXT-ALIGN: left"></td><td 
                        style="WIDTH: 326px; TEXT-ALIGN: left"><asp:Label ID="lbldFileDetail" 
                            runat="server" CssClass="error_text"></asp:Label></td>
                    <td style="WIDTH: 237px; TEXT-ALIGN: left"></td></tr>
                <tr><td style="WIDTH: 237px; TEXT-ALIGN: left"></td>
                    <td 
                        style="FONT-SIZE: small; WIDTH: 150px; FONT-FAMILY: Verdana; TEXT-ALIGN: left"></td><td 
                        style="WIDTH: 326px; TEXT-ALIGN: left"></td><td 
                        style="WIDTH: 237px; TEXT-ALIGN: left"></td></tr></TBODY></TABLE><TABLE width=950 align=center><TBODY>
                <tr><td style="WIDTH: 25px; HEIGHT: 19px; TEXT-ALIGN: left"></td>
                    <td style="WIDTH: 900px; HEIGHT: 19px; TEXT-ALIGN: center"><asp:GridView 
                            ID="gvPettyCashDetailView" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSr" runat="server" CssClass="labelFont"></asp:Label>
                                    </ItemTemplate>
                                
                                
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="typeofprocurement" HeaderText="Type of Procurement">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="sourceoffunding" HeaderText="Source of Funding">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="diaryindate" HeaderText="Diary in Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="tender_quotation_date" 
                                    HeaderText="Tender/Quotation Date">
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
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="supplyorderdate" HeaderText="Supply Order Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vendor" HeaderText="Vendor Name">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="supplydate" HeaderText="Supply Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="stockentryforwardeddate" 
                                    HeaderText="Stock Entry Forwarded Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="completioncertificatedate" 
                                    HeaderText="Completion Certificate Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="filesentforpaymentdate" 
                                    HeaderText="File Sent For Payment Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="paymentmadedate" HeaderText="Payment Made Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" />
                                </asp:BoundField>
                            </Columns>
                        
                    
                        </asp:GridView>
                        </td><td style="WIDTH: 25px; HEIGHT: 19px; TEXT-ALIGN: left"></td></tr><tr>
                    <td style="WIDTH: 25px; TEXT-ALIGN: left"></td>
                    <td style="WIDTH: 900px; TEXT-ALIGN: center">
                        <asp:GridView ID="gvdPettyCash" runat="server" AutoGenerateColumns="False" 
                            Visible="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSr" runat="server" CssClass="labelFont"></asp:Label>
                                    </ItemTemplate>
                                
                                
                                    <HeaderStyle CssClass="gridHeader" HorizontalAlign="Center" Width="30px" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Center" Width="30px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="operationaldate" HeaderText="Operational Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:BoundField>
                                <asp:BoundField DataField="supplydate" HeaderText="Supply Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:BoundField>
                                <asp:BoundField DataField="stockentryforwardeddate" 
                                    HeaderText="Stock Entry Forwarded Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:BoundField>
                                <asp:BoundField DataField="completioncertificatedate" 
                                    HeaderText="Completion Certificate Date">
                                    <HeaderStyle CssClass="gridHeader" Width="100px" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="filesentforpaymentdate" 
                                    HeaderText="File Sent For Payment Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:BoundField>
                            </Columns>
                            
                            
                        </asp:GridView> &#160; </td><td style="WIDTH: 25px; TEXT-ALIGN: left"></td></tr></TBODY></TABLE></asp:View>
        <asp:View ID="vwPettyCashRemarks" runat="server">
            <table align="center" width="950">
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td colspan="2" style="font-size: small; font-family: Verdana; text-align:center; background-color:#333333; color:White">
                        <strong>Add File Remarks (Petty Case)</strong></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        File No</td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                        <asp:TextBox ID="txtdFileNoRemarks" runat="server" CssClass="textBox" Width="326px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        Location</td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                        <asp:DropDownList ID="ddldLocation" runat="server" CssClass="textBox" Width="326px">
                        </asp:DropDownList></td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 91px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 91px;">
                        Remarks</td>
                    <td style="width: 326px; text-align: left; height: 91px;">
                        <asp:TextBox ID="txtdRemarks" runat="server" CssClass="textBox" Height="100px" TextMode="MultiLine"
                            Width="326px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left; height: 91px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 39px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 39px;">
                    </td>
                    <td style="width: 326px; text-align:right; height: 39px;">
                        <asp:ImageButton ID="ImageButton8" runat="server" Height="31px" ImageUrl="~/images/Save.jpg"
                            OnClick="ImageButton8_Click" Width="74px" />&nbsp;</td>
                    <td style="width: 237px; text-align: left; height: 39px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                    </td>
                    <td style="width: 326px; text-align: left">
                        <asp:Label ID="lbldErrorRemarks" runat="server" CssClass="error_text"></asp:Label></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                    </td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                    </td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                </tr>
            </table>
            <table align="center" width="950">
                <tr>
                    <td style="width: 25px; text-align: left">
                    </td>
                    <td style="width: 900px; text-align:center">
                        <asp:GridView ID="gvdFileRemarks" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSr" runat="server" CssClass="labelFont"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="gridHeader" HorizontalAlign="Center" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Center" Width="30px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="remarksdate" HeaderText="Remarks Date">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="remarks" HeaderText="Remarks">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="370px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="location" HeaderText="Location">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="200px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="recordby" HeaderText="Record By">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="200px" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        &nbsp;
                    </td>
                    <td style="width: 25px; text-align: left">
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="vwEditFile" runat="server">
            <table align="center" width="950">
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td colspan="2" 
                        style="font-size: small; font-family: Verdana; text-align:center; background-color:#333333; color:White">
                        <strong>Edit File</strong></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        File No</td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                        <asp:TextBox ID="txtEditFileNo" runat="server" CssClass="textBox" Width="326px" 
                            Enabled="False" ReadOnly="True">CIIT-LHR/Pur-</asp:TextBox>
                    </td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="txtFileNo" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Subject</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtEditSubject" runat="server" CssClass="textBox" 
                            Width="326px" Height="80px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td style="width: 237px; text-align: left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                            ControlToValidate="txtSubject" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        End User / Initiator</td>
                    <td style="width: 326px; text-align: left">
                        <asp:DropDownList ID="ddlEditDepartment" runat="server" CssClass="textBox" 
                            Width="326px">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 237px; text-align: left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                            ControlToValidate="ddlDepartment" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Event</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtEditEvent" runat="server" CssClass="textBox" Width="326px"></asp:TextBox>
                    </td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Type of Procurement</td>
                    <td style="width: 326px; text-align: left">
                        <asp:DropDownList ID="cbxEditTypeofProcurement" runat="server" CssClass="textBox" 
                            Width="326px">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Source of Funding</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtEditSourceofFunding" runat="server" CssClass="textBox" 
                            Width="326px">CIIT Lahore</asp:TextBox>
                    </td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        File Type</td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                        <asp:DropDownList ID="ddlEditFileType" runat="server" CssClass="textBox" 
                            Width="326px">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                            ControlToValidate="ddlFileType" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 20px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 20px;">
                        Request Approval Date</td>
                    <td style="width: 326px; text-align: left; height: 20px;">
                        <input ID="EditrequisitionDate" class="textBox" name="datepickerFromEdit" 
                            type="text" runat="server" /></td>
                    <td style="width: 237px; text-align: left; height: 20px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 39px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 39px;">
                    </td>
                    <td style="width: 326px; text-align: right; height: 39px;">
                        <asp:ImageButton ID="btnUpdate" runat="server" Height="31px" 
                            ImageUrl="~/images/Save.jpg" OnClick="btnUpdate_Click" Width="74px" />
                        &nbsp;</td>
                    <td style="width: 237px; text-align: left; height: 39px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                    </td>
                    <td style="width: 326px; text-align: left">
                        <asp:Label ID="lblUpdateMessage" runat="server" CssClass="error_text"></asp:Label>
                    </td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>

