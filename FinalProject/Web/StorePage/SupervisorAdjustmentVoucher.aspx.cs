using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Jerome / ZHAOYINQING /SHENYUSHI    EMAIL:GUOXIAOCHUAN
namespace AD.StorePage
{
    public partial class SupervisorAdjustmentVoucher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataSource = StoreBusinessLogic.GetAVListSup();
                GridView1.DataBind();
            }
            if (Session["sign"].ToString() == "")
                Response.Redirect("~/LoginNew.aspx");
            Boolean results = empauthentication.SupAuthentication(Session["sign"].ToString());
            if (results == false)
                Response.Redirect("~/LoginNew.aspx");

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            int id = Convert.ToInt32(row.Cells[1].Text);
            Session["id"] = id;
            Response.Redirect("SupervisorAdjustmentVoucherDetails.aspx");
        }
    }
}