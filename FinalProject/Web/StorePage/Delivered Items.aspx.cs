using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//YANGXU     EMAIL:GUOXIAOCHUAN
namespace AD.Store
{
    public partial class Delivered_Items : System.Web.UI.Page
    {
        int DOnum;
        protected void Page_Load(object sender, EventArgs e)
        {
           if(!IsPostBack)
            {
                Label17.Text = "No Order Need to Delivery now";
            }
            
            if (Session["sign"].ToString() == "")
                Response.Redirect("~/LoginNew.aspx");
            Boolean results = empauthentication.ClerkAuthentication(Session["sign"].ToString());
            if (results == false)
                Response.Redirect("~/LoginNew.aspx");
            if(Convert.ToInt32(Session["count"])==2)
                Label17.Text = "Delivery Order Successfully";

        }

        //DO number 
        protected void DoNo()
        {

            using (Model1 entities = new Model1())
            {
                try
                {
                    DeliveryOrder num = entities.DeliveryOrders.OrderByDescending(p => p.DOnumber).First<DeliveryOrder>();
                    DOnum = num.DOnumber + 1;
                }
                catch(Exception ex)
                {
                    DOnum = 1;
                }
            }
            TextBox2.Text = DOnum.ToString();
        }

        private void BindGrid(int POnum)
        {
            GridView1.DataSource =StoreBusinessLogic.ListPoBy(POnum);
            GridView1.DataBind();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            Button2.Visible = true;
            using (Model1 entities = new Model1())
            {
                try
                {
                    int POnum = Convert.ToInt32(TextBox1.Text);
                    BindGrid(POnum);
                    DoNo();
                    PurchaseOrder supplier = entities.PurchaseOrders.Where(p => p.POnumber == POnum).First<PurchaseOrder>();
                    TextBox3.Text = supplier.SuppCode;
                    Button2.Visible = true;
                    Session["count"] = 0;
                    Label17.Text = "";
                }
                catch (Exception EX)
                {
                    TextBox1.Text = "Invalid PO number!";
                }
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
            int DOnum;
            int POnum;
            string ItemCode;
            string desp;
            int POQty;
            int DeliveredQty;
            string suppcode;
            int currentQty;
            int orderedQty;

            try
            {
                if (GridView1.Rows.Count > 0)
                {
                    foreach (GridViewRow row in GridView1.Rows)
                    {
                        DOnum = Convert.ToInt32(TextBox2.Text);
                        POnum = Convert.ToInt32(TextBox1.Text);
                        ItemCode = (row.FindControl("Label8") as Label).Text;
                        desp = (row.FindControl("Label9") as Label).Text;
                        POQty = Convert.ToInt32((row.FindControl("Label11") as Label).Text);
                        DeliveredQty = Convert.ToInt32((row.FindControl("TextBox4") as TextBox).Text);
                        suppcode = TextBox3.Text;

                        if (DeliveredQty > POQty || DeliveredQty < 0)
                        {

                            Session["count"] = 1;
                        }


                    }
                }
                else
                {
                    Label17.Text = "Delivery Order Successfully";
                }



            }
            catch (Exception EX)
            {
                Label17.Text = "Invalid DeliveredQty!";
            }
            if (Convert.ToInt32(Session["count"]) == 1)
            {
                Label17.Text = "Invalid DeliveredQty!";
                Session["count"] = 0;

            }
            else
            {
                try
                {
                    foreach (GridViewRow row in GridView1.Rows)
                    {
                        DOnum = Convert.ToInt32(TextBox2.Text);
                        POnum = Convert.ToInt32(TextBox1.Text);
                        ItemCode = (row.FindControl("Label8") as Label).Text;
                        desp = (row.FindControl("Label9") as Label).Text;
                        POQty = Convert.ToInt32((row.FindControl("Label11") as Label).Text);
                        DeliveredQty = Convert.ToInt32((row.FindControl("TextBox4") as TextBox).Text);
                        suppcode = TextBox3.Text;
                        using (Model1 entities = new Model1())
                        {
                            Stock s = entities.Stocks.Where(p => p.ItemCode == ItemCode).First<Stock>();
                            currentQty = Convert.ToInt32(s.CurrentQty);
                            orderedQty = Convert.ToInt32(s.OrderedQty);
                        }
                        StoreBusinessLogic.AddDO(DOnum, POnum, ItemCode, desp, POQty, DeliveredQty, suppcode);
                        currentQty = currentQty + DeliveredQty;
                        orderedQty = orderedQty - DeliveredQty;
                        StoreBusinessLogic.UpdateStock(ItemCode, currentQty, orderedQty);

                    }
                    Session["count"]= 2;
                    Response.Redirect("Delivered Items.aspx");
                    

                }
                catch (Exception EX)
                {
                    Label17.Text = "Invalid DeliveredQty!";
                }
            }

        }


    }
}