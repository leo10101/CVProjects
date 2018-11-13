using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//GAOYANGYANG     EMAIL:GUOXIAOCHUAN
namespace AD.Store
{
    public partial class AddNewSupplier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["sign"].ToString() == "")
                Response.Redirect("~/LoginNew.aspx");
            Boolean results = empauthentication.ClerkAuthentication(Session["sign"].ToString());
            if (results == false)
                Response.Redirect("~/LoginNew.aspx");
        }

        protected void Btn_add_Click(object sender, EventArgs e)
        {
            string suppcode = TB_suppCode.Text;
            string suppname = TB_suppName.Text;
            string contacttitle = TB_contactTitle.Text;
            string contactname = TB_contactName.Text;
            string phone = TB_phone.Text;
            string fax = TB_fax.Text;
            string address = TB_address.Text;
            string postcode = TB_postalCode.Text;
            string gst = TB_gst.Text;

            StoreBusinessLogic.AddNewSupplier(suppcode, suppname, contacttitle,
                contactname, phone, fax, address, postcode, gst);
        }

        protected void Btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateSupplier.aspx");
        }
    }
}