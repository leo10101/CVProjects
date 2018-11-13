using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Bookshop
{
    public class Data
    {
        public static List<Book> ListBooks()
        {
            using (BookshopEntities m = new BookshopEntities())
            {
                return m.Books.ToList();
            }
        }

        public static Book GetBook(string id)
        {
            int bookId = Int32.Parse(id);
            using (BookshopEntities m = new BookshopEntities())
            {
                return m.Books.Where
                        (p => p.BookID == bookId).ToList<Book>()[0];
            }
        }

        public static void InsertBook(Book b)
        {
            using (BookshopEntities m = new BookshopEntities())
            {
                m.Books.Add(b);
                m.SaveChanges();
            }
        }
        public static void UpdateBook(Book b)
        {
            using (BookshopEntities m = new BookshopEntities())
            {
                m.Entry(b).State = System.Data.Entity.EntityState.Modified;
                m.SaveChanges();
            }
        }
    }
}