using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using Salt_Password_Sample;
using System.Diagnostics;
using System.Net;
using System.Net.Mail;

public partial class otp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["otp"] == null)
        {
            Response.Redirect("index.aspx");
        }
    }

    protected void otpValidate(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SunnyCS"].ConnectionString);

        conn.Open();

        bool exists = false;

        string email = Session["otp"].ToString().Trim();

        using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [REGISTRATION] WHERE Email = @email AND OTP = @OTP", conn))
        {
            //checks if the email that the user has entered exists in the database table
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@OTP", otpV.Text.Trim());
            exists = (int)cmd.ExecuteScalar() > 0;
        }

        if (exists)
        {
            using (SqlCommand cmd = new SqlCommand("UPDATE REGISTRATION SET OTP = null WHERE Email = @email", conn))
            {
                //checks if the email that the user has entered exists in the database table
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.ExecuteNonQuery();
            }

            Session["otp"] = null;
            Session["Email"] = email;
            Session["CHANGE_MASTERPAGE"] = "~/AfterLogin.Master";
            Session["CHANGE_MASTERPAGE2"] = null;
            Session["rank"] = "user";
            Response.Write("<script language=javascript>alert('Logged In!')</script>");
            Response.Redirect("index.aspx");
        }
    }
}