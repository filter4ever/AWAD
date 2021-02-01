using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;


public partial class Admin_Chart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Chart1.ChartAreas["ChartArea1"].AxisX.Interval = 1;
        }
    }

    private void GetChartData()
    {
        string cs = ConfigurationManager.ConnectionStrings["SunnyCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            // Command to retrieve Students data from Students table
            SqlCommand cmd = new SqlCommand("Select Title, totalPrice from ALL_Products", con);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            // Retrieve the Series to which we want to add DataPoints
            Series series = Chart1.Series["Series1"];
            // Loop thru each Student record
            while (rdr.Read())
            {
                // Add X and Y values using AddXY() method
                series.Points.AddXY(rdr["Title"].ToString(),
                    rdr["totalPrice"]);
            }
        }

    }
}