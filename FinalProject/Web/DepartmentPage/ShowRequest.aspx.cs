using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//ZHAOYINQING /YANGXU     EMAIL:GUOXIAOCHUAN
namespace AD
{
    public partial class ShowRequest : System.Web.UI.Page
    {
        string str;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["sign"].ToString() == "")
                Response.Redirect("~/LoginNew.aspx");
            Boolean results = empauthentication.HeadandrepAuthentication(Session["sign"].ToString());
            if (results == false)
                Response.Redirect("~/LoginNew.aspx");
            if (!IsPostBack)
            {
                List<Request> list = new List<Request>();
                list= DepartmentBusinessLogic.GetRequestByPending();
                if(list.Count()==0)
                {
                    Lab_successful.Text = "No Request now";


                }
                else
                {
                    GridView1.DataSource = list;
                    GridView1.DataBind();
                }
            }
           

        }
        List<Request> GetRequest()
        {
            Model1 ctx = new Model1();
            List<Request> ReqList = ctx.Requests.ToList<Request>();
            ArrayList al = new ArrayList(ReqList);
            Session["al"] = al;
            return ctx.Requests.ToList<Request>();
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int id = GridView1.SelectedIndex; 
            Session["id"] = id+2;
          //  Lab_Request.Text = Session["id"].ToString();
            Lab_successful .Text= "Successful";
        }

        protected void GridView1_SelectedIndexChanging1(object sender, GridViewSelectEventArgs e)
        {
            str = GridView1.Rows[e.NewSelectedIndex].Cells[0].Text;
            Session["requestid"] = str;
            Response.Redirect("ShowRequestDetails.aspx");
        }
    }
}