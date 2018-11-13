using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Bookshop_Team4
{
    public class CartList
    {
        List<Cart> cl = new List<Cart>();
        public List<Cart> getCl()
        {
            return cl;
        }

        public void add(Cart c)
        {
            cl.Add(c);
        }
    }
}