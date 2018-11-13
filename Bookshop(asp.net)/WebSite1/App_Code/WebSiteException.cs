using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for WebSiteException
/// </summary>
public class WebSiteException: Exception
{
    public WebSiteException()
    { }
    public WebSiteException(string message):base(message)
    { }
    public WebSiteException(string message, Exception inner): base(message,inner)
    { }
}