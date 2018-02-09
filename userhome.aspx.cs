using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userhome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (string.Compare(Session["ActiveRole"].ToString(), "borrower") == 0)
            {
                Label1.Text = Session["ActiveUser"].ToString();
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }
        catch (Exception)
        {
            Response.Redirect("Logout.aspx");
        }
    }
}