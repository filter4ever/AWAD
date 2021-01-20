using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class BestSeller : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.BindRepeater();
        }
    }

    private void BindRepeater()
    {
        string constr = ConfigurationManager.ConnectionStrings["SunnyCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Thriller_CRUD"))
            {
                cmd.Parameters.AddWithValue("@Action", "SELECT");
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        Repeater1.DataSource = dt;
                        Repeater1.DataBind();
                    }
                }
            }
            using (SqlCommand cmd = new SqlCommand("Action_CRUD"))
            {
                cmd.Parameters.AddWithValue("@Action", "SELECT");
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        Repeater2.DataSource = dt;
                        Repeater2.DataBind();
                    }
                }
            }
            using (SqlCommand cmd = new SqlCommand("Comedy_CRUD"))
            {
                cmd.Parameters.AddWithValue("@Action", "SELECT");
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        Repeater3.DataSource = dt;
                        Repeater3.DataBind();
                    }
                }
            }
            using (SqlCommand cmd = new SqlCommand("Romance_CRUD"))
            {
                cmd.Parameters.AddWithValue("@Action", "SELECT");
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        Repeater4.DataSource = dt;
                        Repeater4.DataBind();
                    }
                }
            }
            using (SqlCommand cmd = new SqlCommand("Horror_CRUD"))
            {
                cmd.Parameters.AddWithValue("@Action", "SELECT");
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        Repeater5.DataSource = dt;
                        Repeater5.DataBind();
                    }
                }
            }
        }
    }

    protected void OnEdit(object sender, EventArgs e)
    {
        //Find the reference of the Repeater Item.
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
        this.ToggleElements(item, true);
    }

    private void ToggleElements(RepeaterItem item, bool isEdit)
    {
        //Toggle Buttons.
        item.FindControl("lnkEdit").Visible = !isEdit;
        item.FindControl("lnkUpdate").Visible = isEdit;
        item.FindControl("lnkCancel").Visible = isEdit;


        //Toggle Labels.
        item.FindControl("lblTitle").Visible = !isEdit;
        item.FindControl("lblStudio").Visible = !isEdit;
        item.FindControl("imgBooks").Visible = !isEdit;

        //Toggle TextBoxes.
        item.FindControl("txtTitle").Visible = isEdit;
        item.FindControl("txtStudio").Visible = isEdit;
        item.FindControl("txtImage").Visible = isEdit;
    }

    protected void OnUpdateThriller(object sender, EventArgs e)
    {
        //Find the reference of the Repeater Item.
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;

        //Finds the matching BS_ID in the row of data
        int bookId = int.Parse((item.FindControl("lblAnimeId") as Label).Text);
        //Trim() allows data to be modified
        string name = (item.FindControl("txtTitle") as TextBox).Text.Trim();
        string price = (item.FindControl("txtStudio") as TextBox).Text.Trim();
        string image = (item.FindControl("txtImage") as TextBox).Text.Trim();

        string constr = ConfigurationManager.ConnectionStrings["SunnyCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            //using stored procedure
            using (SqlCommand cmd = new SqlCommand("Thriller_CRUD"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                //call the action UPDATE
                cmd.Parameters.AddWithValue("@Action", "UPDATE");
                //pass in new values
                cmd.Parameters.AddWithValue("@AnimeId", bookId);
                cmd.Parameters.AddWithValue("@Title", name);
                cmd.Parameters.AddWithValue("@Studio", price);
                cmd.Parameters.AddWithValue("@Image", image);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        //display
        this.BindRepeater();
    }

    protected void OnUpdateAction(object sender, EventArgs e)
    {
        //Find the reference of the Repeater Item.
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;

        //Finds the matching BS_ID in the row of data
        int bookId = int.Parse((item.FindControl("lblAnimeId") as Label).Text);
        //Trim() allows data to be modified
        string name = (item.FindControl("txtTitle") as TextBox).Text.Trim();
        string price = (item.FindControl("txtStudio") as TextBox).Text.Trim();
        string image = (item.FindControl("txtImage") as TextBox).Text.Trim();

        string constr = ConfigurationManager.ConnectionStrings["SunnyCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            //using stored procedure
            using (SqlCommand cmd = new SqlCommand("Action_CRUD"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                //call the action UPDATE
                cmd.Parameters.AddWithValue("@Action", "UPDATE");
                //pass in new values
                cmd.Parameters.AddWithValue("@AnimeId", bookId);
                cmd.Parameters.AddWithValue("@Title", name);
                cmd.Parameters.AddWithValue("@Studio", price);
                cmd.Parameters.AddWithValue("@Image", image);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        //display
        this.BindRepeater();
    }
    protected void OnUpdateComedy(object sender, EventArgs e)
    {
        //Find the reference of the Repeater Item.
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;

        //Finds the matching BS_ID in the row of data
        int bookId = int.Parse((item.FindControl("lblAnimeId") as Label).Text);
        //Trim() allows data to be modified
        string name = (item.FindControl("txtTitle") as TextBox).Text.Trim();
        string price = (item.FindControl("txtStudio") as TextBox).Text.Trim();
        string image = (item.FindControl("txtImage") as TextBox).Text.Trim();

        string constr = ConfigurationManager.ConnectionStrings["SunnyCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            //using stored procedure
            using (SqlCommand cmd = new SqlCommand("Comedy_CRUD"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                //call the action UPDATE
                cmd.Parameters.AddWithValue("@Action", "UPDATE");
                //pass in new values
                cmd.Parameters.AddWithValue("@AnimeId", bookId);
                cmd.Parameters.AddWithValue("@Title", name);
                cmd.Parameters.AddWithValue("@Studio", price);
                cmd.Parameters.AddWithValue("@Image", image);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        //display
        this.BindRepeater();
    }
    protected void OnUpdateRomance(object sender, EventArgs e)
    {
        //Find the reference of the Repeater Item.
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;

        //Finds the matching BS_ID in the row of data
        int bookId = int.Parse((item.FindControl("lblAnimeId") as Label).Text);
        //Trim() allows data to be modified
        string name = (item.FindControl("txtTitle") as TextBox).Text.Trim();
        string price = (item.FindControl("txtStudio") as TextBox).Text.Trim();
        string image = (item.FindControl("txtImage") as TextBox).Text.Trim();

        string constr = ConfigurationManager.ConnectionStrings["SunnyCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            //using stored procedure
            using (SqlCommand cmd = new SqlCommand("Romance_CRUD"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                //call the action UPDATE
                cmd.Parameters.AddWithValue("@Action", "UPDATE");
                //pass in new values
                cmd.Parameters.AddWithValue("@AnimeId", bookId);
                cmd.Parameters.AddWithValue("@Title", name);
                cmd.Parameters.AddWithValue("@Studio", price);
                cmd.Parameters.AddWithValue("@Image", image);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        //display
        this.BindRepeater();
    }
    protected void OnUpdateHorror(object sender, EventArgs e)
    {
        //Find the reference of the Repeater Item.
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;

        //Finds the matching BS_ID in the row of data
        int bookId = int.Parse((item.FindControl("lblAnimeId") as Label).Text);
        //Trim() allows data to be modified
        string name = (item.FindControl("txtTitle") as TextBox).Text.Trim();
        string price = (item.FindControl("txtStudio") as TextBox).Text.Trim();
        string image = (item.FindControl("txtImage") as TextBox).Text.Trim();

        string constr = ConfigurationManager.ConnectionStrings["SunnyCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            //using stored procedure
            using (SqlCommand cmd = new SqlCommand("Horror_CRUD"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                //call the action UPDATE
                cmd.Parameters.AddWithValue("@Action", "UPDATE");
                //pass in new values
                cmd.Parameters.AddWithValue("@AnimeId", bookId);
                cmd.Parameters.AddWithValue("@Title", name);
                cmd.Parameters.AddWithValue("@Studio", price);
                cmd.Parameters.AddWithValue("@Image", image);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        //display
        this.BindRepeater();
    }
    protected void OnCancel(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
        this.ToggleElements(item, false);
    }

    protected void OnDeleteThriller(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
        int bookId = int.Parse((item.FindControl("lblAnimeId") as Label).Text);

        string constr = ConfigurationManager.ConnectionStrings["SunnyCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Thriller_CRUD"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@AnimeId", bookId);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        this.BindRepeater();
    }

    protected void OnDeleteAction(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
        int bookId = int.Parse((item.FindControl("lblAnimeId") as Label).Text);

        string constr = ConfigurationManager.ConnectionStrings["SunnyCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Action_CRUD"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@AnimeId", bookId);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        this.BindRepeater();
    }

    protected void OnDeleteComedy(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
        int bookId = int.Parse((item.FindControl("lblAnimeId") as Label).Text);

        string constr = ConfigurationManager.ConnectionStrings["SunnyCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Comedy_CRUD"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@AnimeId", bookId);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        this.BindRepeater();
    }
    protected void OnDeleteRomance(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
        int bookId = int.Parse((item.FindControl("lblAnimeId") as Label).Text);

        string constr = ConfigurationManager.ConnectionStrings["SunnyCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Romance_CRUD"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@AnimeId", bookId);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        this.BindRepeater();
    }
    protected void OnDeleteHorror(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
        int bookId = int.Parse((item.FindControl("lblAnimeId") as Label).Text);

        string constr = ConfigurationManager.ConnectionStrings["SunnyCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Horror_CRUD"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@AnimeId", bookId);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        this.BindRepeater();
    }

    protected void btnAddThriller_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-InsertThriller.aspx");
    }

    protected void btnAddAction_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-InsertAction.aspx");
    }
    protected void btnAddComedy_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-InsertComedy.aspx");
    }

    protected void btnAddRomance_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-InsertRomance.aspx");
    }

    protected void btnAddHorror_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-InsertHorror.aspx");
    }
}