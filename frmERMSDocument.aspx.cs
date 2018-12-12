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
using System.Collections.Generic;
using System.IO;
using System.Diagnostics;
using System.Net;

public partial class frmERMSDocument : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            BindBoxFiles();
        }
    }

    protected void BindBoxFiles()
    {
        SqlConnection con = DAL.GetERMSConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select fileid, filename from tblboxfile where createdby in (select login from tbllogin where department = 'purchase section')";
        try
        {
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            ddlBoxFile.DataSource = dt;
            ddlBoxFile.DataValueField = "fileid";
            ddlBoxFile.DataTextField = "filename";
            ddlBoxFile.DataBind();
        }
        catch (Exception)
        {
            
        }
    }

    protected void BindBoxFileDocuments(int BoxFileID)
    {
        SqlConnection con = DAL.GetERMSConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select documentid, documenttype, documentdescription, filename,  case documentstatus when 1 then 'In' when 0 then 'Out' end as status, remarks, filename from vw_boxfiledocument where boxfileid = @fileid";
        cmd.Parameters.AddWithValue("@fileid", BoxFileID);
        try
        {
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            gvERMS.DataSource = dt;
            gvERMS.DataBind();
            foreach (GridViewRow row in gvERMS.Rows)
            {
                Label lblSr = (Label)row.FindControl("lblSr");
                lblSr.Text = Convert.ToString(row.RowIndex + 1);
            }
        }
        catch (Exception)
        {
            
        }
    }
    protected void btnSelect_Click(object sender, EventArgs e)
    {
        BindBoxFileDocuments(Convert.ToInt16(ddlBoxFile.SelectedValue));
    }
    protected void gvERMS_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string FolderName, FileName;
        bool login;
        try
        {
            int rowIndex = Convert.ToInt16(e.CommandArgument);
            FolderName = ddlBoxFile.SelectedItem.Text;
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
                FileName = Server.MapPath(@"PurchaseData\" + FolderName + @"\" + FileName);
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
    protected void gvERMS_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            try
            {
                HyperLink HL = (HyperLink)e.Row.FindControl("HlFile");
                string url = @"PurchaseData/" + ddlBoxFile.SelectedItem.Text + @"/" + e.Row.Cells[6].Text;
                HL.NavigateUrl = url;
            }
            catch (Exception)
            {
                
            }
        }
    }
}
