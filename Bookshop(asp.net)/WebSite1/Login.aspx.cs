using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Principal;
using System.Web.Security;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        e.Authenticated = Membership.ValidateUser(Login1.UserName,Login1.Password);
        IIdentity id = User.Identity;
        string role = "";
        if (User.IsInRole("manager"))
        {
            role = role+ ",manager";
        }
        else if (User.IsInRole("user"))
        {
            role = role + ",user";
        }
        //ProfileCommon profile


        Session["user"] = id.Name;
        Session["role"] = role;

    }
}