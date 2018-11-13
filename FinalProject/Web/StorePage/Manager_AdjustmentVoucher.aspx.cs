using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Jerome / ZHAOYINQING     EMAIL:GUOXIAOCHUAN
namespace AD.Store
{
    public partial class Manager_AdjustmentVoucher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataSource = StoreBusinessLogic.GetAVListMan();
                GridView1.DataBind();
            }
            if (Session["sign"].ToString() == "")
                Response.Redirect("~/LoginNew.aspx");
            Boolean results = empauthentication.ManagerAuthentication(Session["sign"].ToString());
            if (results == false)
                Response.Redirect("~/LoginNew.aspx");
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            int id = Convert.ToInt32(row.Cells[1].Text);
            Session["id"] = id;
            Response.Redirect("ManagerAdjustmentVoucherDetails.aspx");
        }
    }
}