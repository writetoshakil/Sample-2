<%@ Page Language="C#" MasterPageFile="~/mp.master" AutoEventWireup="true" CodeFile="frmVendor.aspx.cs" Inherits="frmVendor" Title="Vendor Information" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderPublic" Runat="Server">

    <script type="text/javascript">
        function doDeleteRecord()
        {
            var flag;
            flag = confirm("Do you want to delete this Record");
        }
    </script>
    <asp:MultiView ID="mvVendor" runat="server">
        <asp:View ID="vw_AddNewVendor" runat="server">
            <table align="center" width="950">
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td colspan="2" style="font-size: small; font-family: Verdana; text-align:center; background-color:#333333; color:White">
                        <strong>
                            Add New Vendor
                        </strong>
                    </td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        Name</td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                        <asp:TextBox ID="txtName" runat="server" CssClass="textBox" Width="326px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                        &nbsp;</td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Designation</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtDesignation" runat="server" CssClass="textBox" 
                            Width="326px"></asp:TextBox>
                    </td>
                    <td style="width: 237px; text-align: left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtDesignation" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Contact Person 1</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtContactPerson" runat="server" CssClass="textBox" 
                            Width="326px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="txtContactPerson" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                        &nbsp;</td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Contact Person 2</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtContactPerson2" runat="server" CssClass="textBox" 
                            Width="326px"></asp:TextBox>
                    </td>
                    <td style="width: 237px; text-align: left">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Address</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="textBox" Width="326px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="txtAddress" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Contact No</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtContactNo" runat="server" CssClass="textBox" Width="326px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="txtContactNo" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Cell No</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtCellNo" runat="server" CssClass="textBox" Width="326px"></asp:TextBox></td>
                    <td style="width: 237px; text-align: left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="txtCellNo" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; ">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; ">
                        Email ID</td>
                    <td style="width: 326px; text-align:left; ">
                        <asp:TextBox ID="txtEmailID" runat="server" CssClass="textBox" Width="326px"></asp:TextBox>
                    </td>
                    <td style="width: 237px; text-align: left; vertical-align:top" rowspan="2">
                        <asp:Label ID="lblError" runat="server" CssClass="error_text"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                        &nbsp;</td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Pre-Qualified</td>
                    <td style="width: 326px; text-align: left">
                        <asp:DropDownList ID="ddlPreQualification" runat="server" CssClass="textBox" 
                            Width="70px">
                            <asp:ListItem Value="1">Yes</asp:ListItem>
                            <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                        &nbsp;</td>
                    <td colspan="2" 
                        style="font-size: small; font-family: Verdana; text-align: left">
                        <asp:GridView ID="gvNatureOfBusiness" runat="server" 
                            AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="BusinessID" HeaderText="ID">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Center" Width="76px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="natureofbusiness" HeaderText="Nature of Business">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="300px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Select">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbxSelect" runat="server" CssClass="checkBox" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Center" Width="100px" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td style="width: 237px; text-align: left">
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
                    </td>
                    <td style="width: 237px; text-align: left; height: 39px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                    </td>
                    <td style="width: 326px; text-align: left">
                        &nbsp;</td>
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
                    <td style="text-align: left">
                        <asp:GridView ID="dgVendor" runat="server" AutoGenerateColumns="False" 
                            onrowcommand="dgVendor_RowCommand" onrowediting="dgVendor_RowEditing" 
                                onrowdeleting="dgVendor_RowDeleting" 
                            onrowdatabound="dgVendor_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSr" runat="server" CssClass="labelFont"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="gridHeader" HorizontalAlign="Center" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Center" Width="30px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="vendorid" HeaderText="ID">
                                    <HeaderStyle CssClass="gridHeader" HorizontalAlign="Center" />
                                    <ItemStyle CssClass="gridItem" Width="30px" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Name" DataField="name">
                                    <HeaderStyle CssClass="gridHeader" HorizontalAlign="Left" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="175px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="natureofbusiness" HeaderText="Nature of Business">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Address" DataField="address">
                                    <HeaderStyle CssClass="gridHeader" HorizontalAlign="Left" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="200px" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Contact 1" DataField="contactno">
                                    <HeaderStyle CssClass="gridHeader" HorizontalAlign="Left" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="95px" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Contact 2" DataField="mobileno">
                                    <HeaderStyle CssClass="gridHeader" HorizontalAlign="Left" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="95px" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Email ID" DataField="emailid">
                                    <HeaderStyle CssClass="gridHeader" HorizontalAlign="Left" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="175px" />
                                </asp:BoundField>
                                <asp:ButtonField ButtonType="Image" HeaderText="Edit" 
                                    ImageUrl="~/images/Edit.jpg" CommandName="Edit">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Center" Width="50px" />
                                </asp:ButtonField>
                                <asp:ButtonField ButtonType="Image" CommandName="Delete" HeaderText="Del" 
                                    ImageUrl="~/images/Delete.jpg" Visible="False" >
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Center" Width="50px" />
                                </asp:ButtonField>
                                <asp:TemplateField HeaderText="Del">
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" name="btnDelete" CommandName="Delete"  
                                            CommandArgument='<%# Container.DataItemIndex %>' 
                                            OnClientClick="return confirm('Do you want to delete this record?');" 
                                            Text="Delete" runat="server" CssClass="button" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" />
                                    </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                
            </table>
        </asp:View>
        <asp:View ID="vw_EditVendor" runat="server">
            <table align="center" width="950">
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td colspan="2" 
                        style="font-size: small; font-family: Verdana; text-align:center; background-color:#333333; color:White">
                        <strong>Edit Vendor Detail</strong></td>
                    <td style="width: 237px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 19px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 19px;">
                        Name</td>
                    <td style="width: 326px; text-align: left; height: 19px;">
                        <asp:TextBox ID="txtEditName" runat="server" CssClass="textBox" Width="326px"></asp:TextBox>
                    </td>
                    <td style="width: 237px; text-align: left; height: 19px;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="txtEditName" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                        &nbsp;</td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Designation</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtEditDesignation" runat="server" CssClass="textBox" 
                            Width="326px"></asp:TextBox>
                    </td>
                    <td style="width: 237px; text-align: left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                            ControlToValidate="txtEditDesignation" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Contact Person 1</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtEditContactPerson1" runat="server" CssClass="textBox" 
                            Width="326px"></asp:TextBox>
                    </td>
                    <td style="width: 237px; text-align: left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                            ControlToValidate="txtEditContactPerson1" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                        &nbsp;</td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Contact Person 2</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtEditContactPerson2" runat="server" CssClass="textBox" 
                            Width="326px"></asp:TextBox>
                    </td>
                    <td style="width: 237px; text-align: left">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Address</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtEditAddress" runat="server" CssClass="textBox" 
                            Width="326px"></asp:TextBox>
                    </td>
                    <td style="width: 237px; text-align: left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                            ControlToValidate="txtEditAddress" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Contact No</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtEditContactNo" runat="server" CssClass="textBox" 
                            Width="326px"></asp:TextBox>
                    </td>
                    <td style="width: 237px; text-align: left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                            ControlToValidate="txtEditContactNo" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Cell No</td>
                    <td style="width: 326px; text-align: left">
                        <asp:TextBox ID="txtEditCellNo" runat="server" CssClass="textBox" Width="326px"></asp:TextBox>
                    </td>
                    <td style="width: 237px; text-align: left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                            ControlToValidate="txtEditCellNo" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; ">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; ">
                        Email ID</td>
                    <td style="width: 326px; text-align:left; ">
                        <asp:TextBox ID="txtEditEmailID" runat="server" CssClass="textBox" 
                            Width="326px"></asp:TextBox>
                    </td>
                    <td style="width: 237px; text-align: left; ">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                        &nbsp;</td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                        Pre-Qualified</td>
                    <td style="width: 326px; text-align: left">
                        <asp:DropDownList ID="ddlEditPreQualification" runat="server" 
                            CssClass="textBox" Width="70px">
                            <asp:ListItem Value="1">Yes</asp:ListItem>
                            <asp:ListItem Value="0">No</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="width: 237px; text-align: left">
                        <asp:HiddenField ID="hfVendorID" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                        &nbsp;</td>
                    <td colspan="2" 
                        style="font-size: small; font-family: Verdana; text-align: left">
                        <asp:GridView ID="gvEditNatureOfBusiness" runat="server" 
                            AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="BusinessID" HeaderText="ID">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Center" Width="76px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="natureofbusiness" HeaderText="Nature of Business">
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Left" Width="300px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Select">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbxEditSelect" runat="server" CssClass="checkBox" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="gridHeader" />
                                    <ItemStyle CssClass="gridItem" HorizontalAlign="Center" Width="100px" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td style="width: 237px; text-align: left">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left; height: 39px;">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left; height: 39px;">
                    </td>
                    <td style="width: 326px; text-align:right; height: 39px;">
                        <asp:ImageButton ID="btnUpdate" runat="server" Height="31px" 
                            ImageUrl="~/images/Save.jpg" OnClick="btnUpdate_Click" Width="74px" />
                    </td>
                    <td style="width: 237px; text-align: left; height: 39px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 237px; text-align: left">
                    </td>
                    <td style="font-size: small; width: 150px; font-family: Verdana; text-align: left">
                    </td>
                    <td style="width: 326px; text-align: left">
                        <asp:Label ID="lblUpdate" runat="server" CssClass="error_text"></asp:Label>
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
        </asp:View>
    </asp:MultiView>
        
</asp:Content>

