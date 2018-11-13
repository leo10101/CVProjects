using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//ZHAOYINQING /YANGXU     EMAIL:GUOXIAOCHUAN
namespace AD
{
    public partial class MakeRequest : System.Web.UI.Page
    {
        static int CurrentNumber = 0;
        int ReID;
        Model1 ctx = new Model1();
        string username;
        DateTime date;
        string DeptCode;
        int userID;
        string DeptName;
        string UserName;
        string approvalStatus;
        string collectionStatus;
        string ABName;
        string collectionpoint;
        int approveby;
        string itemcode;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Enabled = false;
            Button2.Enabled = false;
            if (Session["sign"].ToString() == "")
                Response.Redirect("~/LoginNew.aspx");
            string username = Session["sign"].ToString();
            Boolean results = empauthentication.EmpAuthentication(Session["sign"].ToString());
            if (results == false)
                Response.Redirect("~/LoginNew.aspx");
            if (!IsPostBack)
            {
                ReIDD();
                try
                {
                    ReID = Convert.ToInt32(Label2.Text);
                    BindGrid(ReID);
                }
                catch (Exception ex)
                {
                }
            }
           
        }
        private void BindGrid(int ReID)
        {
            GridView1.DataSource = DepartmentBusinessLogic.ListREBy(ReID);
            GridView1.DataBind();
        }
        protected void ReIDD()
        {
            using (Model1 entities = new Model1())
            {
                try
                {
                    RequestDetail id = entities.RequestDetails.OrderByDescending(p => p.RequestID).First<RequestDetail>();
                    ReID = id.RequestID + 1;
                }
                catch (Exception EX)
                {
                    ReID = 1;
                }
                Label2.Text = ReID.ToString();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {

                string description = DropDownList2.SelectedValue;
                Stock s = ctx.Stocks.Where(x => x.Description == description).First();
                int ReID = Int32.Parse(Label2.Text);
                string ItemCode = s.ItemCode;
                string desp = DropDownList2.SelectedValue.ToString();
                int qty = Int32.Parse(Textbox2.Text);
                //int qty = -1;
                if (qty <= 0)
                {
                    Label1.Text = "Please input Valid number";
                }
                else
                {
                    DepartmentBusinessLogic.AddReDetails(ReID, ItemCode, desp, qty, 0, 0);
                    BindGrid(ReID);
                    Button2.Enabled = true;
                    Label1.Text = "Add Suceessful";
                }
               

            }
            catch (Exception ex)
            {
                Label1.Text = "Please input Valid number";
            }
        }

        protected void Textbox1_TextChanged(object sender, EventArgs e)
        {
        }



        protected void Button2_Click(object sender, EventArgs e)
        {
            date = DateTime.Now;
            username = Session["sign"].ToString();
            User u = ctx.Users.Where(x => x.UserName == username).First();
            userID = u.UserID;
            DeptCode = u.DeptCode;
            DeptName = u.DeptName;
            UserName = u.UserName;
            approvalStatus = "Pending";
            collectionStatus = "Uncollected";
            Department d = ctx.Departments.Where(x => x.DeptCode == DeptCode).First();
            ABName = d.ContactName;
            collectionpoint = d.CollectionPoint;
            User u2 = ctx.Users.Where(x => x.UserName == ABName).First();
            approveby = u2.UserID;
            ReID = Convert.ToInt32(Label2.Text);
            DepartmentBusinessLogic.AddRequest(ReID, DeptCode, DeptName, userID, UserName, date, approvalStatus, approveby, ABName, null, collectionStatus, collectionpoint);
            string a = Session["sign"].ToString();
            User c = ctx.Users.Where(x => x.UserName == a).First();
            string Sender = c.Email;
            User departhead = ctx.Users.Where(x => x.DeptName == u.DeptName && x.Role == "DeptHead").First();
            string[] receive = new string[] { departhead.Email.ToString() };
            string Password = "De123457!";
            Session["Title"] = "New Request coming";
            Session["content"] = Session["sign"].ToString() + " has submit request,please process as soon as possible";
            Label1.Text = SendEmail.sendEmail(Sender, Password, Session["Title"].ToString(), Session["content"].ToString(), receive);
            Session["Title"] = "";
            Session["content"] = "";

        }
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            itemcode = GridView1.Rows[e.NewSelectedIndex].Cells[0].Text;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Button2.Enabled = true;
            ReID = Convert.ToInt32(Label2.Text);
            DepartmentBusinessLogic.DeleteItem(ReID, itemcode);
            BindGrid(ReID);
            Model1 ctx = new Model1();
            List<RequestDetail> list = new List<RequestDetail>();
            list = ctx.RequestDetails.Where(x => x.RequestID ==ReID).ToList();
            if (list.Count() == 0)
                Button2.Enabled = false;


        }
    }
}