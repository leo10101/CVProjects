using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//ZHAOYINQING    EMAIL:GUOXIAOCHUAN
namespace AD
{
    public partial class ChangeCollectionPoint : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Lab_session.Text = Session["sign"].ToString();
            if(Session["sign"].ToString() == "")
            Response.Redirect("~/LoginNew.aspx"); 
            Boolean results = empauthentication.repAuthentication(Session["sign"].ToString());
            if (results == false)
                Response.Redirect("~/LoginNew.aspx");
            Model1 ctx = new Model1();
            int ucount = ctx.Users.Count();
            int count = ctx.Departments.Count();
            User[] users = new User[ucount];
            User u = ctx.Users.Where(x => x.UserName == Lab_session.Text).First();
            lab_dept.Text = u.DeptName.ToString();
            Department[] dept = new Department[count];
            //dept = ctx.Departments.ToArray();                 
            txb_Bcollection.Text = lab_dept.Text;
            btn_Send.Enabled = false;
        }
        
        protected void cpcurrent_TextChanged(object sender, EventArgs e)
        {

        }

        protected void changecc_Click(object sender, EventArgs e)
        {
            Model1 ctx = new Model1();
            Department d = ctx.Departments.Where(x => x.DeptName == lab_dept.Text).First();
            string deptCode = d.DeptCode;
            if(radio1.Checked==true)
            {
                DepartmentBusinessLogic.ChangeCollectionPoint(deptCode, lab_dept.Text, radio1.Text);
                Lab_successful.Text = "successful";
            }
            else if(radio2.Checked==true)
            {
                DepartmentBusinessLogic.ChangeCollectionPoint(deptCode, lab_dept.Text, radio2.Text);
                Lab_successful.Text = "successful";
            }
            else if(radio3.Checked==true)
            {
                DepartmentBusinessLogic.ChangeCollectionPoint(deptCode, lab_dept.Text, radio3.Text);
                Lab_successful.Text = "successful";
            }
            else if(radio4.Checked==true)
            {
                DepartmentBusinessLogic.ChangeCollectionPoint(deptCode, lab_dept.Text, radio4.Text);
                Lab_successful.Text = "successful";
            }
            else if(radio5.Checked==true)
            {
                DepartmentBusinessLogic.ChangeCollectionPoint(deptCode, lab_dept.Text, radio5.Text);
                Lab_successful.Text = "successful";
            }
            else if(radio6.Checked==true)
            {
                DepartmentBusinessLogic.ChangeCollectionPoint(deptCode, lab_dept.Text, radio6.Text);
                Lab_successful.Text = "successful";
            }
            btn_Send.Enabled = true;
        }

        protected void btn_Send_Click(object sender, EventArgs e)
        {
            Model1 ctx = new Model1();
            Department d = ctx.Departments.Where(x => x.DeptName == lab_dept.Text).First();
            string CollectionPoint = d.CollectionPoint;
            string a = Session["sign"].ToString();
            User c = ctx.Users.Where(x => x.UserName == a).First();
            string Sender = c.Email;
            List<User> receiver = ctx.Users.Where(x => x.Role == "StoreClerk").ToList();
            string[] receive = new string[receiver.Count()];
            for (int i = 0; i < receiver.Count(); i++)
            {
                receive[i] = receiver[i].Email.ToString();

            }
            string Password = "De123457!";
            Session["Title"] = "CollectionPoint change Notification";
            Session["content"] = Session["sign"].ToString() + ", who is from " + lab_dept.Text + " has changed the CollectionPoint, the new CollectionPoint is " + CollectionPoint + " .";
            lab_dept.Text = SendEmail.sendEmail(Sender, Password, Session["Title"].ToString(), Session["content"].ToString(), receive);
            Session["Title"] = "";
            Session["content"] = "";
            Lab_successful.Text = "Email sent successful";
        }
    }
}