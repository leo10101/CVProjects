using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

//ZHAOYINQING /YANGXU    EMAIL:GUOXIAOCHUAN
namespace AD
{
    public partial class ShowRequestDetails : System.Web.UI.Page
    {
        int requestid; string id;
        Model1 ctx = new Model1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["sign"].ToString() == "")
                Response.Redirect("~/LoginNew.aspx");
            Boolean results = empauthentication.HeadandrepAuthentication(Session["sign"].ToString());
            if (results == false)
                Response.Redirect("~/LoginNew.aspx");
            id = Session["requestid"].ToString();
            requestid = Convert.ToInt32(id);
            RequestDetail rd = ctx.RequestDetails.Where(x => x.RequestID == requestid).First();
            Request r = ctx.Requests.Where(x => x.RequestID == requestid).First();
            lab_reqID.Text = rd.RequestID.ToString();
            lab_empName.Text = r.UserName;
            GridView1.DataSource = DepartmentBusinessLogic.GetRequestDetailsByID(requestid);
            GridView1.DataBind();
          
        }

        protected void rej_Click(object sender, EventArgs e)
        {
            Request r = ctx.Requests.Where(x => x.RequestID == requestid).First();
            int requestID = r.RequestID;
            string status = "reject";
            string comments = txb_comments.Text;
            DepartmentBusinessLogic.ChangeRequestAsReject(requestID, status, comments);
            Lab_reject.Text = "successful";
            Session["Title"] = "Request reject Notification";
            if (txb_comments.Text.ToString() == "" || txb_comments.Text.ToString() == null)
                Session["content"] = Session["sign"].ToString() + " has reject your request which ID is" + requestid.ToString();
            else
                Session["content"] = Session["sign"].ToString() + " has reject your request which ID is" + requestid.ToString() + ",comment is" + txb_comments.Text.ToString();
            string a = Session["sign"].ToString();
            User c = ctx.Users.Where(x => x.UserName == a).First();
            string Sender = c.Email;
            User d = ctx.Users.Where(x => x.UserName == r.UserName).First();
            string[] receive = new string[] { d.Email.ToString() };
            string Password = "De123456!";
            Label1.Text = SendEmail.sendEmail(Sender, Password, Session["Title"].ToString(), Session["content"].ToString(), receive);
            Session["Title"] = "";
            Session["content"] = "";

        }

        protected void app_Click(object sender, EventArgs e)
        {
            Request r = ctx.Requests.Where(x => x.RequestID == requestid).First();
            int requestID = r.RequestID;
            string status = "approve";
            string comments = txb_comments.Text;
            DepartmentBusinessLogic.ChangeRequestAsReject(requestID, status, comments);
            Lab_approve.Text = "successful";
            Session["Title"] = "Request application Notification";
            Session["content"] = "Requester's Department:" + r.DeptName.ToString() + "\n";
            Session["content"] = Session["content"].ToString() + "ItemCode" + "\t" + "Description" + "\t" + "RequestQty" + "\n";
            List<RequestDetail> list = new List<RequestDetail>();
            list = DepartmentBusinessLogic.GetRequestDetailsByID(Convert.ToInt32(id));
            foreach (RequestDetail red in list)
            {
                Session["content"] = Session["content"].ToString() + red.ItemCode.ToString() + "\t\t" + red.Description.ToString() + "\t" + red.RequestQty.ToString() + "\n";
            }
            string a = Session["sign"].ToString();
            User c = ctx.Users.Where(x => x.UserName == a).First();
            string Sender = c.Email;
            User d = ctx.Users.Where(x => x.UserName == r.UserName).First();
            string[] receive = new string[] { "lustoreclerk@gmail.com" };
            string Password = "De123456!";
            Label1.Text = SendEmail.sendEmail(Sender, Password, Session["Title"].ToString(), Session["content"].ToString(), receive);
            Session["Title"] = "";
            Session["content"] = "";

            Session["Title"] = "Request approve Notification";
            if (txb_comments.Text.ToString() == "" || txb_comments.Text.ToString() == null)
                Session["content"] = Session["sign"].ToString() + " has reject your request which ID is" + requestid.ToString();
            else
                Session["content"] = Session["sign"].ToString() + " has reject your request which ID is" + requestid.ToString() + ",comment is" + txb_comments.Text.ToString();
            User g = ctx.Users.Where(x => x.UserName == r.UserName).First();
            string[] receive1 = new string[] { g.Email.ToString() };
            Label1.Text = SendEmail.sendEmail(Sender, Password, Session["Title"].ToString(), Session["content"].ToString(), receive1);
            Session["Title"] = "";
            Session["content"] = "";
        }
    }
}