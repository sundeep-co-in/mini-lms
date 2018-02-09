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
        SqlCommand cmd1 = new SqlCommand("INSERT INTO issue VALUES (@tempid, '"+ DropDownList1.Text.ToString() +"', '" + DropDownList2.Text.ToString() + "', '" + TextBox5.Text.ToString() + "', '" + TextBox6.Text.ToString() + "', null, @flag)", conn);
        SqlCommand cmd2 = new SqlCommand("UPDATE inventory SET lock = @flag WHERE itemID = '"+ DropDownList1.Text +"' ", conn);

        try
        {
            Random tid = new Random();
            string tempid = "tran" + tid.Next();
            conn.Open();
            cmd1.Parameters.Add("@tempid", SqlDbType.VarChar).Value = tempid.ToString();
            cmd1.Parameters.Add("@flag", SqlDbType.VarChar).Value = "True";
            cmd1.ExecuteNonQuery();
            cmd2.Parameters.Add("@flag", SqlDbType.VarChar).Value = "True";
            cmd2.ExecuteNonQuery();
            IssueStatus.Text = "Article Issued Successfully.";
            Label2.Text = "Transaction ID: " + tempid;
        }
        catch (Exception)
        {
            IssueStatus.Text = "Unknown Error Occured. Try Again";
        }
        finally
        {
            conn.Close();
        }
    }
}