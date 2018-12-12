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

public partial class frmLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            mv.ActiveViewIndex = 0;
            lblError.Visible = false;
            txtLogin.Focus();
            Session["login"] = "";
            Session.Abandon();
            Session.Clear();
            Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
            Response.Expires = -1500;
            Response.CacheControl = "no-cache";
        }
    }
    protected void btnLogin_Click(object sender, ImageClickEventArgs e)
    {
        int result;
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandTimeout = 1000;
        cmd.Connection = con;
        cmd.Parameters.Clear();
        cmd.CommandText = "select 1 from tblLogin where login = @login and password = @password";
        cmd.Parameters.AddWithValue("@login", txtLogin.Text);
        cmd.Parameters.AddWithValue("@password", txtPassword.Text);
        try
        {
            con.Open();
            result = Convert.ToInt16(cmd.ExecuteScalar());
            con.Close();
            Session["login"] = txtLogin.Text;
            if (result == 1)
            {
                Response.Redirect("frmFile.aspx", true);
            }
            else
            {
                if (con.State == ConnectionState.Open)
                    con.Close();
                txtPassword.Text = "";
                txtPassword.Focus();
                lblError.Text = "Invalid Login/Password. Please try again";
                lblError.ForeColor = System.Drawing.Color.Red;
                lblError.Visible = true;
            }
        }
        catch (Exception ex)
        {
            if (con.State == ConnectionState.Open)
                con.Close();
            txtPassword.Text = "";
            txtPassword.Focus();
            lblError.Text = ex.Message;
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Visible = true;
        }
    }
}
