using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace AD
{
     class SendEmail 
    {

        public static string sendEmail(string to, string password, string subject, string body, string[] receiver)
        {
            for (int i = 0; i < receiver.Length; i++)
            {
                //string[] ReceiverAddress = new string[receiver.Length];
                //ReceiverAddress[i] = receiver[i];
                if (receiver[i] != "")
                {

                    try
                    {
                        MailMessage message = new MailMessage(to, receiver[i], subject, body);
                        message.IsBodyHtml = true;
                        message.BodyEncoding = System.Text.Encoding.UTF8;
                        SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                        client.EnableSsl = true;
                        client.Credentials = new System.Net.NetworkCredential(to, password);
                        client.Send(message);
                        message.Attachments.Dispose();
                        SendEmail.EmailNum(receiver[i]);

                    }
                    catch (Exception ex)
                    {
                        return "password is not correct";// "One or more email address is wrong!" /;

                    }
                }

            }

            return "Mail to All receivers was sent successfully!";

        }


        public static void EmailNum(string emailaddress)
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
