using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//YANGXU    
namespace AD.Store
{
    public partial class Purchase_Order : System.Web.UI.Page
    {
        int POnum;
        protected void Page_Load(object sender, EventArgs e)
        {  
            if (Session["sign"].ToString() == "")
                Response.Redirect("~/LoginNew.aspx");
            if (!IsPostBack)
            {
                PoNo();
                //BindGrid();

                DropDownList1.DataSource = StoreBusinessLogic.ListSupp();
                DropDownList1.DataTextField = "SuppCode";
                DropDownList1.DataValueField = "SuppCode";
                DropDownList1.DataBind();

            }
            Boolean results = empauthentication.ClerkAuthentication(Session["sign"].ToString());
            if (results == false)
                Response.Redirect("~/LoginNew.aspx");
           
        }

        private void BindGrid()
        {
            GridView1.DataSource = StoreBusinessLogic.GetPOListAll();
            GridView1.DataBind();
        }
        private void BindGrid(string supp)
        {
            GridView1.DataSource = StoreBusinessLogic.GetPOListAll(supp);
            GridView1.DataBind();
        }

        //PO number 
        protected void PoNo()
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
                Label16.Text = POnum.ToString();
            }
        }
        //Custom order
        protected void Button1_Click(object sender, EventArgs e)
        {

            Response.Redirect("PurchaseOrder_CustomerOrder.aspx");
        }
        //Place order
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow row in GridView1.Rows)
                {
                    if (row.Visible == true)
                    {
                        int POnum = Convert.ToInt32(Label16.Text);
                        string ItemCode = (row.FindControl("Label7") as Label).Text;
                        string Category = (row.FindControl("Label8") as Label).Text;
                        string desp = (row.FindControl("Label9") as Label).Text;
                        int qty = Convert.ToInt32((row.FindControl("TextBox1") as TextBox).Text);
                        string suppCode = (row.FindControl("Label14") as Label).Text;
                        double price = Convert.ToDouble((row.FindControl("Label15") as Label).Text);

                        int orderedQty;
                        using (Model1 entities = new Model1())
                        {
                            Stock s = entities.Stocks.Where(p => p.ItemCode == ItemCode).First<Stock>();
                            orderedQty = Convert.ToInt32(s.OrderedQty) + qty;
                        }
                        if (qty >= 0)
                        {
                            StoreBusinessLogic.AddPO(POnum, ItemCode, desp, qty, price, suppCode);
                            StoreBusinessLogic.UpdateStock(ItemCode, orderedQty);
                            PoNo();
                            BindGrid();
                            Label18.Text = "Successful";
                        }
                        else
                        {
                            Label18.Text = "Please input Positive Integer";
                        }
                    }
                }
                PoNo();
                string supp = DropDownList1.SelectedValue.ToString();
                BindGrid(supp);
                Label17.Text = "";
            }
            catch (Exception ex)
            {
                Label18.Text = "Invalid PO number!";
            }
        }

        //HideRows
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridView1.Rows[e.RowIndex].Visible = false;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            string supp = DropDownList1.SelectedValue.ToString();
            BindGrid(supp);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Button2.Enabled = true;
            Session["Title"] = "Purchase Order Request  ";
            Session["content"] = Session["sign"].ToString() + " inform you that the Purchase Order is in Attacgment,Please provide the goods as soon as possible.";
            Page.ClientScript.RegisterStartupScript(
            this.GetType(), "OpenWindow", "window.open('http://localhost:58425/Email.aspx','_newtab');", true);
        }

     
    }
}