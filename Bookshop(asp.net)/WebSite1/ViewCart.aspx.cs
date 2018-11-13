using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Principal;

public partial class _Default : System.Web.UI.Page
{
    cartController cc = new cartController();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["cart"] != null)
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
    
        if (!User.IsInRole("User") && !User.IsInRole("Manager"))
        {
          Response.Redirect("~/Login.aspx?ReturnUrl=ViewCart.aspx");
        }
        try
        {
            CartList cart = (CartList)Session["cart"];
            cc.minusStock(cart);
            Session["cart"] = null;
            Response.Write("<script>alert('Order submitted!');window.location.href ='Default.aspx'</script>");
        }   catch (Exception ex)
        {
            string errormsg = string.Format("<script>Error:{0}</script>", ex.Message);
            Response.Write(errormsg);
        }
    }

}