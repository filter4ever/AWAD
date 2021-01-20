using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;

public partial class ProductDetails : BasePage
{
    //declare a new Product class
    Product prod = null;
    DataTable dt = new DataTable();

    //retrieve connection info from web.config
    string constr = ConfigurationManager.ConnectionStrings["SunnyCS"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        Product aProd = new Product();

        //request ProdID from QueryString (PostBackURL)
        string prodID = Request.QueryString["ProdID"].ToString();
        prod = aProd.getProduct(prodID);

        lblTitle.Text = prod.Product_Name;
        lblDescription.Text = prod.Product_Desc;
        lblPrice.Text = prod.Unit_Price.ToString("C");
        lblPrice2.Text = prod.Unit_Price.ToString("C");
        imgProductDetails.ImageUrl = prod.Product_Image;
        lblAuthor.Text = prod.Book_Author;
        lblGenre.Text = prod.Book_Genre;

        SqlConnection conn = new SqlConnection(constr);

        bool exists;

        if (ShoppingCart.Instance.getAShopptingCartItem(prod.Product_ID) != null)
        {
            btnAddCart.Text = "ADDED TO CART";
            btnAddCart.Enabled = false;
        }

        //conn.Open();


        //if (!Session["Email"].ToString().Contains("Guest-")) {
        //    String email = Session["Email"].ToString();
        //    String getUserIdStr = "SELECT ID FROM REGISTRATION WHERE EMAIL = @EMAIL";
        //    SqlCommand getUserId = new SqlCommand(getUserIdStr, conn);
        //    getUserId.Parameters.AddWithValue("@EMAIL", email);
        //    String userId = getUserId.ExecuteScalar().ToString();

        //    Debug.WriteLine(userId);
        //    Debug.WriteLine(prodID);

        //    using (SqlCommand check = new SqlCommand("SELECT COUNT(*) FROM [EL_CART] WHERE EL_ID = @ANIMEID AND Id = @ID", conn))
        //    {
        //        check.Parameters.AddWithValue("@ANIMEID", prod.Product_ID);
        //        check.Parameters.AddWithValue("@ID", userId);
        //        exists = (int)check.ExecuteScalar() > 0;
        //    }

        //    conn.Close();
        //}
        //else
        //{
        //    string guestId = "Guest-" + newGUID.ToString();

        //    using (SqlCommand check = new SqlCommand("SELECT COUNT(*) FROM [EL_CART] WHERE EL_ID = @ANIMEID AND Id = @ID", conn))
        //    {
        //        check.Parameters.AddWithValue("@ANIMEID", prod.Product_ID);
        //        check.Parameters.AddWithValue("@ID", guestId);
        //        exists = (int)check.ExecuteScalar() > 0;
        //    }

        //    conn.Close();
        //}

        //Debug.WriteLine(exists);
        //if (exists)
        //{
        //    btnAddCart.Text = "ADDED TO CART";
        //    btnAddCart.Enabled = false;
        //}

        if (!IsPostBack)
        {
            DataTable dt = this.GetData("SELECT ISNULL(AVG(Rating), 0) AverageRating, COUNT(Rating) " +
                "RatingCount FROM [RATINGS] WHERE Title = @booktitle");

            //display rating
            Rating1.CurrentRating = Convert.ToInt32(dt.Rows[0]["AverageRating"]);
            lblresult.Text = string.Format("{0} Ratings ", dt.Rows[0]["RatingCount"]);
            lblavgrating.Text = string.Format("{0}", dt.Rows[0]["AverageRating"]);
        }
    }

    //extract table data
    private DataTable GetData(string query)
    {
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cmd = new SqlCommand(query);
        cmd.Parameters.AddWithValue("@booktitle", lblTitle.Text);
        SqlDataAdapter sda = new SqlDataAdapter();
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        sda.SelectCommand = cmd;
        sda.Fill(dt);
        return dt;
    }

    public void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(constr);

        //insert rating into database
        SqlCommand cmd = new SqlCommand("INSERT INTO [RATINGS] VALUES (@ratingvalue,@review,@title)");
        SqlDataAdapter sda = new SqlDataAdapter();
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@ratingvalue", Rating1.CurrentRating.ToString());
        cmd.Parameters.AddWithValue("@review", txtreview.Text);
        cmd.Parameters.AddWithValue("@title", lblTitle.Text);
        cmd.Connection = con;
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect(Request.Url.AbsoluteUri);
    }

    public void btnAddToCart_Click(object sender, EventArgs e)
    {
        //Practical Shopping Cart
        string iProductID = prod.Product_ID.ToString();
        ShoppingCart.Instance.AddItem(iProductID, prod);
        Response.Redirect(Request.Url.AbsoluteUri);

        ////Own Shopping Cart
        //SqlConnection conn = new SqlConnection(constr);

        //Product aProd = new Product();
        //Guid newGUID = Guid.NewGuid();

        //bool exists;

        ////request ProdID from QueryString (PostBackURL)
        //string prodID = Request.QueryString["ProdID"].ToString();
        //prod = aProd.getProduct(prodID);

        //conn.Open();

        //if (!Session["Email"].ToString().Contains("Guest-"))
        //{
        //    String email = Session["Email"].ToString();
        //    String getUserIdStr = "SELECT ID FROM REGISTRATION WHERE EMAIL = @EMAIL";
        //    SqlCommand getUserId = new SqlCommand(getUserIdStr, conn);
        //    getUserId.Parameters.AddWithValue("@EMAIL", email);
        //    String userId = getUserId.ExecuteScalar().ToString();

        //    Debug.WriteLine(userId);
        //    Debug.WriteLine(prodID);

        //    using (SqlCommand check = new SqlCommand("SELECT COUNT(*) FROM [EL_CART] WHERE EL_ID = @ANIMEID AND Id = @ID", conn))
        //    {
        //        check.Parameters.AddWithValue("@ANIMEID", prod.Product_ID);
        //        check.Parameters.AddWithValue("@ID", userId.ToString());
        //        exists = (int)check.ExecuteScalar() > 0;
        //    }

        //    conn.Close();

        //    if (exists)
        //    {
        //        Response.Write("<script language=javascript>alert('Item Already in Cart!')</script>");
        //    }
        //    else
        //    {
        //        SqlCommand cmd = new SqlCommand("INSERT INTO [EL_CART] VALUES (@animeid, @userid, @title, @price, @quantity, @img)");
        //        SqlDataAdapter sda = new SqlDataAdapter();

        //        cmd.CommandType = CommandType.Text;
        //        cmd.Parameters.AddWithValue("@animeid", prodID);
        //        cmd.Parameters.AddWithValue("@userid", userId);
        //        cmd.Parameters.AddWithValue("@title", prod.Product_Name);
        //        cmd.Parameters.AddWithValue("@price", prod.Unit_Price);
        //        cmd.Parameters.AddWithValue("@quantity", 1);
        //        cmd.Parameters.AddWithValue("@img", prod.Product_Image);

        //        cmd.Connection = conn;

        //        conn.Open();
        //        cmd.ExecuteNonQuery();
        //        conn.Close();

        //        Response.Redirect(Request.Url.AbsoluteUri);
        //    }
        //}
        //else
        //{
        //    string guestId = "Guest-" + newGUID.ToString();

        //    Debug.WriteLine(guestId);
        //    Session["Email"] = guestId;

        //    using (SqlCommand check = new SqlCommand("SELECT COUNT(*) FROM [EL_CART] WHERE EL_ID = @ANIMEID AND Id = @ID", conn))
        //    {
        //        check.Parameters.AddWithValue("@ANIMEID", prod.Product_ID);
        //        check.Parameters.AddWithValue("@ID", guestId);
        //        exists = (int)check.ExecuteScalar() > 0;
        //    }

        //    conn.Close();

        //    if (exists)
        //    {
        //        Response.Write("<script language=javascript>alert('Item Already in Cart!')</script>");
        //    }
        //    else
        //    {
        //        SqlCommand cmd = new SqlCommand("INSERT INTO [EL_CART] VALUES (@userid, @animeid, @title, @price, @quantity, @img)");
        //        SqlDataAdapter sda = new SqlDataAdapter();

        //        cmd.CommandType = CommandType.Text;
        //        cmd.Parameters.AddWithValue("@userid", guestId);
        //        cmd.Parameters.AddWithValue("@animeid", prodID);
        //        cmd.Parameters.AddWithValue("@title", prod.Product_Name);
        //        cmd.Parameters.AddWithValue("@price", prod.Unit_Price);
        //        cmd.Parameters.AddWithValue("@quantity", 1);
        //        cmd.Parameters.AddWithValue("@img", prod.Product_Image);

        //        cmd.Connection = conn;

        //        conn.Open();
        //        cmd.ExecuteNonQuery();
        //        conn.Close();

        //        Response.Redirect(Request.Url.AbsoluteUri);
        //    }
        //}
    }
}