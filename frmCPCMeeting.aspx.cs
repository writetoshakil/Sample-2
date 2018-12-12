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

public partial class frmCPCMeeting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            BindCPCMeetings("select fileno, subject, enduser, type, convert(varchar(10), tenderopeningdate, 105) tenderopeningdate, convert(varchar(10), expectedDOD, 105) expectedDOD, VendorName, CooptedMembers from vw_CPCMeetingSchedule");
        }
    }

    protected void BindCPCMeetings(string qry)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = qry;
        try
        {
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            gvCPCMeeting.DataSource = dt;
            gvCPCMeeting.DataBind();
            foreach (GridViewRow row in gvCPCMeeting.Rows)
            {
                Label lblSr = (Label)row.FindControl("lblSr");
                lblSr.Text = Convert.ToString(row.RowIndex + 1);
            }
        }
        catch (Exception)
        {

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.Form["datepickerFrom"] == null || Request.Form["datepickerFrom"] == "" || Request.Form["datepickerTo"] == null || Request.Form["datepickerTo"] == "")
            lblError.Text = "Must declare some specific dates to get the records";
        else
        {
            SqlConnection con = DAL.GetConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select fileno, subject, enduser, type, convert(varchar(10), tenderopeningdate, 105) tenderopeningdate, convert(varchar(10), expectedDOD, 105) expectedDOD, VendorName, CooptedMembers from vw_CPCMeetingSchedule where tenderopeningdate between @from and @to";
            cmd.Parameters.AddWithValue("@from", Convert.ToDateTime(Request.Form["datepickerFrom"]).ToShortDateString());
            cmd.Parameters.AddWithValue("@to", Convert.ToDateTime(Request.Form["datepickerTo"]).ToShortDateString());
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
                gvCPCMeeting.DataSource = dt;
                gvCPCMeeting.DataBind();
                foreach (GridViewRow row in gvCPCMeeting.Rows)
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        GridViewExportUtil.Export("CPCMeeting.xls", gvCPCMeeting);
    }
}
