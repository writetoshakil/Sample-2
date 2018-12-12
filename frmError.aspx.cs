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

public partial class frmError : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int value = 0;
        if (!this.IsPostBack)
        {
            value = Convert.ToInt16(Request.QueryString["id"]);
        }
        if (value == 0)
        {
            lblMessage.Text = "Updated successfully";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }
        else
        {
            lblMessage.Text = "Error occured ...";
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }
}
