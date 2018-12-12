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
using System.Globalization;
using System.IO;

public partial class frmFile : System.Web.UI.Page
{
    decimal rowValue;
    private string subject;
    public string Subject
    {
        get { return subject; }
        set { subject = value; }
    }

    private string fileNo;

    public string FileNo
    {
        get { return fileNo; }
        set { fileNo = value; }
    }
	
	
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["myvar"] = 10;
        Session["tenderuploadeddate"] = "";
        Session["purchasecommitteedate"] = "";
        Session["comparativestatementdate"] = "";
        Session["finalapprovaldate"] = "";
        Session["supplyorderdate"] = "";
        Session["supplydate"] = "";
        Session["stockentryforwardeddate"] = "";
        Session["completioncertificatedate"] = "";
        Session["filesentforpaymentdate"] = "";
        Session["paymentmadedate"] = "";
        Session["technicalopeningdate"] = "";
        Session["technicalfinaliseddate"] = "";
        Session["finalcialopeningdate"] = "";
        Session["quotationinviteddate"] = "";
        Session["quotationopeningdate"] = "";
        Session["aDOD"] = "";
        Session["bDOD"] = "";
        Session["cDOD"] = "";

        if (!this.IsPostBack)
        {
            mv.ActiveViewIndex = 0;
            NewFileNo();
            lblError.ForeColor = System.Drawing.Color.Red;
            BindFiles();
            BindDepartment();
            BindFileType();
            BindVendors();
            //BindLocations();
            BindProcurementTypes();
        }
    }

    private void BindProcurementTypes()
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select procurementtype from tblprocurementtype";
        try
        {
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            cbxTypeofProcurement.DataSource = dt;
            cbxTypeofProcurement.DataTextField = "procurementtype";
            cbxTypeofProcurement.DataValueField = "procurementtype";
            cbxTypeofProcurement.DataBind();

            cbxEditTypeofProcurement.DataSource = dt;
            cbxEditTypeofProcurement.DataTextField = "procurementtype";
            cbxEditTypeofProcurement.DataValueField = "procurementtype";
            cbxEditTypeofProcurement.DataBind();
        }
        catch (Exception)
        {
            
        }
    }

    protected void NewFileNo()
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        // cmd.CommandText = "select top 1 substring(fileno, 14, 3) lastno from tblfile order by fileno desc";
        cmd.CommandText = "select top 1 cast(substring(fileno, 14, len(fileno)) as int) fileno from tblfile order by 1 desc";
        try
        {
            int fileno;
            con.Open();
            fileno = Convert.ToInt16(cmd.ExecuteScalar());
            fileno++;
            DAL.FileNo = fileno.ToString();
            con.Close();
            con.Dispose();
            cmd.Dispose();
            txtFileNo.Text = "CIIT-LHR/Pur-" + fileno.ToString();
        }
        catch (Exception)
        {
            
        }
    }

    private bool CreateDirectory(string directory)
    {
        bool flag;
        try
        {
            //DirectoryInfo dInfo = new DirectoryInfo(@"\\172.16.17.31\edms\Purchase Section\" + directory);
            DirectoryInfo dInfo = new DirectoryInfo(Server.MapPath(@"PurchaseData\" + directory));
            if (dInfo.Exists)
            {

            }
            else
                dInfo.Create();
            flag = true;
        }
        catch (Exception)
        {
            flag = false;
        }
        return flag;
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        string str = txtFileNo.Text;
        string[] strArr = str.Split('-', '/');
        if (CreateDirectory(strArr[3]))
        {
            int departmentID = Convert.ToInt16(ddlDepartment.SelectedValue);
            Subject = txtSubject.Text;
            decimal contactNo;
            string emailID;
            string RefNo = txtFileNo.Text.Substring(13, txtFileNo.Text.Length - 13);
            string[] SMSResult;
            try
            {
                SqlConnection con = DAL.GetConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.Parameters.Clear();
                cmd.CommandText = "insert into tblFile values (@FileNo, @Subject, @DepartmentID, @Event, @TypeofProcurement, @SourceofFunding, @TypeID, @ReqDate, @BoqDate, @BOQAttached, @diaryindate, 'IP')";
                cmd.Parameters.AddWithValue("@FileNo", txtFileNo.Text);
                cmd.Parameters.AddWithValue("@Subject", txtSubject.Text);
                cmd.Parameters.AddWithValue("@DepartmentID", ddlDepartment.SelectedValue);
                cmd.Parameters.AddWithValue("@Event", txtEvent.Text);
                cmd.Parameters.AddWithValue("@TypeofProcurement", cbxTypeofProcurement.Text);
                cmd.Parameters.AddWithValue("@SourceofFunding", txtSourceofFunding.Text);
                cmd.Parameters.AddWithValue("@TypeID", ddlFileType.SelectedValue);
                if (Request.Form["datepickerFrom"] == "" || Request.Form["datepickerFrom"] == null)
                {
                    cmd.Parameters.AddWithValue("@ReqDate", DBNull.Value);
                }
                else
                    cmd.Parameters.AddWithValue("@ReqDate", Convert.ToDateTime(Request.Form["datepickerFrom"]).ToShortDateString());
                if (Request.Form["datepickerTo"] == "" || Request.Form["datepickerTo"] == null)
                    cmd.Parameters.AddWithValue("BoqDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("BoqDate", Convert.ToDateTime(Request.Form["datepickerTo"]).ToShortDateString());
                cmd.Parameters.AddWithValue("@BOQAttached", rblBOQ.SelectedValue);
                if (Request.Form["diaryInDate"] == "" || Request.Form["diaryInDate"] == null)
                    cmd.Parameters.AddWithValue("@diaryindate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@diaryindate", Convert.ToDateTime(Request.Form["diaryInDate"]).ToShortDateString());
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                cmd.Dispose();
                con.Dispose();
                BindFiles();
                txtSubject.Text = "";
                lblError.Text = "Record added successfully. ";
                lblError.ForeColor = System.Drawing.Color.Green;
                NewFileNo();

                try
                {
                    DAL.RecordLog(Session["login"].ToString(), System.DateTime.Now, "User created file " + txtFileNo.Text);
                    emailID = DAL.GetDeptEmailID(departmentID);
                    if (emailID != "" && cbxSendEmail.Checked == true)
                    {
                        System.Net.NetworkCredential mailAuthentication = new System.Net.NetworkCredential("procurement@ciitlahore.edu.pk", "PMS@comsats");
                        //String MsgSubject = "'Procurement File Management System'";
                        String MsgSubject = Subject + " (Ref ID: " + RefNo + ")";
                        String MsgBody = "Dear Sir/Madam \r\r This office has received your request on " + System.DateTime.Now.Day.ToString() + "-" + System.DateTime.Now.Month.ToString() + "-" + System.DateTime.Now.Year.ToString() + " for procurement of " + Subject + " (Ref ID " + RefNo + "). The same shall be processed as per rules and regulations. Please use above reference number for tracking progress on the case with this office in future.";
                        System.Net.Mail.MailMessage MyMailMessage = new System.Net.Mail.MailMessage("procurement@ciitlahore.edu.pk", emailID, MsgSubject, MsgBody);
                        MyMailMessage.IsBodyHtml = false;
                        System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
                        mailClient.EnableSsl = true;
                        mailClient.UseDefaultCredentials = false;
                        mailClient.Credentials = mailAuthentication;
                        mailClient.Send(MyMailMessage);
                        lblEmail.Text = "Email send to respective department";
                        lblEmail.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblEmail.Text = "No email ID exist of this Department OR You are not sending the Email to User by your choice.";
                        lblEmail.ForeColor = System.Drawing.Color.Red;
                    }
                    /*
                    contactNo = DAL.GetContactNo(departmentID);
                    if (contactNo != 0)
                    {
                        zong.Service service = new zong.Service();
                        SMSResult = service.SendSMS("923144204940", "zongeys8", contactNo.ToString(), "CIIT-ACC", "Purchase file generated for your request", System.DateTime.Now.Hour.ToString() + System.DateTime.Now.Minute.ToString() + System.DateTime.Now.Second.ToString() + System.DateTime.Now.Millisecond.ToString());
                        if (SMSResult[0] == "0")
                        {
                            SMSResult = service.SendSMS("923144204940", "zongeys8", contactNo.ToString(), "", "Purchase file generated for your request", System.DateTime.Now.Hour.ToString() + System.DateTime.Now.Minute.ToString() + System.DateTime.Now.Second.ToString() + System.DateTime.Now.Millisecond.ToString());
                        }
                        if (SMSResult[0] == "1")
                        {
                            lblMessage.Text = "Message sent successfully to respective department";
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                        }
                    }
                    else
                    {
                        lblMessage.Text = "Either contact no does not exists or message could not be sent successfully";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    */
                }
                catch (Exception)
                {

                }
                NewFileNo();
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("PRIMARY KEY"))
                    lblError.Text = "Duplicate file no cannot be entered";
                else
                    lblError.Text = ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }
        else
        {
            lblError.Text = "System is unable to create this directory where you will upload documents later.";
            lblError.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void BindDepartment()
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select departmentid, description from tblDepartment order by description";
        try
        {
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            ddlDepartment.DataSource = dt;
            ddlDepartment.DataTextField = "description";
            ddlDepartment.DataValueField = "departmentid";
            ddlDepartment.DataBind();
            ddlDepartment.Items.Insert(0, "--Select--");
            

            ddlEditDepartment.DataSource = dt;
            ddlEditDepartment.DataTextField = "description";
            ddlEditDepartment.DataValueField = "departmentid";
            ddlEditDepartment.DataBind();
            ddlEditDepartment.Items.Insert(0, "--Select--");

            ddlLocation.DataSource = dt;
            ddlLocation.DataTextField = "description";
            ddlLocation.DataValueField = "departmentid";
            ddlLocation.DataBind();
            ddlLocation.Items.Insert(0, "--Select--");

            ddlbLocation.DataSource = dt;
            ddlbLocation.DataTextField = "description";
            ddlbLocation.DataValueField = "departmentid";
            ddlbLocation.DataBind();
            ddlbLocation.Items.Insert(0, "--Select--");

            ddlcLocation.DataSource = dt;
            ddlcLocation.DataTextField = "description";
            ddlcLocation.DataValueField = "departmentid";
            ddlcLocation.DataBind();
            ddlcLocation.Items.Insert(0, "--Select--");

            ddldLocation.DataSource = dt;
            ddldLocation.DataTextField = "description";
            ddldLocation.DataValueField = "departmentid";
            ddldLocation.DataBind();
            ddldLocation.Items.Insert(0, "--Select--");
        }
        catch (Exception)
        {
           
        }
    }

    protected void BindFileType()
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select typeid, description from tblType order by description";
        try
        {
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            ddlFileType.DataSource = dt;
            ddlFileType.DataTextField = "description";
            ddlFileType.DataValueField = "typeid";
            ddlFileType.DataBind();

            ddlEditFileType.DataSource = dt;
            ddlEditFileType.DataTextField = "description";
            ddlEditFileType.DataValueField = "typeid";
            ddlEditFileType.DataBind();
        }
        catch (Exception)
        {

        }
    }

    protected void BindLocations()
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select locationid, description from tblLocation order by 1";
        try
        {
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            ddlLocation.DataSource = dt;
            ddlbLocation.DataSource = dt;
            ddlcLocation.DataSource = dt;

            ddlLocation.DataTextField = "description";
            ddlLocation.DataValueField = "locationid";
            ddlLocation.DataBind();

            ddlbLocation.DataTextField = "description";
            ddlbLocation.DataValueField = "locationid";
            ddlbLocation.DataBind();

            ddlcLocation.DataTextField = "description";
            ddlcLocation.DataValueField = "locationid";
            ddlcLocation.DataBind();

            ddldLocation.DataTextField = "description";
            ddldLocation.DataValueField = "locationid";
            ddldLocation.DataBind();
        }
        catch (Exception)
        {

        }
    }

    protected void BindFiles()
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        //cmd.CommandText = "select cast(substring(f.fileno, 14, len(f.fileno)) as int) fileno, f.subject, f.status, d.description department, t.description type, convert(varchar(10), f.requisitiondate, 105) requisitiondate, convert(varchar(10), f.boqsdate, 105) boqsdate, (select top 1 remarks from tblfileremarks where fileno = f.fileno order by sr desc) remarks  from tblfile f, tbltype t, tbldepartment d where f.type = t.typeid and f.departmentid = d.departmentid order by fileno desc";
        cmd.CommandText = "select cast(substring(fileno, 14, len(fileno)) as int) fileno, subject, status, enduser, event, filetype, convert(varchar(10), requisitiondate, 105) requisitiondate, tenderno, convert(varchar(10), purchasecommitteedate, 105) purchasecommitteedate, approvedamount, convert(varchar(50), supplyorderdate, 105)supplyorderdate, convert(varchar(50), supplydate, 105)supplydate, remarks from vw_MainPageView order by fileno desc";
        try
        {
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            gvFile.DataSource = dt;
            gvFile.DataBind();
            
            foreach (GridViewRow row in gvFile.Rows)
            {
                Label lbl = (Label)row.FindControl("lblSr");
                lbl.Text = Convert.ToString(row.RowIndex + 1);
                if (row.Cells[4].Text.ToUpper().Contains("TENDER"))
                    row.Cells[4].Text = "Tender";
                DropDownList ddl = (DropDownList)row.FindControl("ddlStatus");
                if (ddl.SelectedItem.Value.ToUpper() == "IP")
                    row.BackColor = System.Drawing.Color.White;
                if (ddl.SelectedItem.Value.ToUpper() == "COMPLETED")
                    row.BackColor = System.Drawing.Color.LightGreen;
                if (ddl.SelectedItem.Value.ToUpper() == "PENDING")
                    row.BackColor = System.Drawing.Color.Orange;
                if (ddl.SelectedItem.Value.ToUpper() == "FOLLOWUP")
                    row.BackColor = System.Drawing.Color.Red;
                if (ddl.SelectedItem.Value.ToUpper() == "DELIVERED")
                    row.BackColor = System.Drawing.Color.LightBlue;
                if (row.Cells[8].Text == "01-01-1900")
                    row.Cells[8].Text = "";
                if (row.Cells[10].Text == "01-01-1900")
                    row.Cells[10].Text = "";
                if (row.Cells[11].Text == "01-01-1900")
                    row.Cells[11].Text = "";
                rowValue = Convert.ToDecimal(row.Cells[9].Text);
                row.Cells[9].Text = Convert.ToDecimal(rowValue).ToString("#,##0");
            }
        }
        catch (Exception)
        {

        }
    }

    private DataSet GetData(string query)
    {
        SqlCommand cmd = new SqlCommand(query);
        using (SqlConnection con = DAL.GetConnection())
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                using (DataSet ds = new DataSet())
                {
                    sda.Fill(ds);
                    return ds;
                }
            }
        }
    }

    protected void BindVendors()
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select vendorid, name from tblVendor order by name";
        try
        {
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);

            ddlaVendor.DataSource = dt;
            ddlaVendor.DataTextField = "name";
            ddlaVendor.DataValueField = "vendorid";
            ddlaVendor.DataBind();

            ddlbVendor.DataSource = dt;
            ddlbVendor.DataTextField = "name";
            ddlbVendor.DataValueField = "vendorid";
            ddlbVendor.DataBind();

            ddlcVendor.DataSource = dt;
            ddlcVendor.DataTextField = "name";
            ddlcVendor.DataValueField = "vendorid";
            ddlcVendor.DataBind();

            ddldVendor.DataSource = dt;
            ddldVendor.DataTextField = "name";
            ddldVendor.DataValueField = "vendorid";
            ddldVendor.DataBind();
        }
        catch (Exception)
        {

        }
    }

    protected void gvFile_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            int rowIndex = Convert.ToInt16(e.CommandArgument);
            string commandName = e.CommandName;
            //if (commandName == "Detail" && gvFile.Rows[rowIndex].Cells[4].Text.ToUpper() == "TENDER (SINGLE STAGE ONE ENVELOP)")
            if (commandName == "Detail" && FileType("CIIT-LHR/Pur-" + gvFile.Rows[rowIndex].Cells[1].Text).ToUpper() == "TENDER (SINGLE STAGE ONE ENVELOP)")
            {
                txtaFileNoDetail.Text = gvFile.Rows[rowIndex].Cells[1].Text;
                //BindFileDetail("CIIT-LHR/Pur-" + gvFile.Rows[rowIndex].Cells[1].Text);
                try
                {
                    txtaSubject.Text = gvFile.Rows[rowIndex].Cells[2].Text;
                    mv.ActiveViewIndex = 1;
                    NewFileNo();
                    gvSingleStageTenderDetailView.DataSource = DAL.GetDetailViewOfAnIndividualCase("CIIT-LHR/Pur-" + txtaFileNoDetail.Text);
                    gvSingleStageTenderDetailView.DataBind();
                    foreach (GridViewRow row in gvSingleStageTenderDetailView.Rows)
                    {
                        Label lblSr = (Label)row.FindControl("lblSr");
                        lblSr.Text = Convert.ToString(row.RowIndex + 1);
                        if (row.Cells[7].Text == "&nbsp;")
                        {
                            row.Cells[7].Text = "0";
                        }
                        else
                        {
                            rowValue = Convert.ToDecimal(row.Cells[7].Text);
                            row.Cells[7].Text = Convert.ToDecimal(rowValue).ToString("#,##0");
                        }
                    }
                }
                catch (Exception)
                {
                    
                }
                
            }

            //if (commandName == "Detail" && gvFile.Rows[rowIndex].Cells[4].Text.ToUpper() == "TENDER (SINGLE STAGE TWO ENVELOP)")
            if (commandName == "Detail" && FileType("CIIT-LHR/Pur-" + gvFile.Rows[rowIndex].Cells[1].Text).ToUpper() == "TENDER (SINGLE STAGE TWO ENVELOP)")
            {
                txtbFileNoDetail.Text = gvFile.Rows[rowIndex].Cells[1].Text;
                //bBindFileDetail("CIIT-LHR/Pur-" + gvFile.Rows[rowIndex].Cells[1].Text);
                try
                {
                    txtbSubject.Text = gvFile.Rows[rowIndex].Cells[2].Text;
                    mv.ActiveViewIndex = 3;
                    NewFileNo();
                    gvTwoStageTenderDetailView.DataSource = DAL.GetDetailViewOfAnIndividualCase("CIIT-LHR/Pur-" + txtbFileNoDetail.Text);
                    gvTwoStageTenderDetailView.DataBind();
                    foreach (GridViewRow row in gvTwoStageTenderDetailView.Rows)
                    {
                        Label lblSr = (Label)row.FindControl("lblSr");
                        lblSr.Text = Convert.ToString(row.RowIndex + 1);
                        if (row.Cells[7].Text == "&nbsp;")
                        {
                            row.Cells[7].Text = "0";
                        }
                        else
                        {
                            rowValue = Convert.ToDecimal(row.Cells[7].Text);
                            row.Cells[7].Text = Convert.ToDecimal(rowValue).ToString("#,##0");
                        }
                    }
                }
                catch (Exception)
                {
                    
                }
                
            }

            //if (commandName == "Detail" && gvFile.Rows[rowIndex].Cells[4].Text.ToUpper() == "QUOTATION")
            if (commandName == "Detail" && FileType("CIIT-LHR/Pur-" + gvFile.Rows[rowIndex].Cells[1].Text).ToUpper() == "QUOTATION")
            {
                txtcFileNoDetail.Text = gvFile.Rows[rowIndex].Cells[1].Text;
                //cBindFileDetail("CIIT-LHR/Pur-" + gvFile.Rows[rowIndex].Cells[1].Text);
                try
                {
                    txtcSubject.Text = gvFile.Rows[rowIndex].Cells[2].Text;
                    mv.ActiveViewIndex = 5;
                    NewFileNo();
                    gvQuotationDetailView.DataSource = DAL.GetDetailViewOfAnIndividualCase("CIIT-LHR/Pur-" + txtcFileNoDetail.Text);
                    gvQuotationDetailView.DataBind();
                    foreach (GridViewRow row in gvQuotationDetailView.Rows)
                    {
                        Label lblSr = (Label)row.FindControl("lblSr");
                        lblSr.Text = Convert.ToString(row.RowIndex + 1);
                        if (row.Cells[7].Text == "&nbsp;")
                        {
                            row.Cells[7].Text = "0";
                        }
                        else
                        {
                            rowValue = Convert.ToDecimal(row.Cells[7].Text);
                            row.Cells[7].Text = Convert.ToDecimal(rowValue).ToString("#,##0");
                        }
                    }
                }
                catch (Exception)
                {
                    
                }
                
            }

            if (commandName == "Detail" && FileType("CIIT-LHR/Pur-" + gvFile.Rows[rowIndex].Cells[1].Text).ToUpper() == "PETTY CASH")
            {
                try
                {
                    txtdFileNoDetail.Text = gvFile.Rows[rowIndex].Cells[1].Text;
                    txtPettyCashSubject.Text = gvFile.Rows[rowIndex].Cells[2].Text;
                    //dBindFileDetail("CIIT-LHR/Pur-" + gvFile.Rows[rowIndex].Cells[1].Text);
                    mv.ActiveViewIndex = 7;
                    NewFileNo();
                    gvPettyCashDetailView.DataSource = DAL.GetDetailViewOfAnIndividualCase("CIIT-LHR/Pur-" + txtdFileNoDetail.Text);
                    gvPettyCashDetailView.DataBind();
                    foreach (GridViewRow row in gvPettyCashDetailView.Rows)
                    {
                        Label lblSr = (Label)row.FindControl("lblSr");
                        lblSr.Text = Convert.ToString(row.RowIndex + 1);
                        if (row.Cells[7].Text == "&nbsp;")
                        {
                            row.Cells[7].Text = "0";
                        }
                        else
                        {
                            rowValue = Convert.ToDecimal(row.Cells[7].Text);
                            row.Cells[7].Text = Convert.ToDecimal(rowValue).ToString("#,##0");
                        }
                    }
                }
                catch (Exception)
                {
                    
                }
                
            }

            //if (commandName == "Remarks" && gvFile.Rows[rowIndex].Cells[4].Text.ToUpper() == "TENDER (SINGLE STAGE ONE ENVELOP)")
            if (commandName == "Remarks" && FileType("CIIT-LHR/Pur-" + gvFile.Rows[rowIndex].Cells[1].Text).ToUpper() == "TENDER (SINGLE STAGE ONE ENVELOP)")
            {
                txtFileNoRemarks.Text = gvFile.Rows[rowIndex].Cells[1].Text;
                BindFileRemarks("CIIT-LHR/Pur-" + gvFile.Rows[rowIndex].Cells[1].Text);
                mv.ActiveViewIndex = 2;
                NewFileNo();
            }

            //if (commandName == "Remarks" && gvFile.Rows[rowIndex].Cells[4].Text.ToUpper() == "TENDER (SINGLE STAGE TWO ENVELOP)")
            if (commandName == "Remarks" && FileType("CIIT-LHR/Pur-" + gvFile.Rows[rowIndex].Cells[1].Text).ToUpper() == "TENDER (SINGLE STAGE TWO ENVELOP)")
            {
                txtbFileNoRemarks.Text = gvFile.Rows[rowIndex].Cells[1].Text;
                bBindFileRemarks("CIIT-LHR/Pur-" + gvFile.Rows[rowIndex].Cells[1].Text);
                mv.ActiveViewIndex = 4;
                NewFileNo();
            }

            //if (commandName == "Remarks" && gvFile.Rows[rowIndex].Cells[4].Text.ToUpper() == "QUOTATION")
            if (commandName == "Remarks" && FileType("CIIT-LHR/Pur-" + gvFile.Rows[rowIndex].Cells[1].Text).ToUpper() == "QUOTATION")
            {
                txtcFileNoRemarks.Text = gvFile.Rows[rowIndex].Cells[1].Text;
                cBindFileRemarks("CIIT-LHR/Pur-" + gvFile.Rows[rowIndex].Cells[1].Text);
                mv.ActiveViewIndex = 6;
                NewFileNo();
            }

            if (commandName == "Remarks" && FileType("CIIT-LHR/Pur-" + gvFile.Rows[rowIndex].Cells[1].Text).ToUpper() == "PETTY CASH")
            {
                txtdFileNoRemarks.Text = gvFile.Rows[rowIndex].Cells[1].Text;
                dBindFileRemarks("CIIT-LHR/Pur-" + gvFile.Rows[rowIndex].Cells[1].Text);
                mv.ActiveViewIndex = 8;
                NewFileNo();
            }

            if (commandName == "Update")
            {
                DropDownList ddlCurrent = (DropDownList)gvFile.Rows[rowIndex].FindControl("ddlStatus");
                string CurrentStatus = ddlCurrent.SelectedItem.Value;
                SqlConnection con = DAL.GetConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "update tblFile set status = @status where fileno = @fileno";
                cmd.Parameters.AddWithValue("@fileno", "CIIT-LHR/Pur-" + gvFile.Rows[rowIndex].Cells[1].Text);
                cmd.Parameters.AddWithValue("@status", ddlCurrent.SelectedItem.Value);
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    con.Dispose();
                    cmd.Dispose();
                    BindFiles();
                    lblFileStatus.Text = "File status updated successfully";
                    lblFileStatus.ForeColor = System.Drawing.Color.Green;
                    //Response.Redirect("frmError.aspx?id=1");
                }
                catch (Exception)
                {
                    if (con.State == ConnectionState.Open)
                        con.Close();
                    cmd.Dispose();
                    lblFileStatus.Text = "Error occured ...";
                    lblFileStatus.ForeColor = System.Drawing.Color.Red;
                    //Response.Redirect("frmError.aspx?id=0");
                }
            }
            if (commandName == "ERMS")
            {
                Response.Redirect("frmERMSFiles.aspx?BoxfileID=" + gvFile.Rows[rowIndex].Cells[1].Text + "&Subject=" + gvFile.Rows[rowIndex].Cells[2].Text + "&EndUser=" + gvFile.Rows[rowIndex].Cells[3].Text + "&Event=" + gvFile.Rows[rowIndex].Cells[4].Text + "&Type=" + gvFile.Rows[rowIndex].Cells[5].Text + "&RequestApprovalDate=" + gvFile.Rows[rowIndex].Cells[6].Text);
            }
            if (commandName == "Edit")
            {
                txtEditFileNo.Text = txtEditFileNo.Text + gvFile.Rows[rowIndex].Cells[1].Text;
                txtEditSubject.Text = gvFile.Rows[rowIndex].Cells[2].Text;
                ddlEditDepartment.SelectedItem.Text = gvFile.Rows[rowIndex].Cells[3].Text;
                txtEditEvent.Text = gvFile.Rows[rowIndex].Cells[4].Text;
                ddlEditFileType.SelectedItem.Text = gvFile.Rows[rowIndex].Cells[5].Text;
                EditrequisitionDate.Value = gvFile.Rows[rowIndex].Cells[6].Text;
                //txtRequestApprovalDate.Text = gvFile.Rows[rowIndex].Cells[6].Text;
                mv.ActiveViewIndex = 9;
            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
            lblError.ForeColor = System.Drawing.Color.Red;
        }
    }

    private string FileType(string fileno)
    {
        string type = "";
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select distinct filetype from vw_CompleteDetail where fileno = @fileno";
        cmd.Parameters.AddWithValue("@fileno", fileno);
        try
        {
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            type = dr["filetype"].ToString();
            dr.Close();
            con.Close();
            con.Dispose();
            cmd.Dispose();
        }
        catch (Exception)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
                con.Dispose();
                cmd.Dispose();
                type = "";
            }
        }
        return type;
    }

    protected void BindFileDetail(string FileID)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        //cmd.CommandText = "select tenderingdate, purchasecommitteedate, finalapprovaldate, approvedamount, supplyorderdate, vendorname, supplydate from vw_filedetail where isactive = 1 and fileno = @fileno";
        cmd.CommandText = "select convert(varchar(10), operationaldate, 105) operationaldate, convert(varchar(10), v.purchasecommitteedate, 105) purchasecommitteedate, convert(varchar(10), v.finalapprovaldate, 105) finalapprovaldate, v.approvedamount, convert(varchar(10), v.supplyorderdate, 105) supplyorderdate, a.name, convert(varchar(10), v.supplydate, 105)supplydate from vw_singlestageoneenveloptender v, tblVendor a where fileno = @fileno and v.vendorid = a.vendorid";
        cmd.Parameters.AddWithValue("@fileno", FileID);
        try
        {
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            gvFileDetail.DataSource = dt;
            gvFileDetail.DataBind();
            foreach (GridViewRow row in gvFileDetail.Rows)
            {
                Label lblSr = (Label)row.FindControl("lblSr");
                lblSr.Text = Convert.ToString(row.RowIndex + 1);
                rowValue = Convert.ToDecimal(row.Cells[4].Text);
                row.Cells[4].Text = Convert.ToDecimal(rowValue).ToString("#,##0");
            }
        }
        catch (Exception)
        {
            
        }
    }

    protected void bBindFileDetail(string FileID)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select convert(varchar(10), operationaldate, 105) operationaldate, convert(varchar(10), v.tenderuploadeddate, 105) tenderuploadeddate, convert(varchar(10), v.technicalopeningdate, 105) technicalopeningdate, convert(varchar(10), v.technicalfinaliseddate, 105) technicalfinaliseddate, convert(varchar(10), v.financialopeningdate, 105) financialopeningdate, convert(varchar(10), v.purchasecommitteedate, 105) purchasecommitteedate , convert(varchar(10), v.finalapproveddate, 105) finalapproveddate, v.approvedamount,convert(varchar(10), v.supplyorderdate, 105) supplyorderdate, a.name, convert(varchar(10), v.supplydate, 105) supplydate from vw_SingleStageTwoEnvelopTender v, tblvendor a where v.vendorid = a.vendorid and tenderfileno = @fileno and isactive = 1";
        //cmd.CommandText = "select convert(varchar(10), v.tenderopeningdate, 105) tenderopeningdate, convert(varchar(10), v.purchasecommitteedate, 105) purchasecommitteedate, convert(varchar(10), v.finalapprovaldate, 105) finalapprovaldate, v.approvedamount, convert(varchar(10), v.supplyorderdate, 105) supplyorderdate, a.name, convert(varchar(10), v.supplydate, 105)supplydate from vw_singlestageoneenveloptender v, tblVendor a where fileno = @fileno and v.vendorid = a.vendorid";
        cmd.Parameters.AddWithValue("@fileno", FileID);
        try
        {
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            gvbFileDetail.DataSource = dt;
            gvbFileDetail.DataBind();
            foreach (GridViewRow row in gvbFileDetail.Rows)
            {
                Label lblSr = (Label)row.FindControl("lblSr");
                lblSr.Text = Convert.ToString(row.RowIndex + 1);
                rowValue = Convert.ToDecimal(row.Cells[8].Text);
                row.Cells[8].Text = Convert.ToDecimal(rowValue).ToString("#,##0");
            }
        }
        catch (Exception)
        {

        }
    }

    protected void cBindFileDetail(string FileID)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        //cmd.CommandText = "select quotationinviteddate, quotationopeningdate, purchasecommitteedate, comparativestatementdate, finalapprovaldate, approvedamount, supplyorderdate, vendorname from vw_Quotation where fileno = @fileno and isactive = 1";
        cmd.CommandText = "select convert(varchar(10), operationaldate, 105) operationaldate, convert(varchar(10), quotationinviteddate, 105) quotationinviteddate, convert(varchar(10), purchasecommitteedate, 105) purchasecommitteedate, convert(varchar(10), comparativestatementdate, 105) comparativestatementdate, convert(varchar(10), finalapprovaldate, 105) finalapprovaldate, approvedamount, convert(varchar(10), supplyorderdate, 105) supplyorderdate, vendorname from vw_Quotation where fileno = @fileno and isactive = 1";

        cmd.Parameters.AddWithValue("@fileno", FileID);
        try
        {
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            gvcQuotation.DataSource = dt;
            gvcQuotation.DataBind();
            foreach (GridViewRow row in gvcQuotation.Rows)
            {
                Label lblSr = (Label)row.FindControl("lblSr");
                lblSr.Text = Convert.ToString(row.RowIndex + 1);
                rowValue = Convert.ToDecimal(row.Cells[6].Text);
                row.Cells[6].Text = Convert.ToDecimal(rowValue).ToString("#,##0");
            }
        }
        catch (Exception)
        {

        }
    }

    protected void dBindFileDetail(string FileID)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        //cmd.CommandText = "select quotationinviteddate, quotationopeningdate, purchasecommitteedate, comparativestatementdate, finalapprovaldate, approvedamount, supplyorderdate, vendorname from vw_Quotation where fileno = @fileno and isactive = 1";
        cmd.CommandText = "select convert(varchar(10), operationaldate, 105) operationaldate, convert(varchar(10), supplydate, 105) supplydate, convert(varchar(10), stockentryforwardeddate, 105) stockentryforwardeddate, convert(varchar(10), completioncertificatedate, 105) completioncertificatedate, convert(varchar(10), filesentforpaymentdate, 105) filesentforpaymentdate from vw_Pettycash where fileno = @fileno and isactive = 1";
        cmd.Parameters.AddWithValue("@fileno", FileID);
        try
        {
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            gvdPettyCash.DataSource = dt;
            gvdPettyCash.DataBind();
            foreach (GridViewRow row in gvdPettyCash.Rows)
            {
                Label lblSr = (Label)row.FindControl("lblSr");
                lblSr.Text = Convert.ToString(row.RowIndex + 1);
            }
        }
        catch (Exception)
        {

        }
    }

    protected void BindFileRemarks(string FileID)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        //cmd.CommandText = "select distinct remarksdate, remarks, location, recordby from vw_SingleStageOneEnvelopTenderRemarks where fileno = @FileNo order by remarksdate desc";
        cmd.CommandText = "select remarksdate, remarks, (select description from tbllocation where locationid = r.locationid) location, recordby from tblfileremarks r where FileNo = @FileNo";
        cmd.Parameters.AddWithValue("@FileNo", FileID);
        try
        {
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            gvFileRemarks.DataSource = dt;
            gvFileRemarks.DataBind();
            foreach (GridViewRow row in gvFileRemarks.Rows)
            {
                Label lblSr = (Label)row.FindControl("lblSr");
                lblSr.Text = Convert.ToString(row.RowIndex + 1);
            }
        }
        catch (Exception)
        {

        }
    }

    protected void bBindFileRemarks(string FileID)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        //cmd.CommandText = "select distinct remarksdate, remarks, location, recordby from vw_SingleStageTwoEnvelopTenderRemarks where fileno = @FileNo order by remarksdate desc";
        cmd.CommandText = "select remarksdate, remarks, (select description from tbllocation where locationid = r.locationid) location, recordby from tblfileremarks r where FileNo = @FileNo";
        cmd.Parameters.AddWithValue("@FileNo", FileID);
        try
        {
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            gvbFileRemarks.DataSource = dt;
            gvbFileRemarks.DataBind();
            foreach (GridViewRow row in gvbFileRemarks.Rows)
            {
                Label lblSr = (Label)row.FindControl("lblSr");
                lblSr.Text = Convert.ToString(row.RowIndex + 1);
            }
        }
        catch (Exception)
        {

        }
    }

    protected void cBindFileRemarks(string FileID)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select distinct remarksdate, remarks, location, recordby from vw_quotationremarks where fileno = @FileNo order by remarksdate desc";
        cmd.Parameters.AddWithValue("@FileNo", FileID);
        try
        {
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            gvcFileRemarks.DataSource = dt;
            gvcFileRemarks.DataBind();
            foreach (GridViewRow row in gvcFileRemarks.Rows)
            {
                Label lblSr = (Label)row.FindControl("lblSr");
                lblSr.Text = Convert.ToString(row.RowIndex + 1);
            }
        }
        catch (Exception)
        {

        }
    }

    protected void dBindFileRemarks(string FileID)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        //cmd.CommandText = "select remarksdate, remarks, location, recordby from vw_pettycashremarks where fileno = @FileNo order by remarksdate desc";
        cmd.CommandText = "select remarksdate, remarks, (select description from tbllocation where locationid = r.locationid) location, recordby from tblfileremarks r where FileNo = @FileNo";
        cmd.Parameters.AddWithValue("@FileNo", FileID);
        try
        {
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            gvdFileRemarks.DataSource = dt;
            gvdFileRemarks.DataBind();
            foreach (GridViewRow row in gvdFileRemarks.Rows)
            {
                Label lblSr = (Label)row.FindControl("lblSr");
                lblSr.Text = Convert.ToString(row.RowIndex + 1);
            }
        }
        catch (Exception)
        {

        }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
            {
                SqlConnection con = DAL.GetConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.Parameters.Clear();
                //cmd.CommandText = "insert into tblSingleStageOneEnvelopTender values (@FileNo, @TenderUploadedDate, @TenderOpeningDate, @PurchaseCommitteeDate, @ComparativeStatementDate, @FinalApprovalDate, @ApprovedAmount, @SupplyOrderDate, @VendorID, @SupplyDate, @StockEntryForwardedDate, @CompletionCertificateDate, @FileSentForPaymentDate, @PaymentMadeDate, 1, getdate())";
                cmd.CommandText = "insert into tblSingleStageOneEnvelopTender values (@FileNo, @TenderUploadedDate, @TenderNo, @PurchaseCommitteeDate, @ComparativeStatementDate, @FinalApprovalDate, @ApprovedAmount, @SupplyOrderDate, @VendorID, @SupplyDate, @StockEntryForwardedDate, @CompletionCertificateDate, @WarrantyDate, @FileSentForPaymentDate, @PaymentMadeDate, 1, getdate(), @FollowUpDate, @Remarks, @eDOD)";

                cmd.Parameters.AddWithValue("@FileNo", "CIIT-LHR/Pur-" + txtaFileNoDetail.Text);
                if (txtTenderNoSingle.Text.Length == 0)
                    cmd.Parameters.AddWithValue("@TenderNo", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@TenderNo", txtTenderNoSingle.Text);
                if (Request.Form["txtaTenderUploadedDate"] == "" || Request.Form["txtaTenderUploadedDate"] == null)
                    cmd.Parameters.AddWithValue("@TenderUploadedDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@TenderUploadedDate", Convert.ToDateTime(Request.Form["txtaTenderUploadedDate"]).ToShortDateString());
                //if (Request.Form["txtaTenderingDate"] == "" || Request.Form["txtaTenderingDate"] == null)
                //    cmd.Parameters.AddWithValue("@TenderOpeningDate", DBNull.Value);
                //else
                //    cmd.Parameters.AddWithValue("@TenderOpeningDate", Convert.ToDateTime(Request.Form["txtaTenderingDate"]).ToShortDateString());
                if (Request.Form["txtaPurchaseCommitteeDate"] == "" || Request.Form["txtaPurchaseCommitteeDate"] == null)
                    cmd.Parameters.AddWithValue("@PurchaseCommitteeDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@PurchaseCommitteeDate", Convert.ToDateTime(Request.Form["txtaPurchaseCommitteeDate"]).ToShortDateString());
                if (Request.Form["txtaComparativeStatementDate"] == "" || Request.Form["txtaComparativeStatementDate"] == null)
                    cmd.Parameters.AddWithValue("@ComparativeStatementDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@ComparativeStatementDate", Convert.ToDateTime(Request.Form["txtaComparativeStatementDate"]).ToShortDateString());
                if (Request.Form["txtaFinalApprovalDate"] == "" || Request.Form["txtaFinalApprovalDate"] == null)
                    cmd.Parameters.AddWithValue("@FinalApprovalDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@FinalApprovalDate", Convert.ToDateTime(Request.Form["txtaFinalApprovalDate"]).ToShortDateString());
                if (txtaApprovedAmount.Text == "")
                    cmd.Parameters.AddWithValue("@ApprovedAmount", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@ApprovedAmount", Convert.ToDecimal(txtaApprovedAmount.Text));
                if (Request.Form["txtaSupplyOrderDate"] == "" || Request.Form["txtaSupplyOrderDate"] == null)
                    cmd.Parameters.AddWithValue("@SupplyOrderDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@SupplyOrderDate", Convert.ToDateTime(Request.Form["txtaSupplyOrderDate"]).ToShortDateString());
                cmd.Parameters.AddWithValue("@VendorID", Convert.ToInt16(ddlaVendor.SelectedValue));
                if (Request.Form["txtaSupplyDate"].ToString() == "")
                {
                    cmd.Parameters.AddWithValue("@SupplyDate", DBNull.Value);
                }
                else
                    cmd.Parameters.AddWithValue("@SupplyDate", Convert.ToDateTime(Request.Form["txtaSupplyDate"]).ToShortDateString());
                if (Request.Form["txtaStockEntryForwardedDate"] == "" || Request.Form["txtaStockEntryForwardedDate"] == null)
                {
                    cmd.Parameters.AddWithValue("@StockEntryForwardedDate", DBNull.Value);
                }
                else
                    cmd.Parameters.AddWithValue("@StockEntryForwardedDate", Convert.ToDateTime(Request.Form["txtaStockEntryForwardedDate"]).ToShortDateString());
                if (Request.Form["txtaCompletionCertificateDate"] == "" || Request.Form["txtaCompletionCertificateDate"] == null)
                {
                    cmd.Parameters.AddWithValue("@CompletionCertificateDate", DBNull.Value);
                    cmd.Parameters.AddWithValue("@WarrantyDate", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@CompletionCertificateDate", Convert.ToDateTime(Request.Form["txtaCompletionCertificateDate"]).ToShortDateString());
                    if (txtWarrantyMonthsSingleStageOneEnvelopTender.Enabled == true && Convert.ToInt16(txtWarrantyMonthsSingleStageOneEnvelopTender.Text) >= 1)
                    {
                        cmd.Parameters.AddWithValue("@WarrantyDate", Convert.ToDateTime(Request.Form["txtaCompletionCertificateDate"]).AddMonths(Convert.ToInt16(txtWarrantyMonthsSingleStageOneEnvelopTender.Text)).ToShortDateString());
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@WarrantyDate", DBNull.Value);
                    }
                }
                if (Request.Form["txtaFileSentForPaymentDate"] == "" || Request.Form["txtaFileSentForPaymentDate"] == null)
                {
                    cmd.Parameters.AddWithValue("@FileSentForPaymentDate", DBNull.Value);
                }
                else
                    cmd.Parameters.AddWithValue("@FileSentForPaymentDate", Convert.ToDateTime(Request.Form["txtaFileSentForPaymentDate"]).ToShortDateString());
                if (Request.Form["txtaPaymentMadeDate"] == "" || Request.Form["txtaPaymentMadeDate"] == null)
                    cmd.Parameters.AddWithValue("@PaymentMadeDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@PaymentMadeDate", Convert.ToDateTime(Request.Form["txtaPaymentMadeDate"]).ToShortDateString());
                if (Request.Form["txtaFollowUpDate"] == "" || Request.Form["txtaFollowUpDate"] == null)
                    cmd.Parameters.AddWithValue("@FollowUpDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@FollowUpDate", Convert.ToString(Request.Form["txtaFollowUpDate"]).ToString());
                cmd.Parameters.AddWithValue("@Remarks", txtaFollowUpRemarks.Text);
                if (Request.Form["txtaDOD"] == "" || Request.Form["txtaDOD"] == null)
                    cmd.Parameters.AddWithValue("@eDOD", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@eDOD", Convert.ToString(Request.Form["txtaDOD"]).ToString());
                con.Open();
                cmd.ExecuteNonQuery();
                //BindFileDetail("CIIT-LHR/Pur-" + txtaFileNoDetail.Text);
                
                con.Close();
                cmd.Dispose();
                con.Dispose();
                try
                {
                    DataTable dt = DAL.GetDetailViewOfAnIndividualCase("CIIT-Lhr/Pur-" + txtaFileNoDetail.Text);
                    gvSingleStageTenderDetailView.DataSource = dt;
                    gvSingleStageTenderDetailView.DataBind();
                    foreach (GridViewRow row in gvSingleStageTenderDetailView.Rows)
                    {
                        Label lblSr = (Label)row.FindControl("lblSr");
                        lblSr.Text = Convert.ToString(row.RowIndex + 1);
                    }
                }
                catch (Exception)
                {
                    
                }
                lblFileDetail.Text = "Record added successfully";
                lblFileDetail.ForeColor = System.Drawing.Color.Green;
                try
                {
                    DAL.RecordLog(Session["login"].ToString(), System.DateTime.Now, "User entered detail of file no " + txtaFileNoDetail.Text);
                }
                catch (Exception)
                {
                    
                }
            }
            catch (Exception ex)
            {
                lblFileDetail.Text = ex.Message;
                lblFileDetail.ForeColor = System.Drawing.Color.Red;
            }
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "insert into tblFileRemarks values (@FileNo, @RemarksDate, @Remarks, @LocationID, @RecordBy, 1)";
        cmd.Parameters.AddWithValue("@FileNo", "CIIT-LHR/Pur-" + txtFileNoRemarks.Text);
        cmd.Parameters.AddWithValue("@RemarksDate", System.DateTime.Now);
        cmd.Parameters.AddWithValue("@Remarks", txtRemarks.Text);
        cmd.Parameters.AddWithValue("@LocationID", Convert.ToInt16(ddlLocation.SelectedValue));
        cmd.Parameters.AddWithValue("@RecordBy", Session["login"].ToString());
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            lblErrorRemarks.Text = "Record added successfully";
            lblErrorRemarks.ForeColor = System.Drawing.Color.Green;
            BindFileRemarks("CIIT-LHR/Pur-" + txtFileNoRemarks.Text);
            con.Dispose();
            cmd.Dispose();
            try
            {
                DAL.RecordLog(Session["login"].ToString(), System.DateTime.Now, "User entered remarks of file no " + txtFileNoRemarks.Text);
            }
            catch (Exception)
            {

            }
        }
        catch (Exception)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
                con.Dispose();
                cmd.Dispose();
            }
        }
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        //if (txtbFileNoDetail.Text == "" || Request.Form["txtbTenderUploadedDate"] == "" || Request.Form["txtbTenderUploadedDate"] == null || Request.Form["txtbTechnicalOpeningDate"] == "" || Request.Form["txtbTechnicalOpeningDate"] == null || Request.Form["txtbTechnicalFinalizedDate"] == "" || Request.Form["txtbTechnicalFinalizedDate"] == null || Request.Form["txtbFinancialOpeningDate"] == "" || Request.Form["txtbFinancialOpeningDate"] == null || Request.Form["txtbPurchaseCommitteeDate"] == "" || Request.Form["txtbPurchaseCommitteeDate"] == null || Request.Form["txtbComparativeStatementDate"] == "" || Request.Form["txtbComparativeStatementDate"] == null || Request.Form["txtbFinalApprovalDate"] == "" || Request.Form["txtbFinalApprovalDate"] == null || Request.Form["txtbSupplyOrderDate"] == "" || Request.Form["txtbSupplyOrderDate"] == null)
        //{
        //    lblbFileDetail.Text = "Required fiel(s) must be provided";
        //    lblbFileDetail.ForeColor = System.Drawing.Color.Red;
        //}
        //else
        //{
            try
            {
                SqlConnection con = DAL.GetConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.Parameters.Clear();
                cmd.CommandText = "insert into tblSingleStageTwoEnvelopTender values (@FileNo, @TenderUploadedDate, @TenderNo, @TechnicalOpeningDate, @TechnicalFinalisedDate, @FinalcialOpeningDate, @PurchaseCommitteeDate, @ComparativeStatementDate, @FinalApprovalDate, @ApprovedAmount, @SupplyOrderDate, @VendorID, @SupplyDate, @StockEntryForwardedDate, @CompletionCertificateDate, @WarrantyDate, @FileSentForPaymentDate, @PaymentMadeDate, 1, getdate(), @FollowUpDate, @Remarks, @eDOD)";
                cmd.Parameters.AddWithValue("@FileNo", "CIIT-LHR/Pur-" + txtbFileNoDetail.Text);
                if (txtTenderNoDouble.Text.Length == 0)
                    cmd.Parameters.AddWithValue("@TenderNo", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@TenderNo", txtTenderNoDouble.Text);
                if (Request.Form["txtbTenderUploadedDate"] == "" || Request.Form["txtbTenderUploadedDate"] == null)
                    cmd.Parameters.AddWithValue("@TenderUploadedDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@TenderUploadedDate", Convert.ToDateTime(Request.Form["txtbTenderUploadedDate"]).ToShortDateString());

                if (Request.Form["txtbTechnicalOpeningDate"] == "" || Request.Form["txtbTechnicalOpeningDate"] == null)
                    cmd.Parameters.AddWithValue("@TechnicalOpeningDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@TechnicalOpeningDate", Convert.ToDateTime(Request.Form["txtbTechnicalOpeningDate"]).ToShortDateString());
                if (Request.Form["txtbTechnicalFinalizedDate"] == "" || Request.Form["txtbTechnicalFinalizedDate"] == null)
                    cmd.Parameters.AddWithValue("@TechnicalFinalisedDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@TechnicalFinalisedDate", Convert.ToDateTime(Request.Form["txtbTechnicalFinalizedDate"]).ToShortDateString());
                if (Request.Form["txtbFinancialOpeningDate"] == "" || Request.Form["txtbFinancialOpeningDate"] == null)
                    cmd.Parameters.AddWithValue("@FinalcialOpeningDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@FinalcialOpeningDate", Convert.ToDateTime(Request.Form["txtbFinancialOpeningDate"]).ToShortDateString());
                if (Request.Form["txtbPurchaseCommitteeDate"] == "" || Request.Form["txtbPurchaseCommitteeDate"] == null)
                    cmd.Parameters.AddWithValue("@PurchaseCommitteeDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@PurchaseCommitteeDate", Convert.ToDateTime(Request.Form["txtbPurchaseCommitteeDate"]).ToShortDateString());
                if (Request.Form["txtbComparativeStatementDate"] == "" || Request.Form["txtbComparativeStatementDate"] == null)
                    cmd.Parameters.AddWithValue("@ComparativeStatementDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@ComparativeStatementDate", Convert.ToDateTime(Request.Form["txtbComparativeStatementDate"]).ToShortDateString());
                if (Request.Form["txtbFinalApprovalDate"] == "" || Request.Form["txtbFinalApprovalDate"] == null)
                    cmd.Parameters.AddWithValue("@FinalApprovalDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@FinalApprovalDate", Convert.ToDateTime(Request.Form["txtbFinalApprovalDate"]).ToShortDateString());
                if (txtbApprovedAmount.Text == "")
                    cmd.Parameters.AddWithValue("@ApprovedAmount", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@ApprovedAmount", Convert.ToDecimal(txtbApprovedAmount.Text));
                if (Request.Form["txtbSupplyOrderDate"] == "" || Request.Form["txtbSupplyOrderDate"] == null)
                    cmd.Parameters.AddWithValue("@SupplyOrderDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@SupplyOrderDate", Convert.ToDateTime(Request.Form["txtbSupplyOrderDate"]).ToShortDateString());
                cmd.Parameters.AddWithValue("@VendorID", Convert.ToInt16(ddlbVendor.SelectedValue));
                if (Request.Form["txtbSupplyDate"].ToString() == "")
                {
                    cmd.Parameters.AddWithValue("@SupplyDate", DBNull.Value);
                }
                else
                    cmd.Parameters.AddWithValue("@SupplyDate", Convert.ToDateTime(Request.Form["txtbSupplyDate"]).ToShortDateString());
                if (Request.Form["txtbStockEntryForwardedDate"].ToString() == "")
                    cmd.Parameters.AddWithValue("@StockEntryForwardedDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@StockEntryForwardedDate", Convert.ToDateTime(Request.Form["txtbStockEntryForwardedDate"]).ToShortDateString());
                if (Request.Form["txtbCompletionCertificateDate"] == "" || Request.Form["txtbCompletionCertificateDate"] == null)
                {
                    cmd.Parameters.AddWithValue("@CompletionCertificateDate", DBNull.Value);
                    cmd.Parameters.AddWithValue("@WarrantyDate", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@CompletionCertificateDate", Convert.ToDateTime(Request.Form["txtbCompletionCertificateDate"]).ToShortDateString());
                    if (txtWarrantyMonthsSingleStageTwoEnvelopTender.Enabled == true && Convert.ToInt16(txtWarrantyMonthsSingleStageTwoEnvelopTender.Text) >= 1)
                    {
                        cmd.Parameters.AddWithValue("@WarrantyDate", Convert.ToDateTime(Request.Form["txtbCompletionCertificateDate"]).AddMonths(Convert.ToInt16(txtWarrantyMonthsSingleStageTwoEnvelopTender.Text)).ToShortDateString());
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@WarrantyDate", DBNull.Value);
                    }
                } if (Request.Form["txtbFileSentForPaymentDate"].ToString() == "")
                {
                    cmd.Parameters.AddWithValue("@FileSentForPaymentDate", DBNull.Value);
                }
                else
                    cmd.Parameters.AddWithValue("@FileSentForPaymentDate", Convert.ToDateTime(Request.Form["txtbFileSentForPaymentDate"]).ToShortDateString());
                if (Request.Form["txtbPaymentMadeDate"].ToString() == "")
                    cmd.Parameters.AddWithValue("@PaymentMadeDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@PaymentMadeDate", Convert.ToDateTime(Request.Form["txtbPaymentMadeDate"]).ToShortDateString());
                if (Request.Form["txtbFollowUpDate"] == "" || Request.Form["txtbFollowUpDate"] == null)
                    cmd.Parameters.AddWithValue("@FollowUpDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@FollowUpDate", Convert.ToDateTime(Request.Form["txtbFollowUpDate"]).ToShortDateString());
                cmd.Parameters.AddWithValue("@Remarks", txtbFollowUpRemarks.Text);
                if (Request.Form["txtbDOD"] == "" || Request.Form["txtbDOD"] == null)
                    cmd.Parameters.AddWithValue("@eDOD", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@eDOD", Convert.ToString(Request.Form["txtbDOD"]).ToString());
                con.Open();
                cmd.ExecuteNonQuery();
                //bBindFileDetail("CIIT-LHR/Pur-" + txtbFileNoDetail.Text);
                con.Close();
                cmd.Dispose();
                con.Dispose();
                try
                {
                    DataTable dt = DAL.GetDetailViewOfAnIndividualCase("CIIT-Lhr/Pur-" + txtbFileNoDetail.Text);
                    gvTwoStageTenderDetailView.DataSource = dt;
                    gvTwoStageTenderDetailView.DataBind();
                    foreach (GridViewRow row in gvTwoStageTenderDetailView.Rows)
                    {
                        Label lblSr = (Label)row.FindControl("lblSr");
                        lblSr.Text = Convert.ToString(row.RowIndex + 1);
                    }
                }
                catch (Exception)
                {

                }
                lblFileDetail.Text = "Record added successfully";
                lblFileDetail.ForeColor = System.Drawing.Color.Green;
                try
                {
                    DAL.RecordLog(Session["login"].ToString(), System.DateTime.Now, "User entered detail of file no " + txtbFileNoDetail.Text);
                }
                catch (Exception)
                {

                }
            }
            catch (Exception ex)
            {
                lblbFileDetail.Text = ex.Message;
                lblbFileDetail.ForeColor = System.Drawing.Color.Red;
            }
        //}
    }
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "insert into tblFileRemarks values (@FileNo, @RemarksDate, @Remarks, @LocationID, @RecordBy, 1)";
        cmd.Parameters.AddWithValue("FileNo", "CIIT-LHR/Pur-" + txtbFileNoRemarks.Text);
        cmd.Parameters.AddWithValue("@RemarksDate", System.DateTime.Now);
        cmd.Parameters.AddWithValue("@Remarks", txtbRemarks.Text);
        cmd.Parameters.AddWithValue("@LocationID", Convert.ToInt16(ddlbLocation.SelectedValue));
        cmd.Parameters.AddWithValue("@RecordBy", Session["login"].ToString());
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            lblbErrorRemarks.Text = "Record added successfully";
            lblbErrorRemarks.ForeColor = System.Drawing.Color.Green;
            bBindFileRemarks("CIIT-LHR/Pur-" + txtbFileNoRemarks.Text);
            con.Dispose();
            cmd.Dispose();
            try
            {
                DAL.RecordLog(Session["login"].ToString(), System.DateTime.Now, "User entererd remarks of file no " + txtbFileNoRemarks.Text);
            }
            catch (Exception)
            {

            }
        }
        catch (Exception)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
                con.Dispose();
                cmd.Dispose();
            }
        }
    }
    protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
    {
        //if (txtcFileNoDetail.Text == "" || Request.Form["txtcQuotationInvitedDate"] == "" || Request.Form["txtcQuotationInvitedDate"] == null || Request.Form["txtcQuotationOpeningDate"] == "" || Request.Form["txtcQuotationOpeningDate"] == null || Request.Form["txtcPurchaseCommitteeDate"] == "" || Request.Form["txtcPurchaseCommitteeDate"] == null || Request.Form["txtcComparativeStatementDate"] == "" || Request.Form["txtcComparativeStatementDate"] == null || Request.Form["txtcFinalApprovalDate"] == "" || Request.Form["txtcFinalApprovalDate"] == null || Request.Form["txtcSupplyOrderDate"] == "" || Request.Form["txtcSupplyOrderDate"] == null)
        //{
        //    lblbFileDetail.Text = "Required fiel(s) must be provided";
        //    lblbFileDetail.ForeColor = System.Drawing.Color.Red;
        //}
        //else
        //{
            try
            {
                SqlConnection con = DAL.GetConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.Parameters.Clear();
                cmd.CommandText = "insert into tblQuotation values (@FileNo, @QuotatioInvitedDate, @PurchaseCommitteeDate, @ComparativeStatementDate, @FinalApprovalDate, @ApprovedAmount, @SupplyOrderDate, @VendorID, @SupplyDate, @StockEntryForwardedDate, @CompletionCertificateDate, @WarrantyDate, @FileSentForPaymentDate, @PaymentMadeDate, 1, getdate(), @FollowUpDate, @Remarks, @eDOD)";
                cmd.Parameters.AddWithValue("@FileNo", "CIIT-LHR/Pur-" + txtcFileNoDetail.Text);
                if (Request.Form["txtcQuotationInvitedDate"] == "" || Request.Form["txtcQuotationInvitedDate"] == null)
                    cmd.Parameters.AddWithValue("@QuotatioInvitedDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@QuotatioInvitedDate", Convert.ToDateTime(Request.Form["txtcQuotationInvitedDate"]).ToShortDateString());
                if (Request.Form["txtcPurchaseCommitteeDate"] == "" || Request.Form["txtcPurchaseCommitteeDate"] == null)
                    cmd.Parameters.AddWithValue("@PurchaseCommitteeDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@PurchaseCommitteeDate", Convert.ToDateTime(Request.Form["txtcPurchaseCommitteeDate"]).ToShortDateString());
                if (Request.Form["txtcComparativeStatementDate"] == "" || Request.Form["txtcComparativeStatementDate"] == null)
                    cmd.Parameters.AddWithValue("@ComparativeStatementDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@ComparativeStatementDate", Convert.ToDateTime(Request.Form["txtcComparativeStatementDate"]).ToShortDateString());
                if (Request.Form["txtcFinalApprovalDate"] == "" || Request.Form["txtcFinalApprovalDate"] == null)
                    cmd.Parameters.AddWithValue("@FinalApprovalDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@FinalApprovalDate", Convert.ToDateTime(Request.Form["txtcFinalApprovalDate"]).ToShortDateString());
                if (txtcApprovedAmount.Text == "")
                    cmd.Parameters.AddWithValue("@ApprovedAmount", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@ApprovedAmount", Convert.ToDecimal(txtcApprovedAmount.Text));
                if (Request.Form["txtcSupplyOrderDate"] == "" || Request.Form["txtcSupplyOrderDate"] == null)
                    cmd.Parameters.AddWithValue("@SupplyOrderDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@SupplyOrderDate", Convert.ToDateTime(Request.Form["txtcSupplyOrderDate"]).ToShortDateString());
                cmd.Parameters.AddWithValue("@VendorID", Convert.ToInt16(ddlcVendor.SelectedValue));
                if (Request.Form["txtcSupplyDate"].ToString() == "")
                {
                    cmd.Parameters.AddWithValue("@SupplyDate", DBNull.Value);
                }
                else
                    cmd.Parameters.AddWithValue("@SupplyDate", Convert.ToDateTime(Request.Form["txtcSupplyDate"]).ToShortDateString());
                if (Request.Form["txtcStockEntryForwardedDate"].ToString() == "")
                    cmd.Parameters.AddWithValue("@StockEntryForwardedDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@StockEntryForwardedDate", Convert.ToDateTime(Request.Form["txtcStockEntryForwardedDate"]).ToShortDateString());
                if (Request.Form["txtcCompletionCertificateDate"] == "" || Request.Form["txtcCompletionCertificateDate"] == null)
                {
                    cmd.Parameters.AddWithValue("@CompletionCertificateDate", DBNull.Value);
                    cmd.Parameters.AddWithValue("@WarrantyDate", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@CompletionCertificateDate", Convert.ToDateTime(Request.Form["txtcCompletionCertificateDate"]).ToShortDateString());
                    if (txtWarrantyMonthsQuotationTender.Enabled == true && Convert.ToInt16(txtWarrantyMonthsQuotationTender.Text) >= 1)
                    {
                        cmd.Parameters.AddWithValue("@WarrantyDate", Convert.ToDateTime(Request.Form["txtcCompletionCertificateDate"]).AddMonths(Convert.ToInt16(txtWarrantyMonthsQuotationTender.Text)).ToShortDateString());
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@WarrantyDate", DBNull.Value);
                    }
                }
                if (Request.Form["txtcFileSentForPaymentDate"].ToString() == "" || Request.Form["txtcFileSentForPaymentDate"] == null)
                {
                    cmd.Parameters.AddWithValue("@FileSentForPaymentDate", DBNull.Value);
                }
                else
                    cmd.Parameters.AddWithValue("@FileSentForPaymentDate", Convert.ToDateTime(Request.Form["txtcFileSentForPaymentDate"]).ToShortDateString());
                if (Request.Form["txtcPaymentMadeDate"].ToString() == "")
                    cmd.Parameters.AddWithValue("@PaymentMadeDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@PaymentMadeDate", Convert.ToDateTime(Request.Form["txtcPaymentMadeDate"]).ToShortDateString());
                if (Request.Form["txtcFollowUpDate"] == "" || Request.Form["txtcFollowUpDate"] == null)
                    cmd.Parameters.AddWithValue("@FollowUpDate", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@FollowUpDate", Convert.ToDateTime(Request.Form["txtcFollowUpDate"]).ToShortDateString());
                cmd.Parameters.AddWithValue("@Remarks", txtcFollowUpRemarks.Text);
                if (Request.Form["txtcDOD"] == "" || Request.Form["txtcDOD"] == null)
                    cmd.Parameters.AddWithValue("@eDOD", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@eDOD", Convert.ToString(Request.Form["txtcDOD"]).ToString());
                con.Open();
                cmd.ExecuteNonQuery();
                //cBindFileDetail("CIIT-LHR/Pur-" + txtcFileNoDetail.Text);
                con.Close();
                cmd.Dispose();
                con.Dispose();
                try
                {
                    DataTable dt = DAL.GetDetailViewOfAnIndividualCase("CIIT-Lhr/Pur-" + txtcFileNoDetail.Text);
                    gvQuotationDetailView.DataSource = dt;
                    gvQuotationDetailView.DataBind();
                    foreach (GridViewRow row in gvQuotationDetailView.Rows)
                    {
                        Label lblSr = (Label)row.FindControl("lblSr");
                        lblSr.Text = Convert.ToString(row.RowIndex + 1);
                    }
                }
                catch (Exception)
                {

                }
                lblcFileDetail.Text = "Record added successfully";
                lblcFileDetail.ForeColor = System.Drawing.Color.Green;
                try
                {
                    DAL.RecordLog(Session["login"].ToString(), System.DateTime.Now, "User entered detail of file no " + txtcFileNoDetail.Text);
                }
                catch (Exception)
                {

                }
            }
            catch (Exception ex)
            {
                lblcFileDetail.Text = ex.Message;
                lblcFileDetail.ForeColor = System.Drawing.Color.Red;
            }
        //}
    }
    protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "insert into tblFileRemarks values (@FileNo, @RemarksDate, @Remarks, @LocationID, @RecordBy, 1)";
        cmd.Parameters.AddWithValue("FileNo", "CIIT-LHR/Pur-" + txtcFileNoRemarks.Text);
        cmd.Parameters.AddWithValue("@RemarksDate", System.DateTime.Now);
        cmd.Parameters.AddWithValue("@Remarks", txtcRemarks.Text);
        cmd.Parameters.AddWithValue("@LocationID", Convert.ToInt16(ddlcLocation.SelectedValue));
        cmd.Parameters.AddWithValue("@RecordBy", Session["login"].ToString());
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            lblcErrorRemarks.Text = "Record added successfully";
            lblcErrorRemarks.ForeColor = System.Drawing.Color.Green;
            cBindFileRemarks("CIIT-LHR/Pur-" + txtcFileNoRemarks.Text);
            con.Dispose();
            cmd.Dispose();
            try
            {
                DAL.RecordLog(Session["login"].ToString(), System.DateTime.Now, "User entered remarks of file no " + txtcFileNoRemarks.Text);
            }
            catch (Exception)
            {

            }
        }
        catch (Exception)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
                con.Dispose();
                cmd.Dispose();
            }
        }
    }
    protected void vwSingleStageOneEnvelopTender_Activate(object sender, EventArgs e)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select convert(varchar(10), max(tenderuploadeddate), 105) tenderuploadeddate, convert(varchar(10), max(purchasecommitteedate), 105) purchasecommitteedate, convert(varchar(10), max(comparativestatementdate), 105) comparativestatementdate, convert(varchar(10), max(finalapprovaldate), 105) finalapprovaldate, convert(varchar(10), max(supplyorderdate), 105) supplyorderdate, convert(varchar(10), max(supplydate), 105) supplydate, convert(varchar(10), max(stockentryforwardeddate), 105) stockentryforwardeddate, convert(varchar(10), max(completioncertificatedate), 105) completioncertificatedate,  convert(varchar(10), max(filesentforpaymentdate), 105) filesentforpaymentdate, convert(varchar(10), max(paymentmadedate), 105) paymentmadedate from tblsinglestageoneenveloptender where fileno = @fileno";
        cmd.Parameters.AddWithValue("@fileno", txtaFileNoDetail.Text);
        try
        {
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            Session["tenderuploadeddate"] = dr["tenderuploadeddate"].ToString();
            Session["purchasecommitteedate"] = dr["purchasedcommitteedate"].ToString();
            Session["comparativestatementdate"] = dr["comparativestatementdate"].ToString();
            Session["finalapprovaldate"] = dr["finalapprovaldate"].ToString();
            Session["supplyorderdate"] = dr["supplyorderdate"].ToString();
            Session["supplydate"] = dr["supplydate"].ToString();
            Session["stockentryforwardeddate"] = dr["stockentryforwardeddate"].ToString();
            Session["completioncertificatedate"] = dr["completioncertificatedate"].ToString();
            Session["filesentforpaymentdate"] = dr["filesentforpaymentdate"].ToString();
            Session["paymentmadedate"] = dr["paymentmadedate"].ToString();
            dr.Close();
            con.Close();
            con.Dispose();
            cmd.Dispose();
        }
        catch (Exception)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
                con.Dispose();
                cmd.Dispose();
            }
        }
    }
    protected void vwSingleStageTwoEnvelopTender_Activate(object sender, EventArgs e)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select convert(varchar(10), max(technicalopeningdate), 105) technicalopeningdate, convert(varchar(10), max(technicalfinaliseddate), 105) technicalfinaliseddate, convert(varchar(10), max(financialopeningdate), 105) financialopeningdate, convert(varchar(10), max(purchasecommitteedate), 105) purchasedcommitteedate, convert(varchar(10), max(comparativestatementdate), 105) comparativestatementdate, convert(varchar(10), max(finalapproveddate), 105) finalapproveddate, convert(varchar(10), max(supplyorderdate), 105) supplyorderdate, convert(varchar(10), max(supplydate), 105) supplydate, convert(varchar(10), max(stockentryforwardeddate), 105) stockentryforwardeddate, convert(varchar(10), max(completioncertificatedate), 105) completioncertificatedate,  convert(varchar(10), max(filesentforpaymentdate), 105) filesentforpaymentdate, convert(varchar(10), max(paymentmadedate), 105) paymentmadedate from tblsinglestagetwoenveloptender where fileno = @fileno";
        cmd.Parameters.AddWithValue("@fileno", txtbFileNoDetail.Text);
        try
        {
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            Session["technicalopeningdate"] = dr["technicalopeningdate"].ToString();
            Session["technicalfinaliseddate"] = dr["technicalfinaliseddate"].ToString();
            Session["financialopeningdate"] = dr["financialopeningdate"].ToString();
            Session["purchasecommitteedate"] = dr["purchasedcommitteedate"].ToString();
            Session["comparativestatementdate"] = dr["comparativestatementdate"].ToString();
            Session["finalapprovaldate"] = dr["finalapproveddate"].ToString();
            Session["supplyorderdate"] = dr["supplyorderdate"].ToString();
            Session["supplydate"] = dr["supplydate"].ToString();
            Session["stockentryforwardeddate"] = dr["stockentryforwardeddate"].ToString();
            Session["completioncertificatedate"] = dr["completioncertificatedate"].ToString();
            Session["filesentforpaymentdate"] = dr["filesentforpaymentdate"].ToString();
            Session["paymentmadedate"] = dr["paymentmadedate"].ToString();
            dr.Close();
            con.Close();
            con.Dispose();
            cmd.Dispose();
        }
        catch (Exception)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
                con.Dispose();
                cmd.Dispose();
            }
        }
    }
    protected void vwQuotation_Activate(object sender, EventArgs e)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select convert(varchar(10), max(quotationinviteddate), 105) quotationinviteddate, convert(varchar(10), max(quotationopeningdate), 105) quotationopeningdate, convert(varchar(10), max(purchasecommitteedate), 105) purchasecommitteedate, convert(varchar(10), max(comparativestatementdate), 105) comparativestatementdate, convert(varchar(10), max(finalapprovaldate), 105) finalapprovaldate, convert(varchar(10), max(supplyorderdate), 105) supplyorderdate, convert(varchar(10), max(supplydate), 105) supplydate, convert(varchar(10), max(stockentryforwardeddate), 105) stockentryforwardeddate, convert(varchar(10), max(completioncertificatedate), 105) completioncertificatedate,  convert(varchar(10), max(filesentforpaymentdate), 105) filesentforpaymentdate, convert(varchar(10), max(paymentmadedate), 105) paymentmadedate from tblquotation where fileno = @fileno";
        cmd.Parameters.AddWithValue("@fileno", txtcFileNoDetail.Text);
        try
        {
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            Session["quotationinviteddate"] = dr["quotationinviteddate"].ToString();
            Session["quotationopeningdate"] = dr["quotationopeningdate"].ToString();
            Session["purchasecommitteedate"] = dr["purchasecommitteedate"].ToString();
            Session["comparativestatementdate"] = dr["comparativestatementdate"].ToString();
            Session["finalapprovaldate"] = dr["finalapprovaldate"].ToString();
            Session["supplyorderdate"] = dr["supplyorderdate"].ToString();
            Session["supplydate"] = dr["supplydate"].ToString();
            Session["stockentryforwardeddate"] = dr["stockentryforwardeddate"].ToString();
            Session["completioncertificatedate"] = dr["completioncertificatedate"].ToString();
            Session["filesentforpaymentdate"] = dr["filesentforpaymentdate"].ToString();
            Session["paymentmadedate"] = dr["paymentmadedate"].ToString();
            dr.Close();
            con.Close();
            con.Dispose();
            cmd.Dispose();
        }
        catch (Exception)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
                con.Dispose();
                cmd.Dispose();
            }
        }
    }
    protected void ImageButton9_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "insert into tblPettyCash values (@fileno, @subject, @approvedamount, @supplydate, @stockentryforwardeddate, @completioncertificatedate, @WarrantyDate, @filesentforpaymentdate, @paymentmadedate, @operationaldate, 1)";
        try
        {
            cmd.Parameters.AddWithValue("@fileno", "CIIT-Lhr/Pur-" + txtdFileNoDetail.Text);
            if (txtPettyCashSubject.Text.Length == 0)
                cmd.Parameters.AddWithValue("@subject", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@subject", txtPettyCashSubject.Text);
            if (Request.Form["txtdSupplyDate"] == "" || Request.Form["txtdSupplyDate"] == null)
                cmd.Parameters.AddWithValue("@supplydate", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@supplydate", Convert.ToDateTime(Request.Form["txtdSupplyDate"]).ToShortDateString());
            if (txtdApprovedAmount.Text == "")
                cmd.Parameters.AddWithValue("@approvedamount", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@approvedamount", Convert.ToDecimal(txtdApprovedAmount.Text));
            if (Request.Form["txtdStockEntryForwardedDate"] == "" || Request.Form["txtdStockEntryForwardedDate"] == null)
                cmd.Parameters.AddWithValue("@stockentryforwardeddate", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@stockentryforwardeddate", Convert.ToDateTime(Request.Form["txtdStockEntryForwardedDate"]).ToShortDateString());
            if (Request.Form["txtdCompletionCertificateDate"] == "" || Request.Form["txtdCompletionCertificateDate"] == null)
            {
                cmd.Parameters.AddWithValue("@CompletionCertificateDate", DBNull.Value);
                cmd.Parameters.AddWithValue("@WarrantyDate", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@CompletionCertificateDate", Convert.ToDateTime(Request.Form["txtdCompletionCertificateDate"]).ToShortDateString());
                if (txtWarrantyMonthsPettyCashTender.Enabled == true && Convert.ToInt16(txtWarrantyMonthsPettyCashTender.Text) >= 1)
                {
                    cmd.Parameters.AddWithValue("@WarrantyDate", Convert.ToDateTime(Request.Form["txtdCompletionCertificateDate"]).AddMonths(Convert.ToInt16(txtWarrantyMonthsPettyCashTender.Text)).ToShortDateString());
                }
                else
                {
                    cmd.Parameters.AddWithValue("@WarrantyDate", DBNull.Value);
                }
            }
            if (Request.Form["txtdFileSentForPaymentDate"] == "" || Request.Form["txtdFileSentForPaymentDate"] == null)
                cmd.Parameters.AddWithValue("@filesentforpaymentdate", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@filesentforpaymentdate", Convert.ToDateTime(Request.Form["txtdFileSentForPaymentDate"]).ToShortDateString());
            if (Request.Form["txtdpaymentMadeDate"] == "" || Request.Form["txtdpaymentMadeDate"] == null)
                cmd.Parameters.AddWithValue("@paymentmadedate", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@paymentmadedate", Convert.ToDateTime(Request.Form["txtdPaymentMadeDate"]).ToShortDateString());
            cmd.Parameters.AddWithValue("@operationaldate", System.DateTime.Now);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            con.Dispose();
            cmd.Dispose();
            //dBindFileDetail("CIIT-LHR/Pur-" + txtdFileNoDetail.Text);
            try
            {
                DataTable dt = DAL.GetDetailViewOfAnIndividualCase("CIIT-Lhr/Pur-" + txtdFileNoDetail.Text);
                gvPettyCashDetailView.DataSource = dt;
                gvPettyCashDetailView.DataBind();
                foreach (GridViewRow row in gvPettyCashDetailView.Rows)
                {
                    Label lblSr = (Label)row.FindControl("lblSr");
                    lblSr.Text = Convert.ToString(row.RowIndex + 1);
                }
            }
            catch (Exception)
            {

            }
            lbldFileDetail.Text = "Record added successfully";
            lbldFileDetail.ForeColor = System.Drawing.Color.Green;
            try
            {
                DAL.RecordLog(Session["login"].ToString(), System.DateTime.Now, "User entered detail of file no " + txtdFileNoDetail.Text);
            }
            catch (Exception)
            {

            }
        }
        catch (Exception ex)
        {
            lbldFileDetail.Text = ex.Message;
            lbldFileDetail.ForeColor = System.Drawing.Color.Red;
            if (con.State == ConnectionState.Open)
            {
                con.Close();
                con.Dispose();
                cmd.Dispose();
                lbldFileDetail.Text = ex.Message;
            }
        }
    }
    protected void ImageButton8_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "insert into tblFileRemarks values (@FileNo, @RemarksDate, @Remarks, @LocationID, @RecordBy, 1)";
        cmd.Parameters.AddWithValue("FileNo", "CIIT-Lhr/Pur-" + txtdFileNoRemarks.Text);
        cmd.Parameters.AddWithValue("@RemarksDate", System.DateTime.Now);
        cmd.Parameters.AddWithValue("@Remarks", txtdRemarks.Text);
        cmd.Parameters.AddWithValue("@LocationID", Convert.ToInt16(ddldLocation.SelectedValue));
        cmd.Parameters.AddWithValue("@RecordBy", Session["login"].ToString());
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            dBindFileRemarks("CIIT-Lhr/Pur-" + txtdFileNoRemarks.Text);
            con.Dispose();
            cmd.Dispose();
            lbldErrorRemarks.Text = "Record added successfully";
            lbldErrorRemarks.ForeColor = System.Drawing.Color.Green;
            try
            {
                DAL.RecordLog(Session["login"].ToString(), System.DateTime.Now, "User entered remarks of file no " + txtdFileNoRemarks.Text);
            }
            catch (Exception)
            {

            }
        }
        catch (Exception ex)
        {
            lbldErrorRemarks.Text = ex.Message;
            lbldErrorRemarks.ForeColor = System.Drawing.Color.Red;
            if (con.State == ConnectionState.Open)
            {
                con.Close();
                con.Dispose();
                cmd.Dispose();
            }
        }
    }
    protected void gvFile_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // find the drop down list in the row
            DropDownList ddlStatus = (DropDownList)e.Row.FindControl("ddlStatus");
            //ddlStatus.DataSource = GetData("select distinct status from tblFile");
            ddlStatus.DataSource = GetData("select 'IP' as status union select 'Pending' as status union select 'Completed' as status union select 'Delivered' as status union select 'FollowUp' as status");
            ddlStatus.DataTextField = "status";
            ddlStatus.DataValueField = "status";
            ddlStatus.DataBind();

            // select the status of a file in the list
            string status = (e.Row.FindControl("lblStatus") as Label).Text;
            ddlStatus.Items.FindByValue(status).Selected = true;
        }
    }
    protected void gvFile_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
    protected void btnRemarksSingle_Click(object sender, EventArgs e)
    {
        if (FileType("CIIT-LHR/Pur-" + txtaFileNoDetail.Text).ToUpper() == "TENDER (SINGLE STAGE ONE ENVELOP)")
        {
            txtFileNoRemarks.Text = txtaFileNoDetail.Text;
            BindFileRemarks("CIIT-LHR/Pur-" + txtaFileNoDetail.Text);
            mv.ActiveViewIndex = 2;
            NewFileNo();
        }
    }
    protected void btnRemarksDouble_Click(object sender, EventArgs e)
    {
        if (FileType("CIIT-LHR/Pur-" + txtbFileNoDetail.Text).ToUpper() == "TENDER (SINGLE STAGE TWO ENVELOP)")
        {
            txtbFileNoRemarks.Text = txtbFileNoDetail.Text;
            bBindFileRemarks("CIIT-LHR/Pur-" + txtbFileNoDetail.Text);
            mv.ActiveViewIndex = 4;
            NewFileNo();
        }
    }
    protected void btnRemarksQuotation_Click(object sender, EventArgs e)
    {
        if (FileType("CIIT-LHR/Pur-" + txtcFileNoDetail.Text).ToUpper() == "QUOTATION")
        {
            txtcFileNoRemarks.Text = txtcFileNoDetail.Text;
            cBindFileRemarks("CIIT-LHR/Pur-" + txtcFileNoDetail.Text);
            mv.ActiveViewIndex = 6;
            NewFileNo();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileType("CIIT-LHR/Pur-" + txtdFileNoDetail.Text).ToUpper() == "PETTY CASH")
        {
            txtdFileNoRemarks.Text = txtdFileNoDetail.Text;
            dBindFileRemarks("CIIT-LHR/Pur-" + txtdFileNoDetail.Text);
            mv.ActiveViewIndex = 8;
            NewFileNo();
        }
    }
    protected void gvFile_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void btnUpdate_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "update tblfile set subject=@subject, DepartmentID=@Dept, Event=@Event, TypeOfProcurement=@TypeOfProcurement, SourceOfFunding=@SourceOfFunding, Type=@Type, RequisitionDate=@ReqDate where FileNo=@FileNo";
        cmd.Parameters.AddWithValue("@FileNo", txtEditFileNo.Text);
        cmd.Parameters.AddWithValue("@subject", txtEditSubject.Text);
        cmd.Parameters.AddWithValue("@Dept", ddlEditDepartment.SelectedValue);
        cmd.Parameters.AddWithValue("@Event", txtEditEvent.Text);
        cmd.Parameters.AddWithValue("@TypeOfProcurement", cbxEditTypeofProcurement.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@SourceOfFunding", txtEditSourceofFunding.Text);
        cmd.Parameters.AddWithValue("@Type", ddlEditFileType.SelectedValue);
        /*
        if (Request.Form["EditrequisitionDate"] == "" || Request.Form["EditrequisitionDate"] == null)
            cmd.Parameters.AddWithValue("@ReqDate", DBNull.Value);
        else
            cmd.Parameters.AddWithValue("@ReqDate", Convert.ToDateTime(Request.Form["EditrequisitionDate"]).ToShortDateString());
        */
        if (EditrequisitionDate.Value == "")
            cmd.Parameters.AddWithValue("@ReqDate", DBNull.Value);
        else
            cmd.Parameters.AddWithValue("@ReqDate", Convert.ToDateTime(EditrequisitionDate.Value));
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            btnUpdate.Enabled = false;
            lblUpdateMessage.Text = "Record updated successfully";
            lblUpdateMessage.ForeColor = System.Drawing.Color.Green;
            lblUpdateMessage.Visible = true;
        }
        catch (Exception)
        {
            lblUpdateMessage.Text = "Error occured. Could not update the record";
            lblUpdateMessage.ForeColor = System.Drawing.Color.Red;
            lblUpdateMessage.Visible = true;
        }
    }
    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void cbxWarrantyClaimSingleStageOneEnvelopTender_CheckedChanged(object sender, EventArgs e)
    {
        if (cbxWarrantyClaimSingleStageOneEnvelopTender.Checked == true)
        {
            txtWarrantyMonthsSingleStageOneEnvelopTender.Enabled = true;
            txtWarrantyMonthsSingleStageOneEnvelopTender.Text = "";
            txtWarrantyMonthsSingleStageOneEnvelopTender.Focus();
        }
        else
        {
            txtWarrantyMonthsSingleStageOneEnvelopTender.Enabled = false;
            txtWarrantyMonthsSingleStageOneEnvelopTender.Text = "Enter No of Months";
        }
    }
    protected void cbxWarrantyClaimSingleStageTwoEnvelopTender_CheckedChanged(object sender, EventArgs e)
    {
        if (cbxWarrantyClaimSingleStageTwoEnvelopTender.Checked == true)
        {
            txtWarrantyMonthsSingleStageTwoEnvelopTender.Enabled = true;
            txtWarrantyMonthsSingleStageTwoEnvelopTender.Text = "";
            txtWarrantyMonthsSingleStageTwoEnvelopTender.Focus();
        }
        else
        {
            cbxWarrantyClaimSingleStageTwoEnvelopTender.Enabled = false;
            txtWarrantyMonthsSingleStageTwoEnvelopTender.Text = "Enter No of Months";
        }
    }

    protected void cbxWarrantyClaimQuotationTender_CheckedChanged(object sender, EventArgs e)
    {
        if (cbxWarrantyClaimQuotationTender.Checked == true)
        {
            txtWarrantyMonthsQuotationTender.Enabled = true;
            txtWarrantyMonthsQuotationTender.Text = "";
            txtWarrantyMonthsQuotationTender.Focus();
        }
        else
        {
            cbxWarrantyClaimQuotationTender.Enabled = false;
            txtWarrantyMonthsQuotationTender.Text = "Enter No of Months";
        }
    }

    protected void cbxWarrantyClaimPettyCashTender_CheckedChanged(object sender, EventArgs e)
    {
        if (cbxWarrantyClaimPettyCashTender.Checked == true)
        {
            txtWarrantyMonthsPettyCashTender.Enabled = true;
            txtWarrantyMonthsPettyCashTender.Text = "";
            txtWarrantyMonthsPettyCashTender.Focus();
        }
        else
        {
            cbxWarrantyClaimPettyCashTender.Enabled = false;
            txtWarrantyMonthsPettyCashTender.Text = "Enter No of Months";
        }
    }
}
