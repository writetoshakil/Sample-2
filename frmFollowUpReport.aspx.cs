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
using System.Data.Sql;
using System.Data.SqlClient;

public partial class frmFollowUpReport : System.Web.UI.Page
{
    SqlTransaction transaction;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            lblError.Text = "";
            BindDetail();
        }
    }

    protected void BindDetail()
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select * from vw_FollowUpReport where (followupdate is not null or len(followupremarks) > 0) and FileRemarks = 1 and remarkssr > 0 order by followupdate";
        //cmd.CommandText = "select * from vw_FollowUpReport where remarkssr in (select sr from tblfileremarks where isactive = 1) and followupdate is not null or len(followupremarks) > 0";
        try
        {
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            gvFollowUp.DataSource = dt;
            gvFollowUp.DataBind();
            foreach (GridViewRow row in gvFollowUp.Rows)
            {
                Label lblSr = (Label)row.FindControl("lblSr");
                lblSr.Text = Convert.ToString(row.RowIndex + 1);
            }
        }
        catch (Exception)
        {
            
        }
    }

    protected void BindDetail(string qry)
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
            gvFollowUp.DataSource = dt;
            gvFollowUp.DataBind();
            foreach (GridViewRow row in gvFollowUp.Rows)
            {
                Label lblSr = (Label)row.FindControl("lblSr");
                lblSr.Text = Convert.ToString(row.RowIndex + 1);
            }
        }
        catch (Exception)
        {

        }
    }


    protected void btnFilter_Click(object sender, EventArgs e)
    {
        string qry = "select * from vw_FollowUpReport where RemarksSr > 0 and FileRemarks = 1 and " + ddlOption1.SelectedValue + " like '%" + txtOption1.Text + "%' and " + ddlOption2.SelectedValue + " like '%" + txtOption2.Text + "%' and (followupdate is not null or len(followupremarks) > 0) order by cast(substring(fileno, 14, len(fileno)) as int) desc";
        BindDetail(qry);
    }
    protected void btnDownload_Click(object sender, EventArgs e)
    {
        GridViewExportUtil.Export("FollowUpDetail.xls", gvFollowUp);
    }
    protected void lblGoBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("frmFile.aspx");
    }
    protected void gvFollowUp_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int rowNum = Convert.ToInt16(e.CommandArgument);
        int remNo, fileType;
        string commandName = e.CommandName;
        if (commandName == "Remove" && Session["login"].ToString() == "miqureshi" || commandName == "Remove" && Session["login"].ToString() == "shahid")
        {
            fileType = DAL.GetFileType(gvFollowUp.Rows[rowNum].Cells[2].Text);
            if (fileType > 0)
            {
                SqlConnection con = DAL.GetConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                con.Open();
                transaction = con.BeginTransaction();
                //remNo = Convert.ToInt16(gvFollowUp.Rows[rowNum].Cells[2].Text);
                try
                {
                    remNo = Convert.ToInt16(gvFollowUp.Rows[rowNum].Cells[1].Text);
                    cmd.Transaction = transaction;
                    cmd.CommandText = "update tblFileRemarks set isActive = 0 where sr = @sr";
                    cmd.Parameters.AddWithValue("@sr", remNo);
                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    if (fileType == 1)
                    {
                        cmd.CommandText = "update tblsinglestageoneenveloptender set isactive = 0 where remarks = ltrim(rtrim(@remarks))";
                        cmd.Parameters.AddWithValue("@remarks", gvFollowUp.Rows[rowNum].Cells[7].Text);
                        cmd.ExecuteNonQuery();
                        gvFollowUp.Rows[rowNum].Visible = false;
                        transaction.Commit();
                        con.Close();
                        con.Dispose();
                        transaction.Dispose();
                        cmd.Dispose();
                    }
                    else if (fileType == 4)
                    {
                        cmd.CommandText = "update tblsinglestagetwoenveloptender set isactive = 0 where remarks = ltrim(rtrim(@remarks))";
                        cmd.Parameters.AddWithValue("@remarks", gvFollowUp.Rows[rowNum].Cells[7].Text);
                        cmd.ExecuteNonQuery();
                        gvFollowUp.Rows[rowNum].Visible = false;
                        transaction.Commit();
                        con.Close();
                        con.Dispose();
                        transaction.Dispose();
                        cmd.Dispose();
                    }
                    else if (fileType == 2)
                    {
                        cmd.CommandText = "update tblquotation set isactive = 0 where remarks = ltrim(rtrim(@remarks))";
                        cmd.Parameters.AddWithValue("@remarks", gvFollowUp.Rows[rowNum].Cells[7].Text);
                        cmd.ExecuteNonQuery();
                        gvFollowUp.Rows[rowNum].Visible = false;
                        transaction.Commit();
                        con.Close();
                        con.Dispose();
                        transaction.Dispose();
                        cmd.Dispose();
                    }
                    else
                    {
                        transaction.Rollback();
                        con.Close();
                        con.Dispose();
                        transaction.Dispose();
                        cmd.Dispose();
                        lblError.Text = "Error occured. Cannot remove this row.";
                        lblError.ForeColor = System.Drawing.Color.Red;
                    }
                    BindDetail();
                    lblError.Text = "Record Updated";
                    lblError.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex)
                {
                    lblError.Text = "Record could not updated";
                    lblError.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
        else
            MessageBox.Show("You does not have Privileges to delete this remarks");
    }
}
