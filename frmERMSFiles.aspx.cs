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

public partial class frmERMSFiles : System.Web.UI.Page
{
    decimal BoxFileID;
    string Subject;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            BoxFileID = Convert.ToDecimal(Request.QueryString["BoxfileID"]);
            lblFileNo.Text = "CIIT-LHR/Pur-" + Request.QueryString["BoxfileID"].ToString();
            Subject = Request.QueryString["Subject"].ToString();
            lblSubject.Text = Request.QueryString["Subject"].ToString();
            lblEndUser.Text = Request.QueryString["EndUser"].ToString();
            lblEvent.Text = Request.QueryString["Event"].ToString();
            lblType.Text = Request.QueryString["Type"].ToString();
            lblRequestApprovalDate.Text = Request.QueryString["RequestApprovalDate"].ToString();
            BindBoxFileDocuments(BoxFileID);
        }
    }
    
    protected void BindBoxFileDocuments(decimal BoxFileID)
    {
        SqlConnection con = DAL.GetERMSConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        //cmd.CommandText = "select documentid, documenttype, documentdescription, filename,  case documentstatus when 1 then 'In' when 0 then 'Out' end as status, remarks, filename from vw_boxfiledocument where boxfileid = @fileid";
        cmd.CommandText = "select documentid, documenttype, documentdescription, filename,  case documentstatus when 1 then 'In' when 0 then 'Out' end as status, remarks, filename from vw_boxfiledocument where boxfileid = (select distinct boxfileid from vw_boxfiledocument where boxfilename like '%"+ BoxFileID.ToString() +"%')";
        //cmd.Parameters.AddWithValue("@fileid", BoxFileID);
        try
        {
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                gvERMS.DataSource = dt;
                gvERMS.DataBind();
                foreach (GridViewRow row in gvERMS.Rows)
                {
                    Label lblSr = (Label)row.FindControl("lblSr");
                    lblSr.Text = Convert.ToString(row.RowIndex + 1);
                }
            }
            else
                lblMessage.Visible = true;
        }
        catch (Exception)
        {

        }
    }
    protected void gvERMS_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            try
            {
                HyperLink HL = (HyperLink)e.Row.FindControl("HlFile");
                string url = @"PurchaseData/" + BoxFileID.ToString() + @"/" + e.Row.Cells[6].Text;
                HL.NavigateUrl = url;
            }
            catch (Exception)
            {

            }
        }
    }
    protected void gvERMS_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string FileName;
        bool login;
        try
        {
            int rowIndex = Convert.ToInt16(e.CommandArgument);
            string commandName = e.CommandName;
            if (commandName == "View")
            {
                int DocID = Convert.ToInt16(gvERMS.Rows[rowIndex].Cells[1].Text);
                SqlConnection con = DAL.GetERMSConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                con.Open();
                cmd.CommandText = "select filename from tblboxfiledocument where id = @id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", DocID);
                FileName = cmd.ExecuteScalar().ToString();
                con.Close();
                con.Dispose();
                cmd.Dispose();
                //FileName = DAL.RootDirectoryPath + @"\" + DAL.UserDepartment + @"\" + FolderName + @"\" + FileName;
                FileName = Server.MapPath(@"PurchaseData/" + BoxFileID.ToString() + @"/" + FileName);
                //RemoteCredentialsClass rc = new RemoteCredentialsClass(FileName, "administrator", "exp0nent1");
                try
                {
                    Response.Write(FileName);
                    //Process.Start(FileName);
                    //WebClient User = new WebClient();
                    //Byte[] FileBuffer = User.DownloadData(FileName);
                    //if (FileBuffer != null)
                    //{
                    //    Response.ContentType = "application/pdf";
                    //    Response.AddHeader("content-length", FileBuffer.Length.ToString());
                    //    Response.BinaryWrite(FileBuffer);
                    //}

                }
                catch (Exception)
                {

                }
            }
        }
        catch (Exception)
        {

        }
    }
}
