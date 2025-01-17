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
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class SqlInjectionCorrected : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
	protected void cmdGetRecords_Click(object sender, System.EventArgs e)
	{
        string connectionString = 
            WebConfigurationManager.ConnectionStrings["Northwind"].ConnectionString; 
		SqlConnection con = new SqlConnection(connectionString);
		string sql =
			"SELECT Orders.CustomerID, Orders.OrderID, COUNT(UnitPrice) AS Items, " +
			"SUM(UnitPrice * Quantity) AS Total FROM Orders " +
			"INNER JOIN [Order Details] " +
			"ON Orders.OrderID = [Order Details].OrderID " +
			"WHERE Orders.CustomerID = @CustID " +
			"GROUP BY Orders.OrderID, Orders.CustomerID";
		SqlCommand cmd = new SqlCommand(sql, con);
		cmd.Parameters.AddWithValue("@CustID", txtID.Text);

		con.Open();
		SqlDataReader reader = cmd.ExecuteReader();
		GridView1.DataSource = reader;
		GridView1.DataBind();
		reader.Close();
		con.Close();
	}
}
