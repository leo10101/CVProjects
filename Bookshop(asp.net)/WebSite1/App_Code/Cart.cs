using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Cart
/// </summary>
public class Cart
{

        public Book b;
        public Book B
        {
            get { return b; }
            set { b = value; }
        }
        public int quantity;
        public int Quantity
        {
            get { return quantity; }
            set { quantity = value; }
        }
        public Cart(Book b, int q)
        {
            this.b = b;
            this.quantity = q;
        }
 }