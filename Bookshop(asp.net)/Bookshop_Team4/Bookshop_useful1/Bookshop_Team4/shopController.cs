using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Bookshop_Team4;

namespace Bookshop_Team4
{
    public class shopController
    {
        BookshopEntities BookShop = new BookshopEntities();

        public List<Book> find4Book()
        {
            Book a = BookShop.Books.Find(1);
            Book b = BookShop.Books.Find(2);
            Book c = BookShop.Books.Find(3);
            Book d = BookShop.Books.Find(4);

            List<Book> book = new List<Book>();
            book.Add(a);
            book.Add(b);
            book.Add(c);
            book.Add(d);

            return book;
        }


        public List<Book> searchByTitle(string keyword)
        {
            return BookShop.Books.Where(x => x.Title.Contains(keyword)).ToList();
        }

        public List<Book> searchByAuthor(string keyword)
        {
            return BookShop.Books.Where(x => x.Author.Contains(keyword)).ToList();
        }

        public Book loadBook(string title)
        {
            Book b = BookShop.Books.Where(x => x.Title == title).First();
            return b;
        }
        public Category loadCategory(Book b)
        {
            Category c = BookShop.Categories.Where(x => x.CategoryID == b.CategoryID).First();
            return c;
        }

        public List<Book> selectAll()
        {
            return BookShop.Books.ToList();
        }

        public List<Book> OrderByPrice()
        {
            return BookShop.Books.OrderByDescending(x => x.Price).ToList();           
        }

        public List<Book> OrderByTitle()
        {
            return BookShop.Books.OrderBy(x => x.Title).ToList();
        }
    }
}
