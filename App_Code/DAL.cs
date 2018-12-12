using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for DAL
/// </summary>
public static class DAL
{
    public static string CurrentLogin;
    public static bool flag = false;
    public static string Server = @"SHAKIL-PC\SQL2000";
    public static string Database = "BookOrder";
    public static string User = "sa";
    public static string Password = "123";
    public static string MessageHeader = "Purchae File Processing System";
    public static string Login = "shakil";
    public static int EmpID, HODID;
    public static string Name, Designation, Department, EmailID, HODEmailID, FileNo;
    public static string RootDirectoryPath = @"\\172.16.17.31\EDMS";
    public static string UserDepartment = "Purchase Section";


    public static SqlConnection GetConnection()
    {
        //return new SqlConnection(@"data source = 172.16.17.20; initial catalog = Purchase; user id = sa; password = exp0nent1");
        return new SqlConnection(@"data source = 172.16.17.31\SQL2008,12345; initial catalog = Purchase; user id = sa; password = exp0nent1");
    }

    public static SqlConnection GetComsisConnection()
    {
        return new SqlConnection(@"data source = 172.16.17.20; initial catalog = NOCInventory; user id = sa; password = exp0nent1");
    }

    public static SqlConnection GetCuonlineConnection()
    {
        return new SqlConnection(@"data source = 172.16.17.4; initial catalog = CUONLINE; user id = shakil; password = exp0nent1");
    }

    public static SqlConnection GetERMSConnection()
    {
        return new SqlConnection(@"data source = 172.16.17.31\FILESERVER; initial catalog = StudentPersonalFile; user id = sa; password = exp0nent1");
    }

    public static void RecordLog(string login, DateTime date, string action)
    {
        SqlConnection con = DAL.GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "insert into tblLog values (@login, @date, @action)";
        cmd.Parameters.AddWithValue("@login", login);
        cmd.Parameters.AddWithValue("@date", date);
        cmd.Parameters.AddWithValue("@action", action);
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
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
            }
                
        }
    }

    public static string GetEmailID(int EmpID)
    {
        string EmailID;
        SqlConnection con = DAL.GetCuonlineConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select email from hrms.hrms_vw_employeeemail where id = @empid";
        cmd.Parameters.AddWithValue("@empid", EmpID);
        try
        {
            con.Open();
            EmailID = cmd.ExecuteScalar().ToString();
            con.Close();
        }
        catch (Exception)
        {
            if (con.State == ConnectionState.Open)
                con.Close();
            EmailID = "";
        }
        return EmailID;
    }

    public static DataTable GetDetailViewOfAnIndividualCase(string FileNo)
    {
        DataTable dt = new DataTable();
        SqlConnection con = GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        //cmd.CommandText = "select fileno, typeofprocurement, sourceoffunding, diaryindate, tender_quotation_date, cpcmeeting, finalapprovaldate, approvedamount, supplyorderdate, vendor, supplydate, stockentryforwardeddate, completioncertificatedate, filesentforpaymentdate, paymentmadedate from vw_DetailViewofAnIndividualCase where fileno = @fileno";
        cmd.CommandText = "select fileno, typeofprocurement, sourceoffunding, diaryindate, tender_quotation_date, cpcmeeting, finalapprovaldate, approvedamount, supplyorderdate, vendor, supplydate, stockentryforwardeddate, completioncertificatedate, filesentforpaymentdate, paymentmadedate from vw_DetailView where fileno = @fileno";
        cmd.Parameters.AddWithValue("@fileno", FileNo);
        try
        {
            
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
        }
        catch (Exception)
        {
            
        }
        return dt;
    }

    public static string GetDeptEmailID(int DepartmentID)
    {
        string emailID;
        SqlConnection con = GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select emailid from tblDepartment where DepartmentID = @ID";
        cmd.Parameters.AddWithValue("@ID", DepartmentID);
        try
        {
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
                emailID = dr["emailid"].ToString();
            }
            else
                emailID = "";
            con.Close();
        }
        catch (Exception)
        {
            emailID = "";
        }
        return emailID;
    }

    public static decimal GetContactNo(int DepartmentID)
    {
        decimal contactNo;
        SqlConnection con = GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select contactno from tblDepartment where DepartmentID = @ID";
        cmd.Parameters.AddWithValue("@ID", DepartmentID);
        try
        {
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
                contactNo = Convert.ToDecimal(dr["contactno"]);
            }
            else
                contactNo = 0;
            con.Close();
        }
        catch (Exception)
        {
            contactNo = 0;
        }
        return contactNo;
    }

    public static int GetFileType(string fileNo)
    {
        int FileType = 0;
        SqlConnection con = GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select type from tblFile where fileno = @fileno";
        cmd.Parameters.AddWithValue("@fileno", fileNo);
        try
        {
            con.Open();
            FileType = Convert.ToInt16(cmd.ExecuteScalar());
            con.Close();
        }
        catch (Exception)
        {
            
        }
        return FileType;
    }

    public static int GetLastVendorID()
    {
        int vendorID = 0;
        SqlConnection con = GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select max(vendorid) from tblVendor";
        try
        {
            con.Open();
            vendorID = Convert.ToInt16(cmd.ExecuteScalar());
            con.Close();
        }
        catch (Exception)
        {
            
        }
        con.Dispose();
        cmd.Dispose();
        return vendorID;
    }

    public static DataTable GetVendorDetail(int VendorID)
    {
        DataTable dt = new DataTable();
        SqlConnection con = GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select * from tblVendor where vendorid = @id";
        cmd.Parameters.AddWithValue("@id", VendorID);
        try
        {
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
        }
        catch (Exception)
        {
            dt = null;
        }
        return dt;
    }

    public static DataTable GetVendorNatureOfBusiness(int VendorID)
    {
        DataTable dt = new DataTable();
        SqlConnection con = GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select businessid, natureofbusiness from  vw_vendordetail where vendorid = @id order by businessid";
        cmd.Parameters.AddWithValue("@id", VendorID);
        try
        {
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
        }
        catch (Exception)
        {
            dt = null;
        }
        return dt;
    }
}
