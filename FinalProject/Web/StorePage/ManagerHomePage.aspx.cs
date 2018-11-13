using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//ZHAOYINQING
namespace AD.Store
{
    public partial class ManagerHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Model1 ctx = new Model1();
            if (Session["sign"].ToString() == "")
                Response.Redirect("~/LoginNew.aspx");
            Boolean results = empauthentication.ManagerAuthentication(Session["sign"].ToString());
            if (results == false)
                Response.Redirect("~/LoginNew.aspx");
            string managername = Session["sign"].ToString();
            User u = ctx.Users.Where(x => x.UserName == managername).First();
            lab_name.Text = u.UserName;
            lab_employeeid.Text = u.UserID.ToString();
            lab_employeeName.Text = u.UserName.ToString();
            lab_role.Text = u.Role;

        }
    }
}