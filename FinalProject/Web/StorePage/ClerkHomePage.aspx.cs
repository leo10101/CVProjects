using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//ZHAOYINQING     EMAIL:GUOXIAOCHUAN
namespace AD.Store
{
    public partial class ClerkHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string clerkname = Session["sign"].ToString();

          
                if (Session["sign"].ToString() == "")
                    Response.Redirect("~/LoginNew.aspx");
                Boolean results = empauthentication.ClerkAuthentication(Session["sign"].ToString());
                if (results == false)
                    Response.Redirect("~/LoginNew.aspx");
            
            List<User> users = DepartmentBusinessLogic.ListUserByName(clerkname);
            Model1 ctx = new Model1();
            int count = ctx.Users.Count();
            User[] user = new User[count];
            user = ctx.Users.ToArray();
            //  Label1.Text =;
            User u = ctx.Users.Where(x => x.UserName == clerkname).First();
            lab_clerk.Text = u.UserName;
            lab_employeeID.Text = u.UserID.ToString();
            lab_employeeName.Text = u.UserName.ToString();
            lab_role.Text = u.Role;
        }
    }
}