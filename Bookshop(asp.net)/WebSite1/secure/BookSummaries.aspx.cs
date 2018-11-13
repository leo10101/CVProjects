using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BookSummary : System.Web.UI.Page
{
    BookshopEntities ctx;
    public BookSummary()
    {
        ctx = new BookshopEntities();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
        }
    }
    private void BindGrid()
    {
        var books = ctx.Books.ToList();
        GridView1.DataSource = books;
        GridView1.DataBind();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int bookId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
        var id = ctx.Books.Where(x => x.BookID == bookId).FirstOrDefault();
        ctx.Books.Remove(id);
        ctx.SaveChanges();
        BindGrid();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];
        int bookID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
        string category = (row.FindControl("ddlCategory") as DropDownList).SelectedItem.Text;
        string isbn = (row.FindControl("tbxISBN") as TextBox).Text;
        string author = (row.FindControl("tbxAuthor") as TextBox).Text;
        string title = (row.FindControl("tbxTitle") as TextBox).Text;
        string stock = (row.FindControl("tbxStock") as TextBox).Text;
        string price = (row.FindControl("tbxPrice") as TextBox).Text;
        var book = ctx.Books.Where(x => x.BookID == bookID).FirstOrDefault();
        book.Author = author;
        book.Category.Name = category;
        book.ISBN = isbn;
        book.Price = int.Parse(price);
        book.Stock = int.Parse(stock);
        book.Title = title;

        ctx.Books.AddOrUpdate(book);
        ctx.SaveChanges();

        GridView1.EditIndex = -1;
        BindGrid();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindGrid();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if(e.Row.RowType==DataControlRowType.DataRow)
        {
            Book book = (Book)e.Row.DataItem;
            DropDownList ddl = (e.Row.FindControl("ddlCategory") as DropDownList);
            if (ddl != null)
            {
                ddl.DataSource = ctx.Categories.ToList();
                ddl.DataTextField = "Name";
                ddl.DataValueField = "CategoryID";
                ddl.DataBind();
                try
                {
                    ddl.SelectedValue = ddl.Items.FindByText(book.Category.Name).Text;
                }
                catch (Exception ex)
                {

                }
            }
            TextBox author = (e.Row.FindControl("tbxAuthor") as TextBox);
            if(author != null)
            {
                author.Text = book.Author;
            }
            TextBox ISBN = (e.Row.FindControl("tbxISBN") as TextBox);
            if (ISBN != null)
            {
                ISBN.Text = book.ISBN;
            }
            TextBox Stock = (e.Row.FindControl("tbxStock") as TextBox);
            if (Stock != null)
            {
                Stock.Text = book.Stock.ToString();
            }
            TextBox Price = (e.Row.FindControl("tbxPrice") as TextBox);
            if (Price != null)
            {
                Price.Text = book.Price.ToString();
            }
            TextBox Title = (e.Row.FindControl("tbxTitle") as TextBox);
            if (Title != null)
            {
                Title.Text = book.Title;
            }
            TextBox BookID = (e.Row.FindControl("tbxOrderID") as TextBox);
            if(BookID != null)
            {
                BookID.Text = book.BookID.ToString();
            }
        }
    }
}