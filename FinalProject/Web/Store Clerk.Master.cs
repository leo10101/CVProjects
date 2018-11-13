using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AD
{
    public partial class Store_Clerk1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

		protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
		{
            if (e.Item.Text.ToLower() == "logout")
            {
                Session.Abandon();
                Session.Contents.RemoveAll();
            }

        }
	}
}