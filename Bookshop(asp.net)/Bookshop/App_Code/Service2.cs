using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service2" in code, svc and config file together.
public class Service2 : IService2
{
    BookshopEntities context = new BookshopEntities();

    public string HelloWorld()
    {
        return "Hello World";
    }
    public WCFBook GetBook(string id)
    {
        int bookId = Int32.Parse(id);
        Book b = context.Books.Where(x => x.BookID == bookId).First();
        return WCFBook.Make(b.BookID, b.Title, b.CategoryID, b.ISBN, b.Author, b.Stock, b.Price);
    }


    public WCFBook[] List()
    {
        Book[] books = Bookshop.Data.ListBooks().ToArray<Book>();
        WCFBook[] wcfBooks = new WCFBook[books.Length];
        for (int i = 0; i < books.Length; i++)
        {
            Book b = books[i];
            wcfBooks[i] = WCFBook.Make(b.BookID, b.Title, b.CategoryID, b.ISBN, b.Author, b.Stock, b.Price);
        }
        return wcfBooks;
    }


    public void Update(WCFBook b)
    {
        Book book = context.Books.Where(x => x.BookID == b.BookID).First();
        book.CategoryID = b.CategoryID;
        book.Author = b.Author;
        book.ISBN = b.ISBN;
        book.Price = b.Price;
        book.Stock = b.Stock;
        book.Title = b.Title;
        context.SaveChanges();
    }

    public Stream FetchImage(string id)
    {
        int bookId = Int32.Parse(id);
        Book b = context.Books.Where(x => x.BookID == bookId).First();
        String filePath = AppDomain.CurrentDomain.BaseDirectory + "images\\" +b.ISBN+".jpg";

        if (File.Exists(filePath))
        {
            FileStream fs = File.OpenRead(filePath);
            WebOperationContext.Current.OutgoingRequest.ContentType = "image/jpeg";
            return fs;
        }
        return null;
    }
}
