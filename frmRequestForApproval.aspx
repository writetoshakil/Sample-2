<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmRequestForApproval.aspx.cs" Inherits="frmRequestForApproval" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Procurement Request Approval Form</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:100%">
        <div style="width:800px; border:solid 1px #000000; height:100px; margin-right:auto; margin-left:auto">
            <table style="width:800px">
                <tr>
                    <td style="text-align:center">
                        Name of Procuring Agency: COMSATS Institute of Information Tedchnology, Lahore
                    </td>
                </tr>
                <tr style ="text-align:center">
                    <td>
                            REQUEST FOR APPROVAL TO START PROCUREMENT PROCESS
                    </td>
                </tr>
                <tr style ="text-align:right">
                    <td>
                        <asp:Label ID="lblFileNo" runat="server" CssClass="labelFont"></asp:Label></td>
                </tr>
            </table>
            <table style="width:800px">
                <tr>
                    <td style="width:250px; text-align:left">
                        Department / Project
                    </td>
                    <td style="width:550px; text-align:left">
                    </td>
                </tr>
                <tr>
                    <td style="width:250px; text-align:left">
                        Subject of Procurement
                    </td>
                    <td style="width:550px; text-align:left">
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <table style="width:800px">
                <tr>
                    <td colspan="3" style="text-align:center">
                        Proposed Method of Procurement
                    </td>
                </tr>
                <tr>
                    <td style="text-align:center; width:50px">
                        1
                    </td>
                    <td style="text-align:left; width:550px">
                        Estimated Cost (currency and amount)
                    </td>
                    <td style="text-align:left; width:200px">
                        <asp:Label ID="lblEstimatedCost" runat="server" CssClass="labelFont"></asp:Label></td>
                </tr>
                <tr>
                    <td style="text-align:center; width:50px">
                        2
                    </td>
                    <td style="text-align:left; width:550px">
                        Source of Funding
                    </td>
                    <td style="text-align:left; width:200px">
                        CIIT-Lahore</td>
                </tr>
                <tr>
                    <td style="text-align:center; width:50px">
                        3
                    </td>
                    <td style="text-align:left; width:550px">
                        Proposed Method of Procurement (e.g. RFQ, Pre-qualification, OPen Tender, Direct Contracting, Negotiated Tendering etc)
                    </td>
                    <td style="text-align:left; width:200px">
                        <asp:Label ID="lblMethodOfProcurement" runat="server" CssClass="labelFont"></asp:Label></td>
                </tr>
                <tr>
                    <td style="text-align:center; width:50px">
                        4
                    </td>
                    <td style="text-align:left; width:550px">
                        Bid Submission Procedure. <br /> Single Stage-One Envelope/Two Envelope etc
                    </td>
                    <td style="text-align:left; width:200px">
                        <asp:Label ID="lblBidSubmissionProcedure" runat="server" CssClass="labelFont"></asp:Label></td>
                </tr>
                <tr>
                    <td style="text-align:center; width:50px">
                        5
                    </td>
                    <td style="text-align:left; width:550px">
                        Proposed Method of Procurement NOtice/Invitations and Advertisement
                    </td>
                    <td style="text-align:left; width:200px">
                        Three quotation from open market</td>
                </tr>
                <tr>
                    <td style="text-align:center; width:50px">
                        6
                    </td>
                    <td style="text-align:left; width:550px">
                        For Open Tender, Pre-Qualification, RFP etc, sate proposed/tentitive date of Procurement Notice and Advertisement
                    </td>
                    <td style="text-align:left; width:200px">
                        <asp:Label ID="lblTentativeDateOfProcurement" runat="server" CssClass="labelFont"></asp:Label></td>
                </tr>
                <tr>
                    <td style="text-align:center; width:50px">
                        7
                    </td>
                    <td style="text-align:left; width:550px">
                        Response Time and Date for Receipt of Bids and Proposals
                    </td>
                    <td style="text-align:left; width:200px">
                    </td>
                </tr>
            </table>
            <br /><br /><br /><br />
            Checked and submitted by Purchase Officer: (signature)_____________________ Date:____________
            <br /><br /><br /><br />
            Approved by Manager Purchase: (signature)________________________ Date:_______________
        </div>
    </div>
    </form>
</body>
</html>
