using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//GAOYANGYANG           EMAIL:GUOXIAOCHUAN
namespace AD.Store
{
    public partial class UpdateSupplier : System.Web.UI.Page
    {
        static string Suppliercode = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            btn_InformSupplier.Enabled = false;
            if (!IsPostBack)
            {
                GridView_supplier.DataSource = StoreBusinessLogic.AllSupplier();
                GridView_supplier.DataBind();
            }
            if (Session["sign"].ToString() == "")
                Response.Redirect("~/LoginNew.aspx");
            Boolean results = empauthentication.ClerkAuthentication(Session["sign"].ToString());
            if (results == false)
                Response.Redirect("~/LoginNew.aspx");
           
        }
        private void bindgrid()
        {
            GridView_supplier.DataSource = StoreBusinessLogic.AllSupplier();
            GridView_supplier.DataBind();
        }
        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView_supplier.EditIndex = -1;
            bindgrid();
            Btn_addNew.Enabled = true;
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            GridViewRow row = GridView_supplier.Rows[e.RowIndex];
            string suppcode = Convert.ToString(GridView_supplier.DataKeys[e.RowIndex].Values[0]);
            string suppname = (row.FindControl("TextBox1") as TextBox).Text;
            string contacttitle = (row.FindControl("TextBox2") as TextBox).Text;
            string contactname = (row.FindControl("TextBox3") as TextBox).Text;
            string phone = (row.FindControl("TextBox4") as TextBox).Text;
            string fax = (row.FindControl("TextBox5") as TextBox).Text;
            string address = (row.FindControl("TextBox6") as TextBox).Text;
            string postcode = (row.FindControl("TextBox7") as TextBox).Text;
            string gst = (row.FindControl("TextBox8") as TextBox).Text;
            Suppliercode = suppcode;
            List<string> list = new List<string>()
            { suppcode,suppname,contacttitle,contactname, phone,fax,address,postcode,gst,
            
            };
            foreach (string c in list)
            {
                if (c == "" || c == null)
                {
                    Session["count"] = 1;
                }

            }
            if (Convert.ToInt32(Session["count"]) == 1)
            {
                Label10.Text = "Infomation is not complete";
                Session["count"] = 0;
            }
            else
            {
                StoreBusinessLogic.EditSupplier(suppcode, suppname, contacttitle, contactname,
                phone, fax, address, postcode, gst);
                GridView_supplier.EditIndex = -1;
                bindgrid();
                btn_InformSupplier.Enabled = true;
                Btn_addNew.Enabled = true;
            }
        }
        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string suppcode = Convert.ToString(GridView_supplier.DataKeys[e.RowIndex].Values[0]);
            StoreBusinessLogic.DeleteSupplier(suppcode);
            bindgrid();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView_supplier.EditIndex = e.NewEditIndex;
            bindgrid();
            Btn_addNew.Enabled = false;
        }

        protected void Btn_addNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddNewSupplier.aspx");
        }

        protected void btn_InformSupplier_Click(object sender, EventArgs e)
        {
            Model1 entities = new Model1();
            Supplier supplier= entities.Suppliers.Where(x => x.SuppCode == Suppliercode).First();
            Session["Title"] = "Supplier Infromation Update Notification";
            Session["content"] = Session["sign"].ToString() + " inform that your information has been Updated, the new information is in below \n"
             + "SuppCode\t SuppName\t ContactTitle\tContactName\tPhone\tFax\tAddress\tPostalCode\tGSTNo\n";
            Session["content"] = Session["content"] + supplier.SuppCode + "\t" + supplier.SuppName + "\t" + supplier.ContactTitle + "\t" + supplier.ContactName + "\t"
             + supplier.Phone + "\t" + supplier.Fax + "\t" + supplier.Address + "\t" + supplier.PostalCode + "\t" + supplier.GSTNo + "\n";
            Page.ClientScript.RegisterStartupScript(
           this.GetType(), "OpenWindow", "window.open('http://localhost:58425/Email.aspx','_newtab');", true);
        }
    }
}