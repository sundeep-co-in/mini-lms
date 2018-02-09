using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class Default2 : System.Web.UI.Page
{
    SqlConnection conn;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Library"].ConnectionString);
    }
    protected void AddArticle_Click(object sender, EventArgs e)
    {
        SqlCommand cmd1 = new SqlCommand("UPDATE issue SET actualReturnDate = '"+ TextBox5.Text.ToString() +"' WHERE issueID = '" + DropDownList2.Text.ToString() + "' ", conn);
        SqlCommand cmd2 = new SqlCommand("UPDATE inventory SET lock = @flag WHERE itemID = '" + DropDownList5.Text.ToString() + "' ", conn);
        SqlCommand cmd3 = new SqlCommand("UPDATE issue SET status = 'False' WHERE issueID = '" + DropDownList2.Text.ToString() + "' ", conn);
        try
        {
            conn.Open();
            cmd1.ExecuteNonQuery();
            cmd2.Parameters.Add("@flag", SqlDbType.VarChar).Value = "False";
            cmd2.ExecuteNonQuery();
            cmd3.ExecuteNonQuery();
            Label2.Text = "Article Returned Successfully";
        }
        catch (Exception)
        {
            Label2.Text = "Unknown Error Occured. Try Again";
        }
        finally
        {
            conn.Close();
        }

    }
}