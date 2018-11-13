using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//GAOYANGYANG    EMAIL:GUOXIAOCHUAN
namespace AD.Store
{
    public partial class AddNewDepartment : System.Web.UI.Page
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
         
                
                string deptcode = TB_deptCode.Text;
                string deptname = TB_deptName.Text;
                string contactname = TB_contactName.Text;
                string phone = TB_phone.Text;
                string fax = TB_fax.Text;
                string headname = TB_headName.Text;
                string collectionpoint = TB_collectionPoint.Text;
                string repname = TB_repName.Text;
                string headtitle = TB_headTitle.Text;
                string contacttitle = TB_contactTitle.Text;
                StoreBusinessLogic.AddNewDepartment(deptcode, deptname, contactname, phone,
                    fax, headname, collectionpoint, repname, contacttitle, headtitle);
                Label1.Text = "Add Successful";
          
                

            
            
        }

        protected void Btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Update Department.aspx");
        }
    }
}