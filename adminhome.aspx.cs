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
        SqlCommand cmd1 = new SqlCommand("SELECT * FROM inventory WHERE itemType = 'Books' ", conn);
        SqlCommand cmd2 = new SqlCommand("SELECT * FROM inventory WHERE itemType = 'CDs' ", conn);
        SqlCommand cmd3 = new SqlCommand("SELECT * FROM inventory WHERE itemType = 'Magazines' ", conn);
        SqlCommand cmd4 = new SqlCommand("SELECT * FROM issue WHERE status = 'True' ", conn);
        SqlDataReader datareader;

        int c1 = 0, c2 = 0, c3 = 0, c4 = 0;

        try
        {
            conn.Open();
            datareader = cmd1.ExecuteReader();
            if (datareader.HasRows)
            {
                while (datareader.Read())
                {
                    c1++;
                }
            }
            datareader.Close();

            datareader = cmd2.ExecuteReader();
            if (datareader.HasRows)
            {
                while (datareader.Read())
                {
                    c2++;
                }
            }
            datareader.Close();

            datareader = cmd3.ExecuteReader();
            if (datareader.HasRows)
            {
                while (datareader.Read())
                {
                    c3++;
                }
            }
            datareader.Close();

            datareader = cmd4.ExecuteReader();
            if (datareader.HasRows)
            {
                while (datareader.Read())
                {
                    c4++;
                }
            }
            datareader.Close();

            Label2.Text = c1.ToString(); Label3.Text = c2.ToString(); Label4.Text = c3.ToString(); Label5.Text = c4.ToString();
        }
        catch (Exception)
        {

        }
        finally
        {
            conn.Close();
        }
    }
}