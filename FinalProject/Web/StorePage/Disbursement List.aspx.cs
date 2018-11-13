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
    public partial class Disbursement_List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {    
            if (Session["sign"].ToString() == "")
                Response.Redirect("~/LoginNew.aspx");
            Boolean results = empauthentication.ClerkAuthentication(Session["sign"].ToString());
            if (results == false)
                Response.Redirect("~/LoginNew.aspx");
            Button1.Enabled = false;
            string deptName = DropDownList1.Text;
            if (!IsPostBack)
            {
                deptName = "Commerce Dept";
                //List<RequestDetail> RequestList = GetProductsToDisburse();
                //if (RequestList.Count == 0)
                //{
                //    lb_Inform.Text = "No Need to Disburse Now";
                //}
             
            }

            Session["dept"] = deptName;
           

        }

        public List<RequestDetail> GetProductsToDisburse()
        {
            using (Model1 entities = new Model1())
            {

                string dept = (string)Session["dept"];
                List<Request> ReList = entities.Requests.Where(p => p.DeptName == dept).ToList();
                ArrayList IDList = new ArrayList();

                for (int i = 0; i < ReList.Count; i++)
                {
                    IDList.Add(ReList[i].RequestID);
                }

                List<RequestDetail> AutoPopulateList = new List<RequestDetail>();

                for (int j = 0; j < IDList.Count; j++)
                {
                    int index = (int)IDList[j];
                    List<RequestDetail> datatransfer = new List<RequestDetail>();
                    datatransfer = entities.RequestDetails.Where
                (p => p.CollectionQty > p.DisbursementQty && p.RequestID == index).ToList();
                    try
                    {
                        AutoPopulateList.AddRange(datatransfer);

                    }
                    catch { }
                }
                return AutoPopulateList;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {

                if (GridView1.Rows.Count > 0)
                {
                    foreach (GridViewRow row in GridView1.Rows)
                    {
                        int RequestID = Int32.Parse((row.FindControl("Label1") as Label).Text);
                        string ItemCode = (row.FindControl("Label2") as Label).Text;
                        string s = (row.FindControl("textbox1") as TextBox).Text;
                        string a = (row.FindControl("Label5") as Label).Text;
                        int CollectionQty = Convert.ToInt32(a);
                        int DisbursementQty = Convert.ToInt32(s);
                        if (DisbursementQty > CollectionQty || DisbursementQty < 0)
                        {
                            Session["count"] = 1;
                        }
                    }
                }
                else
                {
                    lb_Inform.Text = "No pending Disbursment Now";
                }
            }
            catch (Exception ex)
            {

                lb_Inform.Text = "Please input Positive Integer";
                Button1.Enabled = true;
            }
            if (Convert.ToInt32(Session["count"]) == 1)
            {
                lb_Inform.Text = "DisbursementQty can not more than CollectionQty or be negative";
                Session["count"] = 0;
            }
            else
            {
                try
                {
                    foreach (GridViewRow row in GridView1.Rows)
                    {
                        int RequestID = Int32.Parse((row.FindControl("Label1") as Label).Text);
                        string ItemCode = (row.FindControl("Label2") as Label).Text;
                        string s = (row.FindControl("textbox1") as TextBox).Text;
                        int DisbursementQty = Convert.ToInt32(s);
                        StoreBusinessLogic.Disburse(RequestID, ItemCode, DisbursementQty);

                    }
                    Response.Redirect("~/StorePage/Disbursement List.aspx");
                }
                catch (Exception ex)
                {
                    lb_Inform.Text = "Please input Positive Integer";
                }
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            GridView1.DataSource = GetProductsToDisburse();
            GridView1.DataBind();
            Button1.Enabled = true;
            lb_Inform.Text = "";

        }
    }
}