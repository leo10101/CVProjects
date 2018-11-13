using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//SHENYUSHI    EMAIL:GUOXIAOCHUAN
namespace AD.Store
{
    public partial class Retrieval_Form : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["sign"].ToString() == "")
                Response.Redirect("~/LoginNew.aspx");
            if (!IsPostBack)
            {
               
                List<RequestSTATUS> RequestList = StoreBusinessLogic.GetRetriecvalStatus();
                if (RequestList.Count == 0)
                {
                    lb_Inform.Text = "No Request Now";
                }
                else {
                    GridView1.DataSource = StoreBusinessLogic.GetRetriecvalStatus();
                    GridView1.DataBind();


                }
            }
            Boolean results = empauthentication.ClerkAuthentication(Session["sign"].ToString());
            if (results == false)
                Response.Redirect("~/LoginNew.aspx");
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
                 int RequestID = 0;
                 string Description = "";
                 int RequestQty = 0;
                 int CollectionQty = 0;
            try
            {
                
                if (GridView1.Rows.Count > 0)
                {
                    foreach (GridViewRow row in GridView1.Rows)
                    {   
                        RequestID = Int32.Parse((row.FindControl("Label1") as Label).Text);
                        Description = (row.FindControl("Label2") as Label).Text;
                        RequestQty = Int32.Parse((row.FindControl("Label3") as Label).Text);
                        CollectionQty = Int32.Parse((row.FindControl("textbox1") as TextBox).Text);
                        if (CollectionQty > RequestQty || CollectionQty <0)
                        {
                            Session["count"] = 1;
                        }
                       
                    }
                }
                else
                {
                    lb_Inform.Text = "No Request now";
                }
            }
            catch(Exception ex)
                {
                lb_Inform.Text = "Please input Positive Integer";
            }

            if (Convert.ToInt32(Session["count"] )== 1)
            {
                lb_Inform.Text = "CollectionQty can not more than RequestQty or be negative";
                Session["count"] = 0;
            }
            else
            {
                try
                {
                    foreach (GridViewRow row in GridView1.Rows)
                    {
                        RequestID = Int32.Parse((row.FindControl("Label1") as Label).Text);
                        Description = (row.FindControl("Label2") as Label).Text;
                        RequestQty = Int32.Parse((row.FindControl("Label3") as Label).Text);
                        CollectionQty = Int32.Parse((row.FindControl("textbox1") as TextBox).Text);
                        StoreBusinessLogic.UpdateOrder(RequestID, Description, RequestQty, CollectionQty);

                    }
                    Response.Redirect("~/StorePage/Retrieval Form.aspx");
                }
                catch(Exception ex)
                {
                    lb_Inform.Text = "Please input Positive Integer";
                }
            }
        }
    }
}
