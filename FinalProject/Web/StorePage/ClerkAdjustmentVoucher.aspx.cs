using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//SHENYUSHI     EMAIL:GUOXIAOCHUAN
namespace AD.Store
{
    public partial class ClerkAdjustmentVoucher : System.Web.UI.Page
    {
        Model1 ctx = new Model1();
        int AVnum;
        protected void Page_Load(object sender, EventArgs e)
        {
             
            if (!IsPostBack)
            {
                RadioButton1.Checked = true;
                RadioButton2.Checked = false;
                RadioButton3.Checked = false;
                AVNO();
            }
            if (Session["sign"].ToString() == "")
                Response.Redirect("~/LoginNew.aspx");
            Boolean results = empauthentication.ClerkAuthentication(Session["sign"].ToString());
            if (results == false)
                Response.Redirect("~/LoginNew.aspx");
            Button2.Enabled = false;
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {


            string cate = DropDownList1.SelectedValue;
            string des = DropDownList2.SelectedValue;
            string supplierCode;
            double price;
            string itemCode;
            Button2.Enabled = true;

            supplierCode = TextBox3.Text;
            try
            {
                supplierCode = TextBox3.Text;
                using (Model1 entities = new Model1())
                {
                    TenderPriceList tp = entities.TenderPriceLists.Where(p => p.SuppCode == supplierCode && p.Description == des).First();
                    price = (double)tp.Price;
                    itemCode = tp.ItemCode;
                   

                }


                int AVnumber = Convert.ToInt32(TextBox4.Text);
                int qty = Int32.Parse(TextBox1.Text);
                string reason = TextBox2.Text;
                string status = "Pending";
                if (qty <0 )
                {
                    Label8.Text = "All number must be positive";
                }
                else
                {
                    AddAdjustmentVoucherDetails(AVnumber, itemCode, des, qty, price, reason, status);

                    BindGrid(AVnumber);
                    Label8.Text = "Add Successful!";
                    Button2.Enabled = true;
                }
            }
            catch (Exception ex)
            {
                Label8.Text = "Please input Valid Quantity and Reason";
            }

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            int AVnumber = Convert.ToInt32(TextBox4.Text);
            DateTime date = DateTime.Now;
            string username = Session["Sign"].ToString();
            User u = ctx.Users.Where(x => x.UserName == username).First();
            int ClerkResponsible = u.UserID;
            AddAdjustmentVoucher(AVnumber, date, ClerkResponsible, username);
            Label8.Text = "Confirm Successful!";
          
        }

     
        private void BindGrid(int AVnum)
        {
            GridView1.DataSource = ListAdjBy(AVnum);
            GridView1.DataBind();
        }

        public static List<AdjustmentVoucherDetail> ListAdjBy(int AVnum)
        {
            using (Model1 entities = new Model1())
            {
                return entities.AdjustmentVoucherDetails.Where(p => p.AVnumber == AVnum).ToList<AdjustmentVoucherDetail>();
            }
        }

        protected void AVNO()
        {

            using (Model1 entities = new Model1())
            {
                try
                {
                    AdjustmentVoucherDetail num = entities.AdjustmentVoucherDetails.OrderByDescending(p => p.AVnumber).First<AdjustmentVoucherDetail>();
                    AVnum = num.AVnumber + 1;
                }
                catch (Exception EX)
                {
                    AVnum = 1;
                }
                TextBox4.Text = AVnum.ToString();
            }
        }

        public static void AddAdjustmentVoucherDetails(int AVnumber, string ItemCode, string Description, int Qty, double Price, string Reason, string status)
        {
            using (Model1 entities = new Model1())
            {
                AdjustmentVoucherDetail AdjustmentVoucherDetail = new AdjustmentVoucherDetail
                {
                    AVnumber = AVnumber,
                    ItemCode = ItemCode,
                    Description = Description,
                    Qty = Qty,
                    Price = Price,
                    Reason = Reason,
                    Status = status
                };
                entities.AdjustmentVoucherDetails.Add(AdjustmentVoucherDetail);
                entities.SaveChanges();
            }
        }
        public void AddAdjustmentVoucher(int AVnumber, DateTime date, int ClekrRes, string CRname)
        {
            try
            {
                using (Model1 entities = new Model1())
                {
                    AdjustmentVoucher AdjVoucher = new AdjustmentVoucher
                    {
                        AVnumber = AVnumber,
                        Date = date,
                        ClerkResponsible = ClekrRes,
                        CRName = CRname
                    };
                    entities.AdjustmentVouchers.Add(AdjVoucher);
                    entities.SaveChanges();
                }
            }
            catch(Exception ex)
            {

                Label8.Text = "Some Items already been issued in AdjustmentVoucher";
            }
        }
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadioButton1.Checked = true;
            RadioButton2.Checked = false;
            RadioButton3.Checked = false;
            using (Model1 entities = new Model1())
            {
                string des = DropDownList2.SelectedValue;
                Stock s = entities.Stocks.Where(p => p.Description == des).First();
                TextBox3.Text = s.FirstSupp;

            }
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            if (RadioButton2.Checked == true)
            {

                RadioButton1.Checked = false;
                RadioButton3.Checked = false;
                using (Model1 entities = new Model1())
                {
                    string des = DropDownList2.SelectedValue;
                    Stock s = entities.Stocks.Where(p => p.Description == des).First();
                    TextBox3.Text = s.SecondSupp;
                }

            }
        }

        protected void RadioButton3_CheckedChanged(object sender, EventArgs e)
        {
            if (RadioButton3.Checked == true)
            {

                RadioButton2.Checked = false;
                RadioButton1.Checked = false;
                using (Model1 entities = new Model1())
                {
                    string des = DropDownList2.SelectedValue;
                    Stock s = entities.Stocks.Where(p => p.Description == des).First();
                    TextBox3.Text = s.ThirdSupp;
                }
            }
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (RadioButton1.Checked == true)
            {

                RadioButton2.Checked = false;
                RadioButton3.Checked = false;
                using (Model1 entities = new Model1())
                {
                    string des = DropDownList2.SelectedValue;
                    Stock s = entities.Stocks.Where(p => p.Description == des).First();
                    TextBox3.Text = s.FirstSupp;

                }

            }
        }

      
            
        protected void Button_InfoSup_Click(object sender, EventArgs e)
        {
            Model1 ctx = new Model1();
            List<AdjustmentVoucherDetail> list = new List<AdjustmentVoucherDetail>();
            list = ctx.AdjustmentVoucherDetails.Where(x => x.Price < 250.0 && x.Status == "Pending").ToList();
            Session["Title"] = "New AdjustmentVoucher processing Request ";
            Session["content"] = Session["sign"].ToString() + " inform you that you have " + list.Count().ToString() + " AdjustmentVoucher processing request,please process as soon as possible";
            string a = Session["sign"].ToString();
            User c = ctx.Users.Where(x => x.UserName == a).First();
            string Sender = c.Email;
            User Supervisor = ctx.Users.Where(x => x.Role == "StoreSuper").First();
            string[] receive = new string[] { Supervisor.Email.ToString() };
            string Password = "Se123458!";
            Label8.Text = SendEmail.sendEmail(Sender, Password, Session["Title"].ToString(), Session["content"].ToString(), receive);
            Session["Title"] = "";
            Session["content"] = "";

        }

        protected void btn_InfoManager_Click1(object sender, EventArgs e)
		{
            Model1 ctx = new Model1();
            List<AdjustmentVoucherDetail> list = new List<AdjustmentVoucherDetail>();
            list = ctx.AdjustmentVoucherDetails.Where(x => x.Price >= 250.0 && x.Status == "Pending").ToList();
            Session["Title"] = "New AdjustmentVoucher processing Request ";
            Session["content"] = Session["sign"].ToString() + " inform you that you have " + list.Count().ToString() + " AdjustmentVoucher processing request,please process as soon as possible";
            string a = Session["sign"].ToString();
            User c = ctx.Users.Where(x => x.UserName == a).First();
            string Sender = c.Email;
            User manager = ctx.Users.Where(x => x.Role == "StoreManager").First();
            string[] receive = new string[] { manager.Email.ToString() };
            string Password = "Se123458!";
            Label8.Text = SendEmail.sendEmail(Sender, Password, Session["Title"].ToString(), Session["content"].ToString(), receive);
            Session["Title"] = "";
            Session["content"] = "";

        }

    }
	}