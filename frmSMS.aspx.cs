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

public partial class frmSMS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            BindVendors();
            lblSMS.Visible = false;
        }
    }

    protected void BindVendors()
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select name, contactperson, mobileno from tblVendor where IsActive = 1";
        try
        {
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            gvVendor.DataSource = dt;
            gvVendor.DataBind();
            foreach (GridViewRow row in gvVendor.Rows)
            {
                Label lblSr = (Label)row.FindControl("lblSr");
                lblSr.Text = Convert.ToString(row.RowIndex + 1);
            }
        }
        catch (Exception)
        {
            
        }
    }
    protected void btnSMS_Click(object sender, EventArgs e)
    {
        int counter = 0;
        string mobileNo;
        string[] SMSResult;
        zong.Service service = new zong.Service();
        foreach (GridViewRow row in gvVendor.Rows)
        {
            CheckBox cbx = (CheckBox)row.FindControl("cbxSelect");
            if (cbx.Checked == true)
            {
                mobileNo = row.Cells[3].Text;
                if (mobileNo.Length == 12)
                {
                    SMSResult = service.SendSMS("923144204940", "zongeye", mobileNo, "", txtSMS.Text, System.DateTime.Now.Hour.ToString() + System.DateTime.Now.Minute.ToString() + System.DateTime.Now.Second.ToString() + System.DateTime.Now.Millisecond.ToString());
                    if (SMSResult[0] == "1")
                    {
                        counter++;
                        
                    }
                }
            }
        }
        lblSMS.Text = counter.ToString() + " SMS(s) sent successfully.";
        lblSMS.Visible = true;
    }
    protected void cbHeader_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox cbx = gvVendor.HeaderRow.Cells[4].FindControl("cbHeader") as CheckBox;
        if (cbx.Checked == true)
        {
            foreach (GridViewRow row in gvVendor.Rows)
            {
                CheckBox cb = row.FindControl("cbSelect") as CheckBox;
                cb.Checked = true;
            }
        }
        else
        {
            foreach (GridViewRow row in gvVendor.Rows)
            {
                CheckBox cb = row.FindControl("cbSelect") as CheckBox;
                cb.Checked = false;
            }
        }
    }
}
