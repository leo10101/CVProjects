using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net.Mail;
using System.Net;
//GUOXIAOCHUN
namespace AD
{
    public partial class Email : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {   
            if (Session["sign"].ToString() == "")
                Response.Redirect("~/LoginNew.aspx");
                Send.Enabled = true;
                Model1 ctx = new Model1();
                string a= Session["sign"].ToString();
                List<User> users = DepartmentBusinessLogic.ListUserByName(a);
                int count = ctx.Users.Count();
                User[] user = new User[count];
                user = ctx.Users.ToArray();
                User u = ctx.Users.Where(x => x.UserName == a).First();
                to.Text = u.Email;
                subject.Text = (string)Session["Title"];
                body.Text = (string)Session["content"];
                Session["Count"] = 0;
           
           
            System.DateTime currentTime = new System.DateTime();
            currentTime = System.DateTime.Now;
            int year = currentTime.Year;
            int month = currentTime.Month;
            int day = currentTime.Day;
            int hour = currentTime.Hour;
            int minute = currentTime.Minute;
            if (year == 2018 && month == 7 && day == 19 && hour == 23 && minute == 51)
            {
                autoEmailInfo();
            }

        }
        
        protected void send_Click(object sender, EventArgs e)
        {
            string[] email = new string[]
           {
               DropDownList1.SelectedItem.ToString(),
               DropDownList2.SelectedItem.ToString(),
               DropDownList3.SelectedItem.ToString(),
               DropDownList4.SelectedItem.ToString(),
               DropDownList5.SelectedItem.ToString(),
               DropDownList6.SelectedItem.ToString(),
               DropDownList7.SelectedItem.ToString(),
               DropDownList8.SelectedItem.ToString()
           };
           for(int i=0;i<=7;i++)
            {
                if (email[i] != "" && email[i] != "Please Select")
                {
                    Session["Count"] = 1;
                    break;
                }

            }
            if (Convert.ToInt32(Session["Count"]) == 1)
            {
                status.Text = sendEmail(to.Text, subject.Text, body.Text, email);
                subject.Text = "";
                body.Text = "";
                Session["Title"] = "";
                Session["content"] = "";
            }
            else
            {
                subject.Text = "";
                body.Text = "";
                Session["Title"] = "";
                Session["content"] = "";
                status.Text = "Please Select receiver";
            }
        }

        protected void UnProcessing_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UnReadEmailNum.aspx");
        }


        public string sendEmail(string to, string subject, string body, string[] receiver)
        {
            FileUpload[] fileUpload = new FileUpload[] { FileUpload1, FileUpload2, FileUpload3, FileUpload4 };
            string[] ReceiverAddress = new string[receiver.Length];
            for (int i = 0; i <= 7; i++)
            {
                ReceiverAddress[i] = receiver[i];
                if (ReceiverAddress[i] != "" && ReceiverAddress[i] != "Please Select")
                {
                    EmailNum(ReceiverAddress[i]);
                    try
                    {
                        MailMessage message = new MailMessage(to, ReceiverAddress[i], subject, body);

                        for (int j = 0; j < fileUpload.Length; j++)
                        {
                            if (fileUpload[j].HasFile)
                            {
                                string FileName = Path.GetFileName(fileUpload[j].PostedFile.FileName);
                                message.Attachments.Add(new Attachment(fileUpload[j].PostedFile.InputStream, FileName));

                            }

                        }

                        message.IsBodyHtml = true;
                        message.BodyEncoding = System.Text.Encoding.UTF8;
                        SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                        client.EnableSsl = true;
                        client.Credentials = new System.Net.NetworkCredential(to, Txt_password.Text);
                        client.Send(message);

                    }
                    catch (Exception ex)
                    {
                        return "password is not correct";/*"One or more email address is wrong!"*/;

                    }
                }
                //message.Attachments.Dispose();
            }

            return "Mail to All receivers was sent successfully!";

        }
        public void autoEmailInfo()
        {

            status.Text = Session["inform"].ToString();

        }

        public void EmailNum(string emailaddress)
        {

            using (Model1 entities = new Model1())
            {
                User user = entities.Users.Where(p => p.Email == emailaddress).First<User>();
                user.EmailNum += 1;
                entities.SaveChanges();
            }

        }

      
    }
}