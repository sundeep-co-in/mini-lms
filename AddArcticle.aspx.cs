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
        int count=1;
        string tempStock = "";
        SqlDataReader datareader;
        SqlCommand cmd1 = new SqlCommand("SELECT * FROM inventory WHERE itemName = '" + TextBox1.Text.Trim() + "' AND itemAuthor = '" + TextBox2.Text.Trim() + "' AND itemPublisher = '" + TextBox3.Text.Trim() + "' ", conn);
        SqlCommand cmd2 = new SqlCommand("INSERT INTO inventory (itemID, itemType, itemName, itemAuthor, itemPublisher, stockID, lock) VALUES ('" + TextBox4.Text.Trim() + "', '" + DropDownList1.Text + "', '" + TextBox1.Text.Trim() + "', '" + TextBox2.Text.Trim() + "', '" + TextBox3.Text.Trim() + "', @tempStock, 'False')", conn);
        SqlCommand cmd3 = new SqlCommand("INSERT INTO stock VALUES (@tempStock, '1')", conn);
        SqlCommand cmd4 = new SqlCommand("UPDATE stock SET stockCopies = @num WHERE stockID = @tempStock", conn);
        try
        {
            conn.Open();
            datareader = cmd1.ExecuteReader();
            if (datareader.HasRows)
            {
                while (datareader.Read())
                {
                    tempStock = datareader["stockID"].ToString();
                    count++;
                }

                datareader.Close();
                cmd2.Parameters.Add("@tempStock", SqlDbType.VarChar).Value = tempStock.ToString();
                cmd2.ExecuteNonQuery();

                cmd4.Parameters.Add("@tempStock", SqlDbType.VarChar).Value = tempStock.ToString();
                cmd4.Parameters.Add("@num", SqlDbType.VarChar).Value = count.ToString();
                cmd4.ExecuteNonQuery();
            }
            else
            {
                Random xyz = new Random();
                tempStock = DropDownList1.Text.ToString() + xyz.Next();

                datareader.Close();
                cmd2.Parameters.Add("@tempStock", SqlDbType.VarChar).Value = tempStock.ToString();
                cmd2.ExecuteNonQuery();

                datareader.Close();
                cmd3.Parameters.Add("@tempStock", SqlDbType.VarChar).Value = tempStock.ToString();
                cmd3.ExecuteNonQuery();
            }
                       
            
            Label2.Text = "Article Added Successfully";
            Label3.Text = "Copies In Stock: " + count.ToString();
        }
        catch (System.Data.SqlClient.SqlException)
        {
            Label2.Text = "Provide Unique Item ID. ";
        }
        catch (Exception)
        {
            Label2.Text = "Unknown Error Occured. Try Again. ";
        }
        finally
        {
            conn.Close();
        }
    }
}