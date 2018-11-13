using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//GAOYANGYANG    EMAIL:GUOXIAOCHUAN
namespace AD.Store
{
    public partial class Update_Department : System.Web.UI.Page
    {
        static string Departmentcode="";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            btn_Inform.Enabled = false;
            if (!IsPostBack)
            {
                GridView_department.DataSource = StoreBusinessLogic.AllDepartment();
                GridView_department.DataBind();
            }
            if (Session["sign"].ToString() == "")
                Response.Redirect("~/LoginNew.aspx");
            Boolean results = empauthentication.ClerkAuthentication(Session["sign"].ToString());
            if (results == false)
                Response.Redirect("~/LoginNew.aspx");
           
        }
        private void bindgrid()
        {
            GridView_department.DataSource = StoreBusinessLogic.AllDepartment();
            GridView_department.DataBind();
        }
        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView_department.EditIndex = -1;
            bindgrid();
            Btn_addNew.Enabled = true;
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            GridViewRow row = GridView_department.Rows[e.RowIndex];
            string deptcode = Convert.ToString(GridView_department.DataKeys[e.RowIndex].Values[0]);
            string deptname = (row.FindControl("TextBox1") as TextBox).Text;
            string contacttitle = (row.FindControl("TextBox2") as TextBox).Text;
            string contactname = (row.FindControl("TextBox3") as TextBox).Text;
            string phone = (row.FindControl("TextBox4") as TextBox).Text;
            string fax = (row.FindControl("TextBox5") as TextBox).Text;
            string headtitle = (row.FindControl("TextBox6") as TextBox).Text;
            string headname = (row.FindControl("TextBox7") as TextBox).Text;
            string collectionpoint = (row.FindControl("TextBox8") as TextBox).Text;
            string repname = (row.FindControl("TextBox9") as TextBox).Text;
            Departmentcode = deptcode;
            List<string> list = new List<string>()
            { deptcode,deptname,contacttitle,contactname, phone,fax,headtitle,headname,collectionpoint,
            repname
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
                Label11.Text = "Infomation is not complete";
                Session["count"] = 0;
            }
            else
            {
                   StoreBusinessLogic.EditDepartment(deptcode, deptname, contactname,
                    phone, fax, headname, collectionpoint, repname, contacttitle, headtitle);
                    GridView_department.EditIndex = -1;
                    bindgrid();
                    btn_Inform.Enabled = true;
                    Btn_addNew.Enabled = true;


            }
        }
        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string deptcode = Convert.ToString(GridView_department.DataKeys[e.RowIndex].Values[0]);
            StoreBusinessLogic.DeleteDepartment(deptcode);
            bindgrid();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView_department.EditIndex = e.NewEditIndex;
            bindgrid();
            Btn_addNew.Enabled = false;
        }

        protected void Btn_addNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddNewDepartment.aspx");
        }

        protected void btn_Inform_Click(object sender, EventArgs e)
        {
            Model1 entities = new Model1();
            Department department = entities.Departments.Where(x => x.DeptCode == Departmentcode).First();
            Session["Title"] = "Department Infromation Update Notification";
            Session["content"] = Session["sign"].ToString() + " inform that your department information has been Updated, the new information is in below \n"
             + "DeptCode\t DeptName\t ContactTitle\tContactName\tPhone\tFax\t HeadTitle\tHeadName\tCollectionPoint\tRepName\n";
            Session["content"] = Session["content"] + department.DeptCode + "\t" + department.DeptName + "\t" + department.ContactTitle + "\t" + department.ContactName + "\t"
             + department.Phone + "\t" + department.Fax + "\t" + department.HeadTitle + "\t" + department.HeadName + "\t" + department.CollectionPoint + "\t" + department.RepName + "\n";
            string a = Session["sign"].ToString();
            User c = entities.Users.Where(x => x.UserName == a).First();
            string Sender = c.Email;
            User u = entities.Users.Where(x => x.UserName == department.HeadName).First();
            string[] receiver = new string[] { u.Email };
            string Password = "Se123458!";
            Label11.Text = SendEmail.sendEmail(Sender, Password, Session["Title"].ToString(), Session["content"].ToString(), receiver);
            Session["Title"] = "";
            Session["content"] = "";

        }
    }
}