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
using System.Net.Mail;

public partial class frmVendorEmail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            BindVendors();
        }
    }

    protected void BindVendors()
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select vendorid, name, contactperson, contactno, emailid, case(prequalified) when 1 then 'Yes' when 0 then 'No' end as 'Prequalified' from tblvendor where isactive = 1";
        try
        {
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
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
    protected void btnRemarksSingle_Click(object sender, EventArgs e)
    {
        string result;
        result = Request.Form["confirm_value"].ToString();
        string MsgTo = "";
        CheckBox cbx;
        if (result == "Yes")
        {
            try
            {
                int counter = 0;
                String MsgFrom = "procurement@ciitlahore.edu.pk";
                string password = "PMS@comsats897";
                //Proper Authentication Details need to be passed when sending email from gmail             
                //System.Net.NetworkCredential mailAuthentication = new System.Net.NetworkCredential(MsgFrom, "keepIt2Secure1");
                System.Net.NetworkCredential mailAuthentication = new System.Net.NetworkCredential(MsgFrom, password);
                String MsgSubject = "Reminder for Delivery of Work Order";
                String MsgBody = "This is to inform that expected date of delivery has been exceeded. You are requested to provide item(s) mentioned in Work order issued to you \n" +
                    "\n\nE.Mail:  procurement@ciitlahore.edu.pk \nWebsite:  http://www.ciitlahore.edu.pk";
                foreach (GridViewRow row in gvVendor.Rows)
                {
                    cbx = row.FindControl("cbxSelect") as CheckBox;
                    if (cbx.Checked == true)
                    {
                        MsgTo = row.Cells[5].Text;
                        try
                        {
                            if (MsgTo == "" || MsgTo.Length == 0 || MsgTo == "&nbsp;")
                            {
                                row.BackColor = System.Drawing.Color.Red;
                            }
                            else
                            {
                                System.Net.Mail.MailMessage MyMailMessage = new System.Net.Mail.MailMessage(MsgFrom, MsgTo, MsgSubject, MsgBody);
                                //For Attachment
                                //String filePath = Server.MapPath(folderPath + obj.FileName);
                                try
                                {
                                    MyMailMessage.IsBodyHtml = false;
                                    //Smtp Mail server of Gmail is "smpt.gmail.com" and it uses port no. 587 
                                    //For different server like yahoo this details changes and you can 
                                    //get it from respective server. 
                                    System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
                                    //Enable SSL 
                                    mailClient.EnableSsl = true;
                                    /*
                                        //Set Reply-To Address if you want to set 'reply-to email for recepient' other then MsgFrom which mail has to be sent
                                        String ReplyTo = "manager@ciitlahore.edu.pk";
                                        MyMailMessage.ReplyTo = new System.Net.Mail.MailAddress(ReplyTo);
                                    */
                                    mailClient.UseDefaultCredentials = false;
                                    mailClient.Credentials = mailAuthentication;
                                    mailClient.Send(MyMailMessage);
                                    row.BackColor = System.Drawing.Color.Green;
                                    counter++;
                                }
                                catch (Exception)
                                {
                                    row.BackColor = System.Drawing.Color.Red;
                                }
                            }
                        }
                        catch (Exception)
                        {

                        }
                    }
                }
                lblError.Text = counter.ToString() + " emails sent.";
                lblError.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }
}
