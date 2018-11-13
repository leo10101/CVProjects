using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bookshop_Team4;

namespace Bookshop_Team4
{
    public partial class ViewCart : System.Web.UI.Page
    {
        cartController cc = new cartController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["cart"] != null)
            {
                CartList cart = (CartList)Session["cart"];
                this.GridViewCart.DataSource = cart.getCl();
                this.GridViewCart.DataBind();
                decimal totalprice = cc.countprice(cart);
                txtTotalPrice.Text = totalprice.ToString();
            }                        
            else
            {
                CartList cart = new CartList();
                this.GridViewCart.DataSource = cart.getCl();
                this.GridViewCart.DataBind();
                decimal totalprice = cc.countprice(cart);
                txtTotalPrice.Text = totalprice.ToString();
                Response.Write("<script>alert('Empty!')</script>");
            }
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            //For Luke
            //if (Session["username"] == null)
            //{
            //    Response.Redirect("Login.aspx");
            //}

            CartList cart = (CartList)Session["cart"];
            cc.minusStock(cart);
            Session["cart"] = null;
            Response.Write("<script>alert('Update Successful!');window.location.href ='Homepage.aspx'</script>");

            
           
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}