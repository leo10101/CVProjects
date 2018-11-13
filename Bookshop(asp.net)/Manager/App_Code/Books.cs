using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Books
/// </summary>
public class Books
{
        [key]
    public int BookID { get; set; }
    public int CategoryID { get; set; }
    public string Title { get; set; }
    // public string Address { get; set; }
    // public string Email { get; set; }
    public string ISBN { get; set; }
    public string Author { get; set; }
    public int Stock { get; set; }
    public decimal Price { get; set; }

}