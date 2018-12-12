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

public partial class frmDetailViewofAnIndividualCase : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            BindCases();
        }
    }

    private void BindCases()
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandTimeout = 2000;
        cmd.CommandText = "select typeofprocurement, sourceoffunding, convert(varchar(50), diaryindate, 105)diaryindate, convert(varchar(50), " + 
            "tender_quotation_date, 105) tender_quotation_date, convert(varchar(50), cpcmeeting, 105) cpcmeeting, " + 
            "convert(varchar(50), finalapprovaldate, 105) finalapprovaldate, approvedamount, convert(varchar(50), supplyorderdate, 105) supplyorderdate, "+
            "vendor, convert(varchar(50), supplydate, 105) supplydate, convert(varchar(50), stockentryforwardeddate, 105) stockentryforwardeddate, "+
            "convert(varchar(50), completioncertificatedate, 105) completioncertificatedate, "+
            "convert(varchar(50), filesentforpaymentdate, 105) filesentforpaymentdate, convert(varchar(50), paymentmadedate, 105) paymentmadedate "+
            "from vw_detailviewofanindividualcase";
        try
        {
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            gvDetail.DataSource = dt;
            gvDetail.DataBind();
            decimal rowValue;
            foreach (GridViewRow row in gvDetail.Rows)
            {
                Label lblSr = (Label)row.FindControl("lblSr");
                lblSr.Text = Convert.ToString(row.RowIndex + 1);
                rowValue = Convert.ToDecimal(row.Cells[7].Text);
                row.Cells[7].Text = Convert.ToDecimal(rowValue).ToString("#,##0");
            }
        }
        catch (Exception ex)
        {
            
        }
    }

    private void BindCases(string qry)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandTimeout = 2000;
        cmd.CommandText = qry;
        try
        {
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            gvDetail.DataSource = dt;
            gvDetail.DataBind();
            foreach (GridViewRow row in gvDetail.Rows)
            {
                Label lblSr = (Label)row.FindControl("lblSr");
                lblSr.Text = Convert.ToString(row.RowIndex + 1);
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void btnDownloadExcel_Click(object sender, EventArgs e)
    {
        GridViewExportUtil.Export("DetailViewOfAnIndividualCase.xls", gvDetail);
    }
    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("frmFile.aspx");
    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        BindCases("select typeofprocurement, sourceoffunding, convert(varchar(50), diaryindate, 105)diaryindate, convert(varchar(50), tender_quotation_date, 105) tender_quotation_date, convert(varchar(50), cpcmeeting, 105) cpcmeeting, convert(varchar(50), finalapprovaldate, 105) finalapprovaldate, approvedamount, convert(varchar(50), supplyorderdate, 105) supplyorderdate, vendor, convert(varchar(50), supplydate, 105) supplydate, convert(varchar(50), stockentryforwardeddate, 105) stockentryforwardeddate, convert(varchar(50), completioncertificatedate, 105) completioncertificatedate, convert(varchar(50), filesentforpaymentdate, 105) filesentforpaymentdate, convert(varchar(50), paymentmadedate, 105) paymentmadedate from vw_detailviewofanindividualcase where " + ddlSelect.SelectedItem.Value + " like '%" + txtSearch.Text + "%'");
    }
}
