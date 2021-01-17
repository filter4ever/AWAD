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

public partial class _Default : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        double subtotal = 0;
        double total = 0;

        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SunnyCS"].ConnectionString))
        {
            string str = "SELECT * FROM EL_CART";
            SqlCommand com = new SqlCommand(str, conn);
            conn.Open();
            SqlDataReader dr = com.ExecuteReader();
            if (dr.HasRows)
            {
                foreach (GridViewRow row in gvCart.Rows)
                {
                    Label lblTotalPrice = row.FindControl("lblTotalPrice") as Label;
                    string totalPrice = lblTotalPrice.Text;
                    Debug.WriteLine(totalPrice);
                    subtotal += Convert.ToDouble(lblTotalPrice.Text);
                }

                gvCart.FooterRow.Cells[0].Text = "Total";
                gvCart.FooterRow.Cells[3].Text = subtotal.ToString("c");

                lblSubtotal.Text = subtotal.ToString("C");
                lblShipping.Text = 2.ToString("C");
                lblTotal.Text = (total + subtotal + 2).ToString("c");
            } 
            else
            {
                Response.Write("<script language=javascript>alert('Cart Empty!')</script>");
            }
        }

            

        
    }

    protected void gvCart_RowDelete(object sender, GridViewDeleteEventArgs e)
    {
        int result = 0;
        Product prod = new Product();
        string ItemID = gvCart.DataKeys[e.RowIndex].Value.ToString();
        Debug.WriteLine(ItemID);
        result = prod.ItemDelete(ItemID);

        if (result > 0)
        {
            Response.Write("<script>alert('Item Removed successfully');</script>");
        }
        else
        {
            Response.Write("<script>alert('Item Removal NOT successful');</script>");
        }

        Response.Redirect("ViewCart.aspx");
    }

    protected void Cart_Total(object sender, GridViewRowEventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SunnyCS"].ConnectionString);

        double total = 0;
        double price;

        //conn.Open();

        //String email = Session["Email"].ToString();
        //String getUserIdStr = "SELECT ID FROM REGISTRATION WHERE EMAIL = @EMAIL";
        //SqlCommand getUserId = new SqlCommand(getUserIdStr, conn);
        //getUserId.Parameters.AddWithValue("@EMAIL", email);
        //String userId = getUserId.ExecuteScalar().ToString();

        //string getQuantityStr = "SELECT QUANTITY FROM EL_CART WHERE ID = @ID";
        //SqlCommand getQuantity = new SqlCommand(getQuantityStr, conn);
        //getQuantity.Parameters.AddWithValue("@ID", userId);
        //String quantityStr = getQuantity.ExecuteScalar().ToString();

        //string getPriceStr = "SELECT PRICE FROM EL_CART WHERE ID = @ID";
        //SqlCommand getPrice = new SqlCommand(getPriceStr, conn);
        //getPrice.Parameters.AddWithValue("@ID", userId);
        //string priceStr = getPrice.ExecuteScalar().ToString();

        //conn.Close();

        //double quantity = Convert.ToDouble(quantityStr);
        //double price = Convert.ToDouble(priceStr);
        
        foreach (GridViewRow row in gvCart.Rows)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblTotalPrice = (e.Row.FindControl("lblTotalPrice") as Label);
                Debug.WriteLine(lblTotalPrice.Text);

                price = double.Parse(lblTotalPrice.Text);

                total += price;
            }
            else
            {
                total += 0;
            }
        }

        //Label lblTotalPrice = (Label)gvCart.FindControl("lblTotalPrice");
    }
}