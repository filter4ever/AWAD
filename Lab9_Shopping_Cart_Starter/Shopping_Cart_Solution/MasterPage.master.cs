﻿using System;
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

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Session["Search"] = txtSearch.Text;
        Response.Redirect("Search");
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Guid newGUID = Guid.NewGuid();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SunnyCS"].ConnectionString);
        
        conn.Open();

        bool exists = false;

        using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [REGISTRATION] WHERE Email = @email", conn))
        {
            //checks if the email that the user has entered exists in the database table
            cmd.Parameters.AddWithValue("Email", txt_RegEmail.Text);
            exists = (int)cmd.ExecuteScalar() > 0;
        }

        //if the email exists, send an alert
        if (exists)
        {
            Response.Write("<script>alert('Sorry, Email is already taken!');</script>");
        }

        //else, insert 
        else
        {
            string insertQuery = "INSERT INTO REGISTRATION (Id, First_Name, Last_Name, Email, Password, OTP) " +
                "values (@id, @first, @last, @email, @password, null)";

            SqlCommand com = new SqlCommand(insertQuery, conn);
            string ePass = Hash.ComputeHash(txt_RegPassword.Text, "SHA512", null);
            com.Parameters.AddWithValue("@password", ePass);
            com.Parameters.AddWithValue("@id", newGUID.ToString());
            com.Parameters.AddWithValue("@email", txt_RegEmail.Text);
            com.Parameters.AddWithValue("@first", txt_FirstName.Text);
            com.Parameters.AddWithValue("@last", txt_LastName.Text);

            com.ExecuteNonQuery();

            Response.Write("<script>alert('Successfully created account! Welcome! ');</script>");
        }

        conn.Close();

        txt_FirstName.Text = "";
        txt_LastName.Text = "";
        txt_RegEmail.Text = "";
    }

    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        Session["Email"] = txt_Email.Text;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SunnyCS"].ConnectionString);

        conn.Open();

        string checkuser = "SELECT COUNT(*) FROM REGISTRATION WHERE Email = @email";
        SqlCommand com = new SqlCommand(checkuser, conn);
        com.Parameters.AddWithValue("@email", txt_Email.Text);

        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

        conn.Close();

        if (temp == 1)//checks if email exists inside DB
        {
            conn.Open();

            string checkPasswordQuery = "SELECT Password FROM REGISTRATION WHERE Email = @email2";

            SqlCommand pwcomm = new SqlCommand(checkPasswordQuery, conn);
            pwcomm.Parameters.AddWithValue("@email2", txt_Email.Text);
            string password = pwcomm.ExecuteScalar().ToString();

            bool flag = Hash.VerifyHash(txt_Password.Text, "SHA512", password); //verifies password through hash function
            
            conn.Close();

            if (flag == true)
            {
                //Session["CHANGE_MASTERPAGE"] = "~/AfterLogin.Master";
                //Session["CHANGE_MASTERPAGE2"] = null;
                //Response.Redirect(Request.Url.AbsoluteUri);

                conn.Open();

                string getEmailStr = "SELECT EMAIL FROM REGISTRATION WHERE EMAIL = @EMAIL";
                SqlCommand getEmailCom = new SqlCommand(getEmailStr, conn);
                getEmailCom.Parameters.AddWithValue("@EMAIL", txt_Email.Text);

                string getEmail = getEmailCom.ExecuteScalar().ToString();

                MailAddress to = new MailAddress(getEmail);
                MailAddress from = new MailAddress("servicedesk@element.com");

                Random generator = new Random();
                string otp = generator.Next(0, 1000000).ToString("D6");

                MailMessage message = new MailMessage(from, to);
                message.Subject = "Your OTP";
                message.Body = string.Format("Your OTP is {0}", otp);
                Debug.WriteLine(message.Body);

                message.IsBodyHtml = true;

                SmtpClient client = new SmtpClient("smtp.gmail.com", 587)
                {
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential("12345678afif@gmail.com", "ivorycoast2343"),
                    EnableSsl = true
                };

                try
                {
                    client.Send(message);
                    using (SqlCommand cmd = new SqlCommand("UPDATE REGISTRATION SET OTP = @OTP WHERE Email = @email", conn))
                    {
                        //checks if the email that the user has entered exists in the database table
                        cmd.Parameters.AddWithValue("@OTP", otp);
                        cmd.Parameters.AddWithValue("@Email", txt_Email.Text);
                        Session["otp"] = getEmail;
                        cmd.ExecuteNonQuery();
                    }
                }
                catch (SmtpException ex)
                {
                    Debug.WriteLine(ex.ToString());
                }
                Response.Redirect("OTP");
            }
            else
            {
                Response.Write("<script language=javascript>alert('Password or UserName is not correct')</script>");
            }
        }
        else
        {
            Response.Write("<script language=javascript>alert('Password or UserName is not correct')</script>");
        }

        txt_Email.Text = ""; //clears textbox after login
    }

    protected void btnAdminSignIn_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SunnyCS"].ConnectionString);

        conn.Open();

        string checkuser = "SELECT COUNT(*) FROM [ADMIN] WHERE Email = @email";

        SqlCommand com = new SqlCommand(checkuser, conn);
        com.Parameters.AddWithValue("@email", txt_AdminEmail.Text);

        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

        conn.Close();

        if (temp == 1)
        {
            conn.Open();

            string checkPasswordQuery = "SELECT AdminID, Password FROM [ADMIN] WHERE Email = @email2";

            SqlCommand pwcomm = new SqlCommand(checkPasswordQuery, conn);
            pwcomm.Parameters.AddWithValue("@email2", txt_AdminEmail.Text);

            SqlDataReader reader = pwcomm.ExecuteReader();
            reader.Read();
            string password = reader["Password"].ToString();
            string UserId = reader["AdminID"].ToString();
            reader.Close();

            if (password == txt_AdminPassword.Text)
            {
                Session["Email"] = txt_AdminEmail.Text;
                Response.Redirect("Adminhome");
            }
            else
            {
                reader.Close();
                Response.Write("<script language=javascript>alert('Password or Username is not correct')</script>");
            }
        }
        else
        {
            Response.Write("<script language=javascript>alert('Password or UserName is not correct')</script>");
        }

        txt_AdminEmail.Text = "";
    }

    protected void btnResetPw_Click(object sender, EventArgs r)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SunnyCS"].ConnectionString);

        conn.Open();

        string checkuser = "SELECT COUNT(*) FROM [REGISTRATION] WHERE Email = @email";

        SqlCommand com = new SqlCommand(checkuser, conn);
        com.Parameters.AddWithValue("@email", txt_ResetPwEmail.Text);

        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

        conn.Close();

        if (temp == 1)
        {
            conn.Open();

            string getEmailStr = "SELECT EMAIL FROM REGISTRATION WHERE EMAIL = @EMAIL";
            SqlCommand getEmailCom = new SqlCommand(getEmailStr, conn);
            getEmailCom.Parameters.AddWithValue("@EMAIL", txt_ResetPwEmail.Text);

            string getEmail = getEmailCom.ExecuteScalar().ToString();

            MailAddress to = new MailAddress(getEmail);
            MailAddress from = new MailAddress("servicedesk@element.com");

            //Random generator = new Random();
            //string otp = generator.Next(0, 1000000).ToString("D6");
            string resetpw = "http://" + HttpContext.Current.Request.Url.Authority + "/ResetPW";

            MailMessage message = new MailMessage(from, to);
            message.Subject = "Reset Password";
            message.Body = string.Format("Reset Password <a href='{0}'>here</a>", resetpw);
            Debug.WriteLine(message.Body);

            message.IsBodyHtml = true;

            SmtpClient client = new SmtpClient("smtp.gmail.com", 587)
            {
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential("12345678afif@gmail.com", "ivorycoast2343"),
                EnableSsl = true
            };

            try
            {
                client.Send(message);
                Session["resetPw"] = getEmail;
            }
            catch (SmtpException ex)
            {
                Debug.WriteLine(ex.ToString());
            }
        }
        else
        {
            Response.Write("<script language=javascript>alert('Email does not exist')</script>");
        }
    }
}