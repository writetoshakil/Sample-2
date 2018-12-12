<%@ Page Language="C#" MasterPageFile="~/mp_Login.master" AutoEventWireup="true" CodeFile="frmLogin.aspx.cs" Inherits="frmLogin" Title="Login Form" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderPublic" Runat="Server">
    <asp:MultiView ID="mv" runat="server">
        <asp:View ID="vwBook" runat="server" >
            <br />
            <br />
            <br />
            <br />
            <br />
            <table align="center" width="950">
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td colspan="2" style="font-size: small; color: white; font-family: Verdana; background-color: #333333;
                        text-align: center">
                        <strong>Login To The System</strong></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Login</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtLogin" runat="server" CssClass="textBox" Width="326px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLogin"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Password</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="textBox" Width="326px" TextMode="Password"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                    </td>
                    <td style="width: 326px; text-align:center">
                        &nbsp;<asp:ImageButton ID="btnLogin" runat="server" ImageUrl="~/images/login_2.bmp" OnClick="btnLogin_Click" Height="39px" Width="98px" /></td>
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
            </table>
        </asp:View>
        &nbsp;&nbsp;
    </asp:MultiView>
</asp:Content>

