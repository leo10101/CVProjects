using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService2" in both code and config file together.
[ServiceContract]
public interface IService2
{
    [OperationContract]
    string HelloWorld();
    [OperationContract]
    [WebGet(UriTemplate = "/Book/{id}", ResponseFormat = WebMessageFormat.Json)]
    WCFBook GetBook(string id);

    [OperationContract]
    [WebGet(UriTemplate = "/Book", ResponseFormat = WebMessageFormat.Json)]
    WCFBook[] List();

    [OperationContract]
    [WebInvoke(UriTemplate = "/Update", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
    void Update(WCFBook b);

    [OperationContract]
    [WebGet(UriTemplate = "/BookImage/{id}.jpg", RequestFormat = WebMessageFormat.Xml, BodyStyle = WebMessageBodyStyle.Bare)]
    Stream FetchImage(string id);


}
[DataContract]
public class WCFBook
{
    public static WCFBook Make(int id, string title, int cat, string isbn, string author, int stock, decimal price)
    {
        WCFBook b = new WCFBook();
        b.BookID = id;
        b.Title = title;
        b.CategoryID = cat;
        b.ISBN = isbn;
        b.Author = author;
        b.Stock = stock;
        b.Price = price;
        return b;
    }

    [DataMember]
    public int BookID { get; set; }
    [DataMember]
    public string Title { get; set; }
    [DataMember]
    public int CategoryID { get; set; }
    [DataMember]
    public string ISBN { get; set; }
    [DataMember]
    public string Author { get; set; }
    [DataMember]
    public int Stock { get; set; }
    [DataMember]
    public decimal Price { get; set; }

}
