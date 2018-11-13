using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    SA45TEAM04_BOOKSTORE ctx;
    public _Default()
    {
        ctx = new SA45TEAM04_BOOKSTORE();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCCB();
            btnSubmit.Visible = true;
        }
    }
    private void LoadCCB()
    {
        var category = ctx.Categories.ToList();
        ddlBookCategory.Items.Clear();
        ddlBookCategory.DataSource = category;
        ddlBookCategory.DataTextField = "Name";
        ddlBookCategory.DataValueField = "CategoryID";
        ddlBookCategory.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(tbxSearch.Text))
        {
            btnSubmit.Visible = false;
            btnDelete.Visible = true;
            btnUpdate.Visible = true;
            tbxBookID.Visible = true;
            labelBookID.Visible = true;
            int id = 0;
            if (int.TryParse(tbxSearch.Text, out id))
            {
                var bookInfo = ctx.Books.Where(x => x.BookID == id || x.Title.Contains(tbxSearch.Text)).FirstOrDefault();
                tbxBookID.Text = bookInfo.BookID.ToString();
                tbxAuthor.Text = bookInfo.Author;
                tbxBookTitle.Text = bookInfo.Title;
                tbxISBN.Text = bookInfo.ISBN.ToString();
                tbxPrice.Text = bookInfo.Price.ToString();
                tbxStock.Text = bookInfo.Stock.ToString();
            }
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(tbxBookID.Text);
        var updateBook = ctx.Books.SingleOrDefault(x => x.BookID == id);
        if (updateBook != null)
        {
            updateBook.BookID = int.Parse(tbxBookID.Text);
            updateBook.CategoryID = int.Parse(ddlBookCategory.SelectedValue);
            updateBook.ISBN = tbxISBN.Text;
            updateBook.Price = Convert.ToDecimal(tbxPrice.Text);
            updateBook.Stock = int.Parse(tbxStock.Text);
            updateBook.Title = tbxBookTitle.Text;
            updateBook.Author = tbxAuthor.Text;
        }
        ctx.Books.AddOrUpdate(updateBook);
        ctx.SaveChanges();
        Response.Redirect("BookSummaries.aspx");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        labelBookID.Visible = true;
        tbxBookID.Visible = true;
        Book newbook = new Book()
        {
            Author = tbxAuthor.Text,
            Stock = int.Parse(tbxStock.Text),
            Price = Convert.ToDecimal(tbxPrice.Text),
            Title = tbxBookTitle.Text,
            CategoryID = int.Parse(ddlBookCategory.SelectedValue),
            ISBN = tbxISBN.Text
        };
        ctx.Books.Add(newbook);
        ctx.SaveChanges();
        Response.Redirect("BookSummaries.aspx");
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(tbxBookID.Text);
        var bookID = ctx.Books.Where(x => x.BookID == id).FirstOrDefault();
        ctx.Books.Remove(bookID);
        ctx.SaveChanges();
        Response.Redirect("BookSummaries.aspx");
    }
}