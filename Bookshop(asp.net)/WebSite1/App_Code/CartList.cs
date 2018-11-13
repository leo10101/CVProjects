using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


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
