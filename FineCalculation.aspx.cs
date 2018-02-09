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
        DateTime date1 = new DateTime();
        DateTime date2 = new DateTime();

          
        SqlDataReader datareader;
        SqlCommand cmd1 = new SqlCommand("SELECT * FROM issue WHERE issueID = '" + DropDownList2.Text.ToString() +"' ", conn);

        try
        {
            conn.Open();
            datareader = cmd1.ExecuteReader();
            if (datareader.HasRows)
            {
                while (datareader.Read())
                {
                    date1 = DateTime.Parse(datareader["returnDate"].ToString());
                    date2 = DateTime.Parse(datareader["actualReturnDate"].ToString());
                }
            }

            int d1_day = date1.Day;
            int d1_month = date1.Month;
            int d2_day = date2.Day;
            int d2_month = date2.Month;

            int rate = int.Parse(TextBox6.Text.Trim());

            int days=0, fine;

            if (d2_month > d1_month)
            {
                days = ((d2_day + 30) - d1_day);
            }
            else
            {
                days = (d2_day - d1_day);
            }

            fine = days * rate;

            FineAmt.Text = "Number of Days: " + days.ToString() + " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fine Amount: " + fine.ToString();

        }
        catch (Exception)
        {
            FineAmt.Text = "Unresolved Error Occurred.";
        }

    }
}