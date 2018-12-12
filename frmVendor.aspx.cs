using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class frmVendor : System.Web.UI.Page
{
    SqlTransaction transaction;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            try
            {
                lblError.ForeColor = System.Drawing.Color.Red;
                BindVendor();
                NatureofBusiness();
                mvVendor.ActiveViewIndex = 0;
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }

    private void NatureofBusiness()
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select businessid, natureofbusiness from tblNatureofBusiness";
        try
        {
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            gvNatureOfBusiness.DataSource = dt;
            gvNatureOfBusiness.DataBind();
            gvEditNatureOfBusiness.DataSource = dt;
            gvEditNatureOfBusiness.DataBind();
        }
        catch (Exception)
        {
            
        }
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Boolean bit = false;
        foreach (GridViewRow row in gvNatureOfBusiness.Rows)
        {
            CheckBox cbxSelect = (CheckBox)row.FindControl("cbxSelect");
            if (cbxSelect.Checked == true)
                bit = true;
        }
        if (bit == true)
        {
            SqlConnection con = DAL.GetConnection();
            SqlCommand cmd = new SqlCommand();
            int LastVendorID;
            if (txtCellNo.Text.Contains("-") || txtCellNo.Text.Contains(" ") || txtCellNo.Text.Length != 12)
            {
                lblError.Text = "Invalid Mobile No. Either there is '-' or space in Mobile No or this is not according to format 923xxxxxxxxx (12 Characters)";
                lblError.Visible = true;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                try
                {

                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.Parameters.Clear();
                        cmd.CommandText = "insert into tblVendor values (@name, @designation, @contactPerson, @contactPerson2, @address, @contactno, @contactno2, @emailid, @prequalified, 1)";
                        cmd.Parameters.AddWithValue("@name", txtName.Text);
                        cmd.Parameters.AddWithValue("@designation", txtDesignation.Text);
                        cmd.Parameters.AddWithValue("@contactPerson", txtContactPerson.Text);
                        cmd.Parameters.AddWithValue("@contactPerson2", txtContactPerson2.Text);
                        cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                        cmd.Parameters.AddWithValue("@contactno", txtContactNo.Text);
                        cmd.Parameters.AddWithValue("@contactno2", txtCellNo.Text);
                        cmd.Parameters.AddWithValue("@emailid", txtEmailID.Text);
                        cmd.Parameters.AddWithValue("@prequalified", ddlPreQualification.SelectedValue);
                        cmd.ExecuteNonQuery();
                        LastVendorID = DAL.GetLastVendorID();
                        if (LastVendorID > 0)
                        {
                            try
                            {
                                transaction = con.BeginTransaction();
                                cmd.CommandTimeout = 1000;
                                cmd.Transaction = transaction;
                                foreach (GridViewRow row in gvNatureOfBusiness.Rows)
                                {
                                    CheckBox cbx = (CheckBox)row.FindControl("cbxSelect");
                                    if (cbx.Checked == true)
                                    {
                                        cmd.Parameters.Clear();
                                        cmd.CommandText = "insert into tblVendorNatureofBusiness values (@VendorID, @BusinessID)";
                                        cmd.Parameters.AddWithValue("@VendorID", LastVendorID);
                                        cmd.Parameters.AddWithValue("@BusinessID", row.Cells[0].Text);
                                        cmd.ExecuteNonQuery();
                                    }
                                }
                                transaction.Commit();
                                con.Close();
                                cmd.Dispose();
                                con.Dispose();
                                txtName.Text = "";
                                txtAddress.Text = "";
                                txtContactNo.Text = "";
                                txtCellNo.Text = "";
                                txtEmailID.Text = "";
                                BindVendor();
                                lblError.Text = "Record added successfully";
                                lblError.ForeColor = System.Drawing.Color.Green;
                                lblError.Visible = true;
                            }
                            catch (Exception)
                            {
                                transaction.Rollback();
                                cmd.CommandText = "delete from tblVendor where vendorid = @id";
                                cmd.Parameters.AddWithValue("@id", LastVendorID);
                                cmd.ExecuteNonQuery();
                                con.Close();
                                con.Dispose();
                                cmd.Dispose();
                            }
                        }
                        else
                        {

                        }
                    }
                }
                catch (Exception ex)
                {
                    con.Close();
                    con.Dispose();
                    cmd.Dispose();
                    lblError.Text = ex.Message;
                    lblError.ForeColor = System.Drawing.Color.Red;
                    lblError.Text = ex.Message;
                    lblError.Visible = true;
                }

            }
        }
        else
            lblError.Text = "Please select at least one Vendor Nature of Business";
    }

    protected void BindVendor()
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "sp_VendorNatureOfBusiness";
        cmd.CommandType = CommandType.StoredProcedure;
        try
        {
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            // below two lines are written to test how data table is used to write a xml file.
            //dt.TableName = "myTable";
            //dt.WriteXml(@"F:\vendors.xml", true);
            dgVendor.DataSource = dt;
            dgVendor.DataBind();
            foreach (GridViewRow row in dgVendor.Rows)
            {
                Label lblSr = (Label)row.FindControl("lblSr");
                lblSr.Text = Convert.ToString(row.RowIndex + 1);
            }
            
        }
        catch (Exception)
        {
            
        }
    }
    protected void dgVendor_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int RowNo = Convert.ToInt16(e.CommandArgument);
        string CommandName = e.CommandName;
        if (CommandName == "Edit")
        {
            try
            {
                hfVendorID.Value = dgVendor.Rows[RowNo].Cells[1].Text;
                DataTable dt = DAL.GetVendorDetail(Convert.ToInt16(dgVendor.Rows[RowNo].Cells[1].Text));
                DataTable dtNatureOfBusiness = DAL.GetVendorNatureOfBusiness(Convert.ToInt16(dgVendor.Rows[RowNo].Cells[1].Text));
                if (dt != null && dtNatureOfBusiness != null)
                {
                    txtEditName.Text = dt.Rows[0]["name"].ToString();
                    txtEditDesignation.Text = dt.Rows[0]["designation"].ToString();
                    txtEditContactPerson1.Text = dt.Rows[0]["contactperson"].ToString();
                    txtEditContactPerson2.Text = dt.Rows[0]["contactperson1"].ToString();
                    txtEditAddress.Text = dt.Rows[0]["address"].ToString();
                    txtEditContactNo.Text = dt.Rows[0]["contactno"].ToString();
                    txtEditCellNo.Text = dt.Rows[0]["mobileno"].ToString();
                    txtEditEmailID.Text = dt.Rows[0]["emailid"].ToString();
                    if (Convert.ToBoolean(dt.Rows[0]["prequalified"]) == true)
                        ddlEditPreQualification.SelectedValue = "1";
                    else
                        ddlEditPreQualification.SelectedValue = "0";
                    BindEditNatureOfBusiness(dtNatureOfBusiness);
                    mvVendor.ActiveViewIndex = 1;
                }
            }
            catch (Exception)
            {
                lblError.Text = "System could not find the Vendor's detail.";
                lblError.Visible = true;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }
        if (CommandName == "Delete")
        {
            
                SqlConnection con = DAL.GetConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "Update tblVendor set IsActive = 0 where vendorid = @id";
                cmd.Parameters.AddWithValue("@id", Convert.ToInt16(dgVendor.Rows[RowNo].Cells[1].Text));
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    dgVendor.DeleteRow(RowNo);
                    BindVendor();
                }
                catch (Exception)
                {

                }
            
        }
    }

    private void BindEditNatureOfBusiness(DataTable dtNatureOfBusiness)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select businessid, natureofbusiness from tblnatureofbusiness order by businessid";
        try
        {
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            gvEditNatureOfBusiness.DataSource = dt;
            gvEditNatureOfBusiness.DataBind();
            foreach (DataRow rowVendor in dtNatureOfBusiness.Rows)
            {
                foreach (GridViewRow row in gvEditNatureOfBusiness.Rows)
                {
                    if (rowVendor["businessid"].ToString() == row.Cells[0].Text)
                    {
                        CheckBox cbxSelect = (CheckBox)row.FindControl("cbxEditSelect");
                        cbxSelect.Checked = true;
                    }
                }
            }
        }
        catch (Exception)
        {
            
        }
    }
    protected void dgVendor_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void btnUpdate_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        try
        {
            con.Open();
            transaction = con.BeginTransaction();
            cmd.Transaction = transaction;
            cmd.CommandText = "update tblVendor set name=@name, designation=@designation, contactperson=@contactperson1, contactperson1=@contactperson2, address=@address, contactno=@contactno, mobileno=@mobileno, emailid=@emailid, prequalified=@prequalified where vendorid=@vendorid";
            cmd.Parameters.AddWithValue("@name", txtEditName.Text);
            cmd.Parameters.AddWithValue("@designation", txtEditDesignation.Text);
            cmd.Parameters.AddWithValue("@contactperson1", txtEditContactPerson1.Text);
            cmd.Parameters.AddWithValue("@contactperson2", txtEditContactPerson2.Text);
            cmd.Parameters.AddWithValue("@address", txtEditAddress.Text);
            cmd.Parameters.AddWithValue("@contactno", txtEditContactNo.Text);
            cmd.Parameters.AddWithValue("@mobileno", txtEditCellNo.Text);
            cmd.Parameters.AddWithValue("@emailid", txtEditEmailID.Text);
            if (ddlEditPreQualification.SelectedValue == "1")
                cmd.Parameters.AddWithValue("@prequalified", true);
            else
                cmd.Parameters.AddWithValue("@prequalified", false);
            cmd.Parameters.AddWithValue("@vendorid", hfVendorID.Value);
            cmd.ExecuteNonQuery();
            foreach (GridViewRow row in gvEditNatureOfBusiness.Rows)
            {
                CheckBox cbxSelect = row.FindControl("cbxEditSelect") as CheckBox;
                if (cbxSelect.Checked == true)
                {
                    cmd.Parameters.Clear();
                    cmd.CommandText = "sp_CheckAndAddNewVendorNatureOfBusiness";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@VendorID", hfVendorID.Value);
                    cmd.Parameters.AddWithValue("@BusinessID", row.Cells[0].Text);
                }
                else
                {
                    cmd.Parameters.Clear();
                    cmd.CommandText = "sp_DeleteVendorNatureOfBusiness";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@VendorID", hfVendorID.Value);
                    cmd.Parameters.AddWithValue("@BusinessID", row.Cells[0].Text);
                }
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (Exception)
                {

                }
            }
            transaction.Commit();
            con.Close();
            lblUpdate.Text = "Record updated successfully.";
            lblUpdate.ForeColor = System.Drawing.Color.Green;
            lblUpdate.Visible = true;
        }
        catch (Exception)
        {
            transaction.Rollback();
            con.Close();
            lblUpdate.Text = "Error occured.";
            lblUpdate.ForeColor = System.Drawing.Color.Red;
            lblUpdate.Visible = true;
        }
        
    }
    protected void dgVendor_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void dgVendor_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
}
