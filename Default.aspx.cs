using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page 
{
    SqlConnection conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Library"].ConnectionString);        
    }
    protected void Login_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("SELECT * FROM users WHERE userName = '" + username.Text + "' AND userPassword = '" + password.Text + "' ", conn);
        SqlDataReader datareader;

        conn.Open();
        datareader = cmd.ExecuteReader();

        if (datareader.HasRows)
        {
            while (datareader.Read())
            {
                if (string.Compare(datareader["userRole"].ToString(), "librarian") == 0)
                {
                    Session["ActiveUser"] = datareader["userName"].ToString();
                    Session["ActiveRole"] = datareader["userRole"].ToString();
                    Response.Redirect("adminhome.aspx");
                }
                else if (string.Compare(datareader["userRole"].ToString(), "borrower") == 0)
                {
                    Session["ActiveUser"] = datareader["userName"].ToString();
                    Session["ActiveRole"] = datareader["userRole"].ToString();
                    Response.Redirect("userhome.aspx");
                }
            }
        }
        else
        {
            Label1.Text = "Login Failed. Try Again.";
        }
    }
}