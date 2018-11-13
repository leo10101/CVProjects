using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AD.DepartmentPage
{
    public partial class HomePageDelegate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["sign"].ToString() == "")
                Response.Redirect("~/LoginNew.aspx");
            lab_session.Text = Session["sign"].ToString();
            Boolean results = empauthentication.DeleAuthentication(Session["sign"].ToString());
            if (results == false)
                Response.Redirect("~/LoginNew.aspx");
            List<User> users = DepartmentBusinessLogic.ListUserByName(lab_session.Text);
            Model1 ctx = new Model1();
            int count = ctx.Users.Count();
            User[] user = new User[count];
            user = ctx.Users.ToArray();
            //  Label1.Text =;
            User u = ctx.Users.Where(x => x.UserName == lab_session.Text).First();
            lab_user.Text = lab_session.Text.ToString();
            lab_employeeID.Text = u.UserID.ToString();
            lab_employeeName.Text = u.UserName.ToString();
            lab_department.Text = u.DeptName.ToString();
            lab_userRole.Text = u.Role.ToString();
        }
    }
}