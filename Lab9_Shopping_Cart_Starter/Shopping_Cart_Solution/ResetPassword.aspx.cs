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

public partial class ResetPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void resetPwClick(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SunnyCS"].ConnectionString);

        Debug.WriteLine(Session["resetPw"].ToString());

        conn.Open();

        bool exists = false;

        string email = Session["resetPw"].ToString();

        string newPw;

        using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [REGISTRATION] WHERE Email = @email", conn))
        {
            //checks if the email that the user has entered exists in the database table
            cmd.Parameters.AddWithValue("@email", email);
            exists = (int)cmd.ExecuteScalar() > 0;
        }

        Debug.WriteLine(newPassword.Text);
        Debug.WriteLine(verifyNewPassword.Text);
        bool flag = newPassword.Text == verifyNewPassword.Text;

        if (flag == true)
        {
            newPw = newPassword.Text.Trim();
            if (exists)
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE REGISTRATION SET Password = @Password WHERE Email = @email", conn))
                {
                    //checks if the email that the user has entered exists in the database table
                    string hashPass = Hash.ComputeHash(newPw, "SHA512", null);
                    cmd.Parameters.AddWithValue("@Password", hashPass);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.ExecuteNonQuery();
                }

                Session["resetPw"] = null;
                Response.Write("<script language=javascript>alert('Password is Reset!')</script>");
                Response.Redirect("index.aspx");
            }
        }
    }
}