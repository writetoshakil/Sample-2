using System;
using System.Data;
using System.IO;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Drawing;

public partial class frmTenderCasesReport : System.Web.UI.Page
{
    decimal rowValue;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            //BindTenderCases("select subject, substring(fileno, 14, len(fileno)) fileno, status, tenderno, type, convert(varchar(10), requisitiondate, 105) requisitiondate, convert(varchar(10), boqsdate, 105) boqsdate, convert(varchar(10), purchasecommitteedate, 105) purchasecommitteedate, convert(varchar(10), purchasecommitteedate, 105) purchasecommitteedate, convert(varchar(10), finalapprovaldate, 105) finalapprovaldate, approvedamount, convert(varchar(10), supplyorderdate, 105) supplyorderdate, name, convert(varchar(10), supplydate, 105) supplydate, remarks from vw_tendercases");
            BindTenderCases("select cast(substring(fileno, 14, len(fileno)) as int) fileno, subject, enduser, event, type, typeofprocurement, " + 
                "sourceoffunding, convert(varchar(50), requisitiondate, 105) requisitiondate, convert(varchar(50), boqsdate, 105) boqsdate, " + 
                "convert(varchar(50), diaryindate, 105) diaryindate, convert(varchar(50), tenderopeningdate, 105) tenderopeningdate, tenderno, " + 
                "convert(varchar(50), purchasecommitteedate, 105) purchasecommitteedate,convert(varchar(50), finalapprovaldate, 105) finalapprovaldate," + 
                " convert(varchar(50), approvedamount, 105) approvedamount, convert(varchar(50), supplyorderdate, 105) supplyorderdate, name, " + 
                "convert(varchar(50), supplydate, 105)supplydate, convert(varchar(50), stockentryforwardeddate, 105) stockentryforwardeddate, " + 
                "convert(varchar(50), completioncertificatedate, 105) completioncertificatedate, " + 
                "convert(varchar(50), filesentforpaymentdate, 105) filesentforpaymentdate, convert(varchar(50), paymentmadedate, 105) paymentmadedate," + 
                " convert(varchar(50), expectedDOD, 105) expectedDOD, " +
                " remarks, status from vw_tendercases order by fileno desc");
        }
    }

    protected void BindTenderCases(string qry)
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
                Label lblSr = (Label) row.FindControl("lblSr");
                lblSr.Text = Convert.ToString(row.RowIndex + 1);
                if (row.Cells[15].Text == "&nbsp;")
                {
                    row.Cells[15].Text = "0";
                }
                else
                {
                    rowValue = Convert.ToDecimal(row.Cells[15].Text);
                    row.Cells[15].Text = Convert.ToDecimal(rowValue).ToString("#,##0");
                }
            }
        }
        catch (Exception)
        {
            
        }
    }


    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //Response.ClearContent();
        //Response.AddHeader("content-disposition", "attachment; filename=gvtoexcel.xls");
        //Response.ContentType = "application/excel";
        //System.IO.StringWriter sw = new System.IO.StringWriter();
        //HtmlTextWriter htw = new HtmlTextWriter(sw);
        //gvTenderCases.RenderControl(htw);
        //Response.Write(sw.ToString());
        //Response.End();

        GridViewExportUtil.Export("Tender_Cases.xls", gvTenderCases);
    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        if (ddlSelect.Text == "All")
            BindTenderCases("select cast(substring(fileno, 14, len(fileno)) as int) fileno, subject, enduser, event, type, typeofprocurement, sourceoffunding, convert(varchar(50), requisitiondate, 105) requisitiondate, convert(varchar(50), boqsdate, 105) boqsdate, convert(varchar(50), diaryindate, 105) diaryindate, convert(varchar(50), tenderopeningdate, 105) tenderopeningdate, tenderno, convert(varchar(50), purchasecommitteedate, 105) purchasecommitteedate,convert(varchar(50), finalapprovaldate, 105) finalapprovaldate, convert(varchar(50), approvedamount, 105) approvedamount, convert(varchar(50), supplyorderdate, 105) supplyorderdate, name, convert(varchar(50), supplydate, 105)supplydate, convert(varchar(50), stockentryforwardeddate, 105) stockentryforwardeddate, convert(varchar(50), completioncertificatedate, 105) completioncertificatedate, convert(varchar(50), filesentforpaymentdate, 105) filesentforpaymentdate, convert(varchar(50), paymentmadedate, 105) paymentmadedate, remarks, status from vw_tendercases order by fileno desc");
        else
        // BindTenderCases("select subject, substring(fileno, 14, len(fileno)) fileno, status, tenderno, type, convert(varchar(10), requisitiondate, 105) requisitiondate, convert(varchar(10), boqsdate, 105) boqsdate, convert(varchar(10), purchasecommitteedate, 105) purchasecommitteedate, convert(varchar(10), purchasecommitteedate, 105) purchasecommitteedate, convert(varchar(10), finalapprovaldate, 105) finalapprovaldate, approvedamount, convert(varchar(10), supplyorderdate, 105) supplyorderdate, name, convert(varchar(10), supplydate, 105) supplydate, remarks from vw_tendercases where status = '" + ddlSelect.SelectedItem.Value + "'");
            BindTenderCases("select cast(substring(fileno, 14, len(fileno)) as int) fileno, subject, enduser, event, type, typeofprocurement,  sourceoffunding, convert(varchar(50), requisitiondate, 105) requisitiondate, convert(varchar(50), boqsdate, 105) boqsdate, convert(varchar(50), diaryindate, 105) diaryindate, convert(varchar(50), tenderopeningdate, 105) tenderopeningdate, tenderno, convert(varchar(50), purchasecommitteedate, 105) purchasecommitteedate,convert(varchar(50), finalapprovaldate, 105) finalapprovaldate, convert(varchar(50), approvedamount, 105) approvedamount, convert(varchar(50), supplyorderdate, 105) supplyorderdate, name, convert(varchar(50), supplydate, 105)supplydate, convert(varchar(50), stockentryforwardeddate, 105) stockentryforwardeddate, convert(varchar(50), completioncertificatedate, 105) completioncertificatedate, convert(varchar(50), filesentforpaymentdate, 105) filesentforpaymentdate, convert(varchar(50), paymentmadedate, 105) paymentmadedate, convert(varchar(50), expectedDOD, 105) expectedDOD, remarks, status from vw_tendercases where status = '" + ddlSelect.SelectedItem.Value + "' order by fileno");
    }
    protected void lblGoBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("frmFile.aspx");
    }
}

