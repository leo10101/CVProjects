using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//GUOXIAOCHUAN
namespace AD
{
    public partial class UnReadEmailNum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["sign"].ToString() == "")
                Response.Redirect("~/LoginNew.aspx");
        }


        protected void Button1_Click1(object sender, EventArgs e)
        {
                Model1 ctx = new Model1();
                string a = Session["sign"].ToString();
                List<User> users = DepartmentBusinessLogic.ListUserByName(a);
                int count = ctx.Users.Count();
                User[] user = new User[count];
                user = ctx.Users.ToArray();
                User u = ctx.Users.Where(x => x.UserName == a).First();
                int num = (int)u.EmailNum;
                Label2.Text = num.ToString();
                u.EmailNum = 0;
                ctx.SaveChanges();
            

        }
    }
}