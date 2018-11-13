using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//GAOYANGYANG    EMAIL:GUOXIAOCHUAN
namespace AD.Store
{
    public partial class Stock_Level : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["sign"].ToString() == "")
                Response.Redirect("~/LoginNew.aspx");
            Boolean results = empauthentication.ClerkAuthentication(Session["sign"].ToString());
            if (results == false)
                Response.Redirect("~/LoginNew.aspx");
            
        }

        protected void Btn_search_Click(object sender, EventArgs e)
        {
            string category = DropDownList_category.SelectedItem.ToString();
            GridView_stock.DataSource = StoreBusinessLogic.GetStockByCategory(category);
            GridView_stock.DataBind();
        }

		protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
		{

		}
	}
}