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

public partial class frmDepartment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            mv.ActiveViewIndex = 0;
            lblError.ForeColor = System.Drawing.Color.Red;
            BindDepartment();
        }
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            SqlConnection con = DAL.GetConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.Parameters.Clear();
            cmd.CommandText = "insert into tblDepartment values (@dept, @emailid, @contactno)";
            cmd.Parameters.AddWithValue("@dept", txtDepartment.Text);
            cmd.Parameters.AddWithValue("@emailid", txtEmailID.Text);
            cmd.Parameters.AddWithValue("@contactno", txtContactNo.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            con.Dispose();
            txtDepartment.Text = "";
            txtEmailID.Text = "";
            txtContactNo.Text = "";
            BindDepartment();
            lblError.Text = "Record added successfully";
            lblError.ForeColor = System.Drawing.Color.Green;
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
            lblError.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void BindDepartment()
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select departmentid , description from tbldepartment";
        try
        {
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            dgDepartment.DataSource = dt;
            dgDepartment.DataBind();
            foreach (GridViewRow row in dgDepartment.Rows)
            {
                Label lblSr = (Label)row.FindControl("lblSr");
                lblSr.Text = Convert.ToString(row.RowIndex + 1);
            }
        }
        catch (Exception)
        {
            
        }
    }
}
