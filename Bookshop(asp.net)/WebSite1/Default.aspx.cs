using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    shopController sc = new shopController();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try { 
            List<Book> l_BookList = new List<Book>();
            l_BookList = sc.selectAll();
            this.GridView1.DataSource = l_BookList;
            this.GridView1.DataBind();
            }
            catch (Exception ex)
            {
                string errormsg = string.Format("<script>Error:{0}</script>", ex.Message);
                Response.Write(errormsg);
            }
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

        try
        {
            this.GridView1.DataSource = list;
            this.GridView1.DataBind();
        }   catch (Exception ex)
        {
            string errormsg = string.Format("<script>Error:{0}</script>", ex.Message);
            Response.Write(errormsg);
        }
    }

    protected void lbDetail_Click(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        HiddenField hd = (HiddenField)lb.FindControl("HiddenField1");
        string title = hd.Value;
        Session["booktitle"] = title;
        Response.Redirect("BookDetails.aspx?BookDetail=" + title);
    }

    protected void SortPrice_linkBtn_Click(object sender, EventArgs e)
    {
        List<Book> list = new List<Book>();
        list = sc.OrderByPrice();
        try
        {
            this.GridView1.DataSource = list;
            this.GridView1.DataBind();
        }   catch (Exception ex)
        {
            string errormsg = string.Format("<script>Error:{0}</script>", ex.Message);
            Response.Write(errormsg);
        }
    }

    protected void SortByTitle_linkBtn_Click(object sender, EventArgs e)
    {
        List<Book> list = new List<Book>();
        list = sc.OrderByTitle();
        try { 
        this.GridView1.DataSource = list;
        this.GridView1.DataBind();
        }
        catch (Exception ex)
        {
            string errormsg = string.Format("<script>Error:{0}</script>", ex.Message);
            Response.Write(errormsg);
        }
    }
}
