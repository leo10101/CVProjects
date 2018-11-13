using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class cartController
{
    public CartList addItem(CartList cl, int id, string t, decimal p)
    {
        Book b = new Book();
        b.BookID = id;
        b.Title = t;
        b.Price = p;
        int q = 1;
        Cart c = new Cart(b, q);
        cl.add(c);
        CartList Cl = cl;
        return Cl;
    }

    public decimal countprice(CartList cl)
    {
        List<Cart> cart = cl.getCl();
        decimal totalprice = 0;
        for (int i = 0; i < cart.Count; i++)
        {
            Cart c = cart[i];
            decimal p = 0;
            p = c.b.Price;
            totalprice = totalprice + p;
        }
        return totalprice;
    }

    public void minusStock(CartList cl)
    {
        BookshopEntities bookshop = new BookshopEntities();

        List<Cart> cart = cl.getCl();

        for (int i = 0; i < cart.Count; i++)
        {
            Cart c = cart[i];
            Book b = bookshop.Books.Find(c.b.BookID);

            int bookstock = 1;
            bookstock = b.Stock - 1;

            b.Stock = bookstock;
            bookshop.SaveChanges();
        }
    }
}
