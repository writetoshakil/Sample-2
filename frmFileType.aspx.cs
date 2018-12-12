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

public partial class frmFileType : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            mv.ActiveViewIndex = 0;
            lblError.ForeColor = System.Drawing.Color.Red;
            BindFileType();
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
            cmd.CommandText = "insert into tblType values (@type)";
            cmd.Parameters.AddWithValue("@type", txtFileType.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            con.Dispose();
            txtFileType.Text = "";
            BindFileType();
            lblError.Text = "Record added successfully";
            lblError.ForeColor = System.Drawing.Color.Green;
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
            lblError.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void BindFileType()
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select TypeID, description from tblType";
        try
        {
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            gvFileType.DataSource = dt;
            gvFileType.DataBind();
            foreach (GridViewRow row in gvFileType.Rows)
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
