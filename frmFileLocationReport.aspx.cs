using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class frmFileLocationReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            BindDepartment();
            BindData();
        }
    }
    protected void BindDepartment()
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select departmentid, description from tblDepartment order by description";
        try
        {
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            ddlDepartment.DataSource = dt;
            ddlDepartment.DataTextField = "description";
            ddlDepartment.DataValueField = "departmentid";
            ddlDepartment.DataBind();
            ddlDepartment.Items.Insert(0, "--Select--");
        }
        catch (Exception)
        {
 
        }
    }
    private void BindData()
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "sp_FileLocationReport";
        try
        {
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            gvFileLocation.DataSource = dt;
            gvFileLocation.DataBind();
            foreach (GridViewRow row in gvFileLocation.Rows)
            {
                Label lblSr = row.FindControl("lblSr") as Label;
                lblSr.Text = Convert.ToInt16(row.RowIndex + 1).ToString();
            }
        }
        catch (Exception)
        {
            
        }
    }
    protected void btnSMS_Click(object sender, EventArgs e)
    {
        GridViewExportUtil.Export("File_Location_Report.xls", gvFileLocation);
    }
    protected void btnSelect_Click(object sender, EventArgs e)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "sp_DepartmentWiseFileLocationReport";
        cmd.Parameters.AddWithValue("@Dept", ddlDepartment.SelectedItem.Text);
        try
        {
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            gvFileLocation.DataSource = dt;
            gvFileLocation.DataBind();
            foreach (GridViewRow row in gvFileLocation.Rows)
            {
                Label lblSr = row.FindControl("lblSr") as Label;
                lblSr.Text = Convert.ToInt16(row.RowIndex + 1).ToString();
            }
        }
        catch (Exception)
        {

        }
    }
    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnInOut_Click(object sender, EventArgs e)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "sp_InOutWiseFileLocationReport";
        cmd.Parameters.AddWithValue("@Status", ddlInOut.SelectedItem.Text);
        try
        {
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            gvFileLocation.DataSource = dt;
            gvFileLocation.DataBind();
            foreach (GridViewRow row in gvFileLocation.Rows)
            {
                Label lblSr = row.FindControl("lblSr") as Label;
                lblSr.Text = Convert.ToInt16(row.RowIndex + 1).ToString();
            }
        }
        catch (Exception)
        {

        }
    }
}
