using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bookshop_Team4;

namespace Bookshop_Team4
{
    public partial class HomePage : System.Web.UI.Page
    {
        shopController sc = new shopController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Book> l_BookList = new List<Book>();
                l_BookList = sc.selectAll();
                this.GridView1.DataSource = l_BookList;
                this.GridView1.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            
            List<Book> list = new List<Book>();

            String keyword = txtKeyword.Text;
            String type = SearchCondition_ddl.Text;
            if (type == "Title")
            {
                list = sc.searchByTitle(keyword);
            }
            else if (type == "Author")
            {
                list = sc.searchByAuthor(keyword);
            }

            this.GridView1.DataSource = list;
            this.GridView1.DataBind();
        }

        protected void lbDetail_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            HiddenField hd = (HiddenField)lb.FindControl("HiddenField1");
            string title = hd.Value;
            Session["booktitle"] = title;
            Response.Redirect("BookDetails.aspx?BookDetail=" + title);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SortPrice_linkBtn_Click(object sender, EventArgs e)
        {
            List<Book> list = new List<Book>();
            list = sc.OrderByPrice();
            this.GridView1.DataSource = list;
            this.GridView1.DataBind();
        }

        protected void SortByTitle_linkBtn_Click(object sender, EventArgs e)
        {
            List<Book> list = new List<Book>();
            list = sc.OrderByTitle();
            this.GridView1.DataSource = list;
            this.GridView1.DataBind();
        }
    }
}