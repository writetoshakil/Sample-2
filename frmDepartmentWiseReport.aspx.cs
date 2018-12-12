using System;
using System.Collections;
using System.Configuration;
using System.Data;
//using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
//using System.Xml.Linq;
using System.Data.SqlClient;

public partial class frmDepartmentWiseReport : System.Web.UI.Page
{
    string[] million;
    decimal ip = 0, delivered = 0, completed = 0, pending = 0, followup = 0, total = 0;
    decimal totalApprovedAmount = 0;
    int gridViewRows = 0;
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
        cmd.CommandText = "sp_DepartmentWiseFileSummary";
        cmd.CommandType = CommandType.StoredProcedure;
        try
        {
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            gvReport.DataSource = dt;
            DataRow row1 = dt.NewRow();
            dt.Rows.Add(row1);
            dt.AcceptChanges();
            gvReport.DataBind();
            foreach (GridViewRow row in gvReport.Rows)
            {
                Label lblSr = (Label)row.FindControl("lblSr");
                lblSr.Text = Convert.ToString(row.RowIndex + 1);
                if (row.RowIndex < gvReport.Rows.Count - 1)
                {
                    row.Cells[7].Text = Convert.ToString(Convert.ToInt16(row.Cells[2].Text) + Convert.ToInt16(row.Cells[3].Text) + Convert.ToInt16(row.Cells[4].Text) + Convert.ToInt16(row.Cells[5].Text) + Convert.ToInt16(row.Cells[6].Text));
                    ip += Convert.ToDecimal(row.Cells[2].Text);
                    delivered += Convert.ToDecimal(row.Cells[3].Text);
                    completed += Convert.ToDecimal(row.Cells[4].Text);
                    pending += Convert.ToDecimal(row.Cells[5].Text);
                    followup += Convert.ToDecimal(row.Cells[6].Text);
                    total += Convert.ToDecimal(row.Cells[7].Text);
                    totalApprovedAmount += Convert.ToDecimal(row.Cells[8].Text);
                }
                if (row.Cells[8].Text != "0" && row.Cells[8].Text != "&nbsp;")
                {
                    row.Cells[8].Text = Convert.ToString(Convert.ToDecimal(row.Cells[8].Text) / 1000000);
                    if (Convert.ToDecimal(row.Cells[8].Text) < 1)
                    {
                        row.Cells[8].Text = row.Cells[8].Text.Substring(0, 4) + " M";
                    }
                    else
                    {
                        million = row.Cells[8].Text.Split('.');
                        row.Cells[8].Text = million[0] + "." + million[1].Substring(0, 3) + " M";
                    }
                }
                else
                {
                    row.Cells[8].Text = "0 M";
                }
            }
            gridViewRows = gvReport.Rows.Count;
            gvReport.Rows[gridViewRows - 1].Cells[1].Text = "Total";
            gvReport.Rows[gridViewRows - 1].Cells[2].Text = ip.ToString();
            gvReport.Rows[gridViewRows - 1].Cells[3].Text = delivered.ToString();
            gvReport.Rows[gridViewRows - 1].Cells[4].Text = completed.ToString();
            gvReport.Rows[gridViewRows - 1].Cells[5].Text = pending.ToString();
            gvReport.Rows[gridViewRows - 1].Cells[6].Text = followup.ToString();
            gvReport.Rows[gridViewRows - 1].Cells[7].Text = total.ToString();
            totalApprovedAmount = totalApprovedAmount / 1000000;
            if (totalApprovedAmount < 0)
            {
                gvReport.Rows[gridViewRows - 1].Cells[8].Text = "0 M";
            }
            else
            {
                gvReport.Rows[gridViewRows - 1].Cells[8].Text = totalApprovedAmount.ToString().Substring(0, 7) + " M";
            }
        }
        catch (Exception)
        {
            
        }
    }

    protected void btnSelect_Click(object sender, EventArgs e)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "sp_DepartmentWiseFileSummaryDateRange";
        cmd.CommandType = CommandType.StoredProcedure;
        if (Request.Form["datepickerFrom"] == "" || Request.Form["datepickerFrom"] == null)
        {
            lblErrorFrom.Text = "Please select a Date";
        }
        else if (Request.Form["datepickerTo"] == "" || Request.Form["datepickerTo"] == null)
        {
            lblErrorTo.Text = "Please select a Date";
        }
        else
        {
            cmd.Parameters.AddWithValue("@From", Convert.ToDateTime(Request.Form["datepickerFrom"]).ToShortDateString());
            cmd.Parameters.AddWithValue("@To", Convert.ToDateTime(Request.Form["datepickerTo"]).ToShortDateString());
            try
            {
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                gvReport.DataSource = dt;
                DataRow row1 = dt.NewRow();
                dt.Rows.Add(row1);
                dt.AcceptChanges();
                gvReport.DataBind();
                foreach (GridViewRow row in gvReport.Rows)
                {
                    Label lblSr = (Label)row.FindControl("lblSr");
                    lblSr.Text = Convert.ToString(row.RowIndex + 1);
                    if (row.RowIndex < gvReport.Rows.Count - 1)
                    {
                        row.Cells[7].Text = Convert.ToString(Convert.ToInt16(row.Cells[2].Text) + Convert.ToInt16(row.Cells[3].Text) + Convert.ToInt16(row.Cells[4].Text) + Convert.ToInt16(row.Cells[5].Text) + Convert.ToInt16(row.Cells[6].Text));
                        ip += Convert.ToDecimal(row.Cells[2].Text);
                        delivered += Convert.ToDecimal(row.Cells[3].Text);
                        completed += Convert.ToDecimal(row.Cells[4].Text);
                        pending += Convert.ToDecimal(row.Cells[5].Text);
                        followup += Convert.ToDecimal(row.Cells[6].Text);
                        total += Convert.ToDecimal(row.Cells[7].Text);
                        totalApprovedAmount += Convert.ToDecimal(row.Cells[8].Text);
                    }
                    if (row.Cells[8].Text != "0" && row.Cells[8].Text != "&nbsp;")
                    {
                        row.Cells[8].Text = Convert.ToString(Convert.ToDecimal(row.Cells[8].Text) / 1000000);
                        if (Convert.ToDecimal(row.Cells[8].Text) < 1)
                        {
                            row.Cells[8].Text = row.Cells[8].Text.Substring(0, 4) + " M";
                        }
                        else
                        {
                            million = row.Cells[8].Text.Split('.');
                            row.Cells[8].Text = million[0] + "." + million[1].Substring(0, 3) + " M";
                        }
                    }
                    else
                    {
                        row.Cells[8].Text = "0 M";
                    }
                }
                gridViewRows = gvReport.Rows.Count;
                gvReport.Rows[gridViewRows - 1].Cells[1].Text = "Total";
                gvReport.Rows[gridViewRows - 1].Cells[2].Text = ip.ToString();
                gvReport.Rows[gridViewRows - 1].Cells[3].Text = delivered.ToString();
                gvReport.Rows[gridViewRows - 1].Cells[4].Text = completed.ToString();
                gvReport.Rows[gridViewRows - 1].Cells[5].Text = pending.ToString();
                gvReport.Rows[gridViewRows - 1].Cells[6].Text = followup.ToString();
                gvReport.Rows[gridViewRows - 1].Cells[7].Text = total.ToString();
                totalApprovedAmount = totalApprovedAmount / 1000000;
                if (totalApprovedAmount < 0)
                {
                    gvReport.Rows[gridViewRows - 1].Cells[8].Text = "0 M";
                }
                else
                {
                    gvReport.Rows[gridViewRows - 1].Cells[8].Text = totalApprovedAmount.ToString().Substring(0, 7) + " M";
                }
            }
            catch (Exception)
            {

            }
        }
    }

    protected void btnExport_Click(object sender, EventArgs e)
    {
        GridViewExportUtil.Export("Department_Wise_Cases_Report.xls", gvReport);
    }
    
}
