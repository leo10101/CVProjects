using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


//ZHAOYINQING /Jerome     EMAIL:GUOXIAOCHUAN
namespace AD
{
    public partial class DelegateAuthority : System.Web.UI.Page
    {
        string username;
        string dept="";
        Model1 ctx = new Model1();
        string deptname;
        string delegatename;
        int id;
        int deleid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["sign"].ToString() == "")
                Response.Redirect("~/LoginNew.aspx");
            Boolean results = empauthentication.HeadAuthentication(Session["sign"].ToString());
            if (results == false)
                Response.Redirect("~/LoginNew.aspx");

            username = Session["sign"].ToString();
            User user = ctx.Users.Where(x => x.UserName == username).First();
            dept = user.DeptName;
            Session["dept"] = dept;
            revoke.Enabled = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                User delegatenames = ctx.Users.Where(x => x.DeptName == dept && x.Role == "DeptDelegate").First();
                delegatename = delegatenames.UserName;
                id = delegatenames.UserID;
                Session["id"] = id;
                emp.Text = delegatename;
                Delegate d = ctx.Delegates.Where(x => x.UserName == delegatename).First();
                string date = d.EndDate.ToString();
                Time.Text = date;
                revoke.Enabled = true;
            }
            catch
            {
                Lab_successful.Text = "This department doesn't have Delegate now";

            }
        }

        protected void delegate_Click(object sender, EventArgs e)
        {
            Model1 ctx = new Model1();
            DateTime startDate = Calendar2.SelectedDate;
            DateTime endDate = Calendar3.SelectedDate;
            string employeename = DropDownList1.SelectedValue;
            User d = ctx.Users.Where(x => x.UserName == employeename).First(); ;
            id = d.UserID;
            string deptcode = d.DeptCode;
            if (deptcode == "ENGL")
            {
                deleid = 1;
            }
            else if (deptcode == "CPSC")
            {
                deleid = 2;
            }
            else if (deptcode == "COMM")
            {
                deleid = 3;
            }
            else if (deptcode == "REGR")
            {
                deleid = 4;
            }
            else if (deptcode == "ZOOL")
            {
                deleid = 5;
            }
            revoke.Enabled = true;
            DepartmentBusinessLogic.ChangeDelegate(id, employeename, "DeptDelegate");
            DepartmentBusinessLogic.changeDelegatefromdelegate(deleid, id, employeename, startDate, endDate);
            Lab_successful.Text = "successful";
            Session["Title"] = " DelegateAuthority Notification";
            Session["content"] = Session["sign"].ToString() + " has gaved you DelegateAuthority";
            string a = Session["sign"].ToString();
            User c = ctx.Users.Where(x => x.UserName == a).First();
            string Sender = c.Email;
            string[] receive = new string[] { d.Email.ToString() };
            string Password = "De123456!";
            Label1.Text = SendEmail.sendEmail(Sender, Password, Session["Title"].ToString(), Session["content"].ToString(), receive);
            Session["Title"] = "";
            Session["content"] = "";
        }

        protected void revoke_Click(object sender, EventArgs e)
        {
            try
            {
                int id = (int)Session["id"];
                DepartmentBusinessLogic.ChangeDelegate(id, delegatename, "DeptEmp");
                string a = Session["sign"].ToString();
                Session["Title"] = "Revoke Delegate Notification";
                Session["content"] = Session["sign"].ToString() + " has revoked your DelegateAuthority";
                User c = ctx.Users.Where(x => x.UserName == a).First();
                string Sender = c.Email;
                User d = ctx.Users.Where(x => x.UserName == delegatename).First();
                string[] receive = new string[] { d.Email };
                string Password = "De123456!";
                Label1.Text = SendEmail.sendEmail(Sender, Password, Session["Title"].ToString(), Session["content"].ToString(), receive);
                Session["Title"] = "";
                Session["content"] = "";
            }
            catch(Exception ex)
            {
                Lab_successful.Text = "This department doesn't have Delegate now";

            }
        }

        protected void emplist_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {

        }

        protected void Calendar3_SelectionChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DropDownList1.DataSource = DepartmentBusinessLogic.ListUserByDeptName(dept);
                
            DropDownList1.DataBind();
        }
    }
}