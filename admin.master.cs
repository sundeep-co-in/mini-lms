using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (string.Compare(Session["ActiveRole"].ToString(), "librarian") == 0)
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
    protected void Page_Unload(object sender, EventArgs e)
    {
        //Session.Abandon();
    }
}
