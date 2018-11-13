using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//ZHAOYINQING
namespace AD
{
    public partial class LoginNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            Label1.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        
        }
        protected void btn_Login_Click(object sender, EventArgs e)
        {
            string sign = (string)Session["sign"];
            Session["sign"] = tbx_UserName.Text;
            Model1 ctx = new Model1();
            bool isFound = false;
            int count = ctx.Users.Count();
            User[] users = new User[count];
            users = ctx.Users.ToArray();

            for (int i = 0; i < count; i++)
            {
                if (tbx_UserName.Text == users[i].UserName)
                {
                    isFound = true;
                }
            }
            if (isFound == false)
            {
                tbx_UserName.Text = "";
                tbx_Password.Text = "";
                lbl_Status.Text = "UserName can not be found,please try again";
            }
            else
            {
                User u = ctx.Users.Where(x => x.UserName == tbx_UserName.Text).First();
                Session["sign"] = u.UserName;
                encryption enc = new encryption();
                if (u.Password != enc.Encryption(tbx_Password.Text))
                {
                    tbx_UserName.Text = "";
                    tbx_Password.Text = "";
                    lbl_Status.Text = "Password is not correct,please try again";

                }
                else
                {
                    if (u.Password == enc.Encryption(tbx_Password.Text) && u.Role == "DeptHead")
                    { Response.Redirect("DepartmentPage/HomePageHead.aspx"); }

                    else if (u.Password == enc.Encryption(tbx_Password.Text.ToString()) && (u.Role == "DeptEmp"||u.Role== "DeptRepre"))
                    { Response.Redirect("DepartmentPage/HomePageEmployee.aspx"); }

                    else if (u.Password == enc.Encryption(tbx_Password.Text) && u.Role == "StoreClerk")
                    {
                        //Label1.Text = "cleckhomepage";
                        Response.Redirect("StorePage/ClerkHomePage.aspx");
                    }

                    else if (u.Password == enc.Encryption(tbx_Password.Text) && u.Role == "StoreSuper")
                    { Response.Redirect("StorePage/SupervisorHomePage.aspx"); }

                    else if (u.Password == enc.Encryption(tbx_Password.Text) && u.Role == "StoreManager")
                    { Response.Redirect("StorePage/ManagerHomePage.aspx"); }

                    else if (u.Password == enc.Encryption(tbx_Password.Text) && u.Role == "DeptDelegate")
                    { Response.Redirect("DepartmentPage/HomePageDelegate.aspx"); }
                }
            }
        }
        protected void btn_RecoverPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("RecoverPassword.aspx");
        }

       
        protected void NotifyUserError(string msg, string type)
        {
            Page.ClientScript.RegisterStartupScript
                (this.GetType(),
                "toastr_message",
                "toastr.error('" + msg + "', '" + type + "')", true);
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("RecoverPassword.aspx");
        }
    }
}