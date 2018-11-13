using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bookshop_Team4;

namespace Bookshop_Team4
{
    public partial class BrowseBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            shopController sc = new shopController();
            string title = (string)Session["booktitle"];
            //string title = "The Hate U Give";//For testing purpose
            Book b = sc.loadBook(title);
            Category c = sc.loadCategory(b);//Mr. Derek, I feel it is not necessary to have a seperate table for category......
            txtTitle.Text = b.Title;
            txtISBN.Text = b.ISBN;
            txtAuthor.Text = b.Author;
            txtCat.Text = c.Name;
            txtQuantity.Text = b.Stock.ToString();
            txtPrice.Text = b.Price.ToString();//Original Price
            Image1.ImageUrl = "~/images/" + b.ISBN +".jpg";
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            shopController sc = new shopController();
            string title = (string)Session["booktitle"];
            Book b = sc.loadBook(title);
            
            //For Luke's login part
            //if (Session["username"] == null)
            //{
            //    Response.Redirect("Login.aspx");
            //}

            if (Session["cart"] != null)
            {
                CartList cl = (CartList)Session["cart"];
         
                int id = b.BookID;
                decimal price = 0;
                price = b.Price;

                cartController cc = new cartController();
                cl = cc.addItem(cl, id, title, price);
                Session["cart"] = cl;
            }
            else
            {
                CartList cl = new CartList();

                int id = b.BookID;
                decimal price = 0;
                price = b.Price;

                cartController cc = new cartController();
                cl = cc.addItem(cl, id, title, price);
                Session["cart"] = cl;
            }
            Response.Redirect("ViewCart.aspx");
        }
    }
}