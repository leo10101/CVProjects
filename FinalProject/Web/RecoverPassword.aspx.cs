using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
//GUOXIAOCHUAN
namespace AD
{
    public partial class RecoverPassword : System.Web.UI.Page
    {
        static int code = 0;
        bool isFound = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            tbx_Password.Enabled = false;
            tbx_Confirm.Enabled = false;
            btn_Submit.Enabled = false;
            Verify.Enabled = false;
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            Model1 ctx = new Model1();
            int count = ctx.Users.Count();
            User[] users = new User[count];
            users = ctx.Users.ToArray();
            User u = ctx.Users.Where(x => x.Email == tbx_Email.Text).First();
            encryption enc = new encryption();
            string newpassword = enc.Encryption(tbx_Password.Text.ToString());
            u.Password = newpassword;
            ctx.SaveChanges();
            lbl_Status.Text = "Reset Successful!";
            tbx_Password.Enabled = false;
            tbx_Confirm.Enabled = false;
            tbx_Email.Enabled = true;
            tbx_UserName.Enabled = true;
            tbx_Verification.Enabled = true;




        }



        protected void btn_GoToLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LoginNew.aspx");
        }


        protected void Verification_Click(object sender, EventArgs e)
        {
            try
            {
                Model1 ctx = new Model1();
                int count = ctx.Users.Count();
                User[] users = new User[count];
                users = ctx.Users.ToArray();
                for (int i = 0; i < count; i++)
                {
                    if (tbx_Email.Text == users[i].Email && tbx_UserName.Text == users[i].UserName)
                    {
                        Random Rdm = new Random();
                        int iRdm = Rdm.Next(0000, 99999);
                        code = iRdm;
                        MailMessage message = new MailMessage("logicuniversityofficial@gmail.com", tbx_Email.Text, "Verification code", iRdm.ToString());
                        message.IsBodyHtml = true;
                        message.BodyEncoding = System.Text.Encoding.UTF8;
                        SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                        client.EnableSsl = true;
                        client.Credentials = new System.Net.NetworkCredential("logicuniversityofficial@gmail.com", "logicuniversity1");
                        client.Send(message);
                        lbl_Inform.Text = "Send Verification Code successfully";
                        isFound = true;
                        Verify.Enabled = true;
                    }
                }
                if (isFound == false)
                {
                    for (int i = 0; i < count; i++)
                    {
                        if (tbx_UserName.Text == users[i].UserName)
                        {
                            lbl_Status.Text = "The Username and Email Address do not match, please try again";
                            isFound = true;
                        }
                    }
                    if (isFound == false)
                        lbl_Status.Text = "Can not found UserName,please try again";
                }
            }
            catch (Exception ex)
            {
                lbl_Inform.Text = ex.ToString();

            }

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            tbx_Email.Text = "";
            tbx_Password.Text = "";
            tbx_Confirm.Text = "";
            tbx_UserName.Text = "";
            tbx_Verification.Text = "";
            Response.Redirect("~/RecoverPassword.aspx");
        }

        protected void Verify_Click(object sender, EventArgs e)
        {
            try
            {
                if (code == Convert.ToInt32(tbx_Verification.Text))
                {
                    lbl_Inform.Text = "Verify Successfully";
                    tbx_Password.Enabled = true;
                    tbx_Confirm.Enabled = true;
                    tbx_Email.Enabled = false;
                    tbx_UserName.Enabled = false;
                    tbx_Verification.Enabled = false;
                    btn_Submit.Enabled = true;

                }
                else
                    lbl_Inform.Text = "Verify failed,please try again";
            }
            catch (Exception ex)
            {
                lbl_Inform.Text = "Please input Valid number";
                Verify.Enabled = true;
            }
        }



    }
}