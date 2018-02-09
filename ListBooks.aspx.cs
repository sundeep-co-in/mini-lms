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
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Library"].ConnectionString);
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Delete_Click(object sender, EventArgs e)
    {
        CheckBox ckbox = null;
        string victim = null;

        try
        {
            if (Page.IsPostBack == true)
            {
                foreach (GridViewRow gvr in GridView1.Rows)
                {
                    ckbox = ((CheckBox)(gvr.FindControl("CheckBox1")));
                    if (ckbox.Checked)
                    {
                        victim = GridView1.DataKeys[gvr.RowIndex].Value.ToString();

                        SqlDataAdapter AdapterDelete = new SqlDataAdapter();
                        AdapterDelete.DeleteCommand = new SqlCommand();
                        AdapterDelete.DeleteCommand.Connection = conn;
                        AdapterDelete.DeleteCommand.CommandText = "DELETE FROM inventory where itemID = '" + victim + "'";

                        SqlCommand proComm = new SqlCommand("dbo.StoredProcedure1", conn);
                        proComm.CommandType = CommandType.StoredProcedure;
                        proComm.Parameters.Add("@victim", SqlDbType.VarChar).Value = victim.ToString();

                        conn.Open();
                        proComm.ExecuteNonQuery();
                        AdapterDelete.DeleteCommand.ExecuteNonQuery();
                        conn.Close();

                        Label2.Text = "Deletion Successful";
                    }
                    else
                    {
                        Label2.Text = "Select Article(s) to Remove.";
                    }
                }
            }
            
            
        }
        catch (Exception)
        {
            Label2.Text = "Unknown Error Occurred.";
        }
        finally
        {
            GridView1.DataBind();
        }        
    }
}