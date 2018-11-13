using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//ZHAOYINQING    EMAIL:GUOXIAOCHUAN
namespace AD
{
    public partial class ChangeRepresentative : System.Web.UI.Page
    {
        string username;
        string deptcode;
        string changedname;
        int changeid;
       // int beforeid;
        protected void Page_Load(object sender, EventArgs e)
        {

            Session["changedName"] = dr_NewRep.SelectedValue;
           
            if (Session["sign"].ToString() == "")
            Response.Redirect("~/LoginNew.aspx");
            Model1 ctx = new Model1();
            Boolean results = empauthentication.HeadandrepAuthentication(Session["sign"].ToString());
            if (results == false)
            Response.Redirect("~/LoginNew.aspx");

            int ucount = ctx.Users.Count();
            int count = ctx.Departments.Count();
            User[] users = new User[ucount];
            User u = ctx.Users.Where(x => x.Role == "DeptRepre").First();
            emN.Text =u.UserName;
            Session["beforeid"] = u.UserID;
            Session["username"] = emN.Text.ToString();
            Session["userid"] = u.UserID;
            btn_Send.Enabled = false;
            username = Session["username"].ToString();
            User user = ctx.Users.Where(x => x.UserName == username).First();
            deptcode = user.DeptCode;

            dr_NewRep.DataSource = DepartmentBusinessLogic.Listrepresentative(deptcode);
            dr_NewRep.DataBind();
        }

        protected void emN_TextChanged(object sender, EventArgs e)
        {

        }

        protected void change_Click(object sender, EventArgs e)
        {
            Model1 ctx = new Model1();

            //string changednamed = "Tien Lor";

            string changednamed = Session["changedName"].ToString();



           //Session["changedName"] = changednamed;
           //  lab_record.Text = dr_NewRep.SelectedValue;
            User d = ctx.Users.Where(x => x.UserName ==changednamed).First();
            changeid = d.UserID;
            int beforeid =(int) Session["beforeid"];
            string beforename = Session["username"].ToString();
            DepartmentBusinessLogic.ChangeRepresentative(beforeid,beforename,"DeptEmp");
            DepartmentBusinessLogic.ChangeRepresentative(changeid, changednamed , "DeptRepre");
            Lab_successful.Text = "successful";
            btn_Send.Enabled = true;
        }

        protected void btn_Send_Click(object sender, EventArgs e)
        {
            Model1 ctx = new Model1();
            string b = Session["sign"].ToString();
            User c = ctx.Users.Where(x => x.UserName == b).First();
            string Sender = c.Email;
            Session["Title"] = "RepresentativeChange Notification";
            Session["content"] = Session["sign"].ToString() + " has changed you as Representative ";
            string a = Session["changedName"].ToString();
            User r = ctx.Users.Where(x => x.UserName == a).First();
            string[] receiver = new string[] { r.Email };
            string Password = "De123456!";
            Lab_successful.Text = SendEmail.sendEmail(Sender, Password, Session["Title"].ToString(), Session["content"].ToString(), receiver);
            Session["Title"] = "";
            Session["content"] = "";
        }
     
    }
}