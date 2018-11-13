using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//YANGXU
namespace AD.Store
{
    public partial class PurchaseOrder_CustomerOrder : System.Web.UI.Page
    {
        Model1 ctx = new Model1();
        int POnum ;

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                load();
                RePoNo();
                try
                {
                    POnum = Convert.ToInt32(TextBox5.Text);
                    BindGrid(POnum);
                }
                catch (Exception ex)
                {
                }

            }
            if (Session["sign"].ToString() == "")
                Response.Redirect("~/LoginNew.aspx");
            Boolean results = empauthentication.ClerkAuthentication(Session["sign"].ToString());
            if (results == false)
                Response.Redirect("~/LoginNew.aspx");
            
        }
        //Load
        protected void load()
        {
            RadioButton1.Checked = true;
            RadioButton2.Checked = false;
            RadioButton3.Checked = false;
            RadioButton1.Text = "FirstSupp";
            RadioButton2.Text = "SecondSupp";
            RadioButton3.Text = "ThirdSupp";
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
        }
        //Gridview
        private void BindGrid(int POnum)
        {
            GridView1.DataSource = StoreBusinessLogic.ListPoBy(POnum);
            GridView1.DataBind();
        }
        //DDL Category
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            load();
            string category = DropDownList1.SelectedValue;
            

        }
        //DDL Description
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string description = DropDownList2.SelectedValue;
            Stock s = ctx.Stocks.Where(x => x.Description == description).First();
            //ItemCode
            TextBox1.Text = s.ItemCode;
            //Qty
            int rl = s.ReorderLevel.Value;
            int cq = s.CurrentQty.Value;
            int rq = s.ReorderedQty.Value;
            int qty;
            if (cq < rl)
            {
                qty = ((rl - cq) / rq + 1) * rq;
                TextBox2.Text = qty.ToString();
            }
            else
            {
                TextBox2.Text = "Stock enough";
            }
            //Supplier
            RadioButton1.Checked = true;
            RadioButton2.Checked = false;
            RadioButton3.Checked = false;
            RadioButton1.Text = "FirstSupp:" + s.FirstSupp;
            RadioButton2.Text = "SecondSupp:" + s.SecondSupp;
            RadioButton3.Text = "ThirdSupp:" + s.ThirdSupp;
            Label8.Text = s.FirstSupp;
            //Price
            try
            {
                string item = TextBox1.Text;
                TenderPriceList p = ctx.TenderPriceLists.Where(x => x.ItemCode == item && x.SuppCode == s.FirstSupp).First();
                TextBox3.Text = p.Price.ToString();
            }
            catch (Exception ex)
            {

            }
            //TotalPrice
            TotalPrice();
        }
        //RePO number
        protected void RePoNo()
        {

            using (Model1 entities = new Model1())
            {
                try
                {
                    PurchaseOrder num = entities.PurchaseOrders.OrderByDescending(p => p.POnumber).First<PurchaseOrder>();
                    POnum = num.POnumber + 1;
                }
                catch (Exception EX)
                {
                    POnum = 1;
                }
                TextBox5.Text = POnum.ToString();
            }
        }

        //RadioButton group
        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            string description = DropDownList2.SelectedValue;
            Stock s = ctx.Stocks.Where(x => x.Description == description).First();

            if (RadioButton1.Checked == true)
            {
                Label8.Text = s.FirstSupp;
                RadioButton2.Checked = false;
                RadioButton3.Checked = false;

                try
                {
                    string item = TextBox1.Text;
                    TenderPriceList p = ctx.TenderPriceLists.Where(x => x.ItemCode == item && x.SuppCode == s.FirstSupp).First();
                    TextBox3.Text = p.Price.ToString();
                }
                catch (Exception ex)
                {
                    TextBox3.Text = ex.ToString();
                }
                TotalPrice();
            }

        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            string description = DropDownList2.SelectedValue;
            Stock s = ctx.Stocks.Where(x => x.Description == description).First();
            if (RadioButton2.Checked == true)
            {
                Label8.Text = s.SecondSupp;
                RadioButton1.Checked = false;
                RadioButton3.Checked = false;
                try
                {
                    string item = TextBox1.Text;
                    TenderPriceList p = ctx.TenderPriceLists.Where(x => x.ItemCode == item && x.SuppCode == s.SecondSupp).First();
                    TextBox3.Text = p.Price.ToString();
                }
                catch (Exception ex)
                {
                    TextBox3.Text = ex.ToString();
                }
                TotalPrice();
            }
        }

        protected void RadioButton3_CheckedChanged(object sender, EventArgs e)
        {
            string description = DropDownList2.SelectedValue;
            Stock s = ctx.Stocks.Where(x => x.Description == description).First();
            if (RadioButton3.Checked == true)
            {
                Label8.Text = s.ThirdSupp;
                RadioButton1.Checked = false;
                RadioButton2.Checked = false;
                try
                {

                    string item = TextBox1.Text;
                    TenderPriceList p = ctx.TenderPriceLists.Where(x => x.ItemCode == item && x.SuppCode == s.ThirdSupp).First();
                    TextBox3.Text = p.Price.ToString();
                }
                catch (Exception ex)
                {
                    TextBox3.Text = ex.ToString();
                }
                TotalPrice();
            }


        }


        //Add
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                int POnum = Int32.Parse(TextBox5.Text);
                string ItemCode = TextBox1.Text;
                string desp = DropDownList2.SelectedValue.ToString();
                int qty = Int32.Parse(TextBox2.Text);
                double price = double.Parse(TextBox3.Text);
                string suppCode;

                if(GridView1.Rows.Count <=0)
                {
                    suppCode = Label8.Text;
                    StoreBusinessLogic.AddPO(POnum, ItemCode, desp, qty, price, suppCode);
                    BindGrid(POnum);
                }
                else
                {
                    PurchaseOrder po = ctx.PurchaseOrders.Where(p => p.POnumber == POnum).First();
                    if(Label8.Text.ToString()==po.SuppCode)
                    {
                        suppCode = Label8.Text;
                        StoreBusinessLogic.AddPO(POnum, ItemCode, desp, qty, price, suppCode);
                        BindGrid(POnum);
                    }
                    else
                    {
                        Label7.Text = "Please add same supplier to one purchaseOrder";
                    }
                }
                    
            }
            catch (Exception ex)
            {
                Label7.Text = "Please Input Valid Quantity";
            }
        }
        //Place Order  Email???
        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["Title"] = "Purchase Order Request  ";
            Session["content"] = Session["sign"].ToString() + " inform you that the Purchase Order is in Attacgment,Please provide the goods as soon as possible.";
            Page.ClientScript.RegisterStartupScript(
            this.GetType(), "OpenWindow", "window.open('http://localhost:58425/Email.aspx','_newtab');", true);
        }
        //Search
        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                int POnum = Int32.Parse(TextBox5.Text);
                BindGrid(POnum);
            }
            catch (Exception ex) {
                Label9.Text = "Please insert validate PO number";

            }
        }


        //Delete
        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            POnum = Convert.ToInt32(TextBox5.Text);
            string itemCode = GridView1.DataKeys[e.RowIndex].Values[0].ToString();
            StoreBusinessLogic.DeleteItem(POnum, itemCode);
            BindGrid(POnum);
        }

        //TotalPrice
        protected void TotalPrice()
        {
            try
            {
                double price = Convert.ToDouble(TextBox3.Text);
                double tp = Convert.ToDouble(TextBox2.Text) * price;
                TextBox4.Text = tp.ToString();
            }
            catch (Exception ex)
            {
                TextBox4.Text = "";
            }
        }

        //Quantity
        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            TotalPrice();
        }
    }
}