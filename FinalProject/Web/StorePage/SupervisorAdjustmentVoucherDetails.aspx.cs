using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Jerome / ZHAOYINQING /SHENYUSHI    EMAIL:GUOXIAOCHUAN
namespace AD.Store
{
    public partial class SupervisorAdjustmentVoucherDetails : System.Web.UI.Page
    {
       
        List<string> list = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["sign"].ToString() == "")
                Response.Redirect("~/LoginNew.aspx");
            Boolean results = empauthentication.SupAuthentication(Session["sign"].ToString());
            if (results == false)
                Response.Redirect("~/LoginNew.aspx");
            btn_Notification.Enabled = false;
            int id = (int)Session["id"];
            GridView1.DataSource = StoreBusinessLogic.GetAdjustbYidSuper(id);
            GridView1.DataBind();
            for (int i= 0;i<GridView1.Rows.Count-1;i++)
            {   if(GridView1.Rows[i].Cells[7].ToString()=="NULL"|| GridView1.Rows[i].Cells[7].ToString() == "")
                    btn_Notification.Enabled = true;
                break;
            }
           
           
        }

        protected void lab_approve_Click(object sender, EventArgs e)
        {
            Response.Redirect("SupervisorAdjustmentVoucher.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Model1 ctx = new Model1();
            int avnumber = int.Parse(GridView1.SelectedRow.Cells[1].Text);
            string itemcode = GridView1.SelectedRow.Cells[2].Text;
            StoreBusinessLogic.EditAdjust(avnumber, itemcode, "Approved");
            lab_successful.Text = "Change Successful";
            AdjustmentVoucher A = ctx.AdjustmentVouchers.Where(x => x.AVnumber == avnumber).First();
            A.ABName = Session["sign"].ToString();
            User u= ctx.Users.Where(x => x.UserName == A.ABName).First();
            A.ApproveBy = u.UserID;
            ctx.SaveChanges();
            btn_Notification.Enabled = true;
            Session["CRName"] = A.CRName;
            Session["content"] = Session["content"].ToString() +itemcode.ToString() + ",";


        }

        protected void btn_Notification_Click(object sender, EventArgs e)
        {
            Session["Title"] = "AdjustmentVoucher request process result";
            Session["content"] = "ItemCode " + Session["content"].ToString() + "\n which submit by" + Session["CRName"].ToString() + " have been approved";
            Model1 ctx = new Model1();
            string a = Session["sign"].ToString();
            User c = ctx.Users.Where(x => x.UserName == a).First();
            string Sender = c.Email;
            string b = Session["CRName"].ToString();
            User d = ctx.Users.Where(x => x.UserName == b).First();
            string[] receive = new string[] { d.Email.ToString() };
            string Password = "Se123457!";
            lab_successful.Text = SendEmail.sendEmail(Sender, Password, Session["Title"].ToString(), Session["content"].ToString(), receive);
            Session["Title"] = "";
            Session["content"] = "";

        }
    }
}