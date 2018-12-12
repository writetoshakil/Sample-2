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

public partial class frmSummaryView : System.Web.UI.Page
{
    decimal rowValue;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            BindAllCases("select fileno, type, typeofprocurement, subject, enduser, convert(varchar(50), requisitiondate, 105)requisitiondate, convert(varchar(50), tenderopeningdate, 105) tenderopeningdate, convert(varchar(50), purchasecommitteedate, 105) purchasecommitteedate, convert(varchar(50), finalapprovaldate, 105)finalapprovaldate, approvedamount, convert(varchar(50), supplyorderdate, 105) supplyorderdate, name, convert(varchar(50), supplydate, 105) supplydate, convert(varchar(50), expectedDOD,105) expectedDOD, remarks, status from vw_TenderCases order by cast(substring(fileno, 14, len(fileno)) as int) desc");
        }
    }

    protected void BindAllCases(string qry)
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
            gvTenderCases.DataSource = dt;
            gvTenderCases.DataBind();
            foreach (GridViewRow row in gvTenderCases.Rows)
            {
                Label lblSr = (Label)row.FindControl("lblSr");
                lblSr.Text = Convert.ToString(row.RowIndex + 1);
                if (row.Cells[10].Text == "&nbsp;")
                {
                    row.Cells[10].Text = "0";
                }
                else
                {
                    rowValue = Convert.ToDecimal(row.Cells[10].Text);
                    row.Cells[10].Text = Convert.ToDecimal(rowValue).ToString("#,##0");
                }
            }
        }
        catch (Exception)
        {

        }
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        string qry = "select fileno, type, typeofprocurement, subject, enduser, convert(varchar(50), requisitiondate, 105)requisitiondate, convert(varchar(50), tenderopeningdate, 105) tenderopeningdate, convert(varchar(50), purchasecommitteedate, 105) purchasecommitteedate, convert(varchar(50), finalapprovaldate, 105)finalapprovaldate, approvedamount, convert(varchar(50), supplyorderdate, 105) supplyorderdate, name, convert(varchar(50), supplydate, 105) supplydate, convert(varchar(50), expectedDOD,105) expectedDOD, remarks, status from vw_TenderCases where " + ddlOption1.SelectedValue + " like '%" + txtOption1.Text + "%' and " + ddlOption2.SelectedValue + " like '%" + txtOption2.Text + "%' order by cast(substring(fileno, 14, len(fileno)) as int) desc";
        BindAllCases(qry);
    }
    protected void lblGoBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("frmFile.aspx");
    }
    protected void btnDownload_Click(object sender, EventArgs e)
    {
        GridViewExportUtil.Export("Summary_Cases.xls", gvTenderCases);
    }
    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
}
