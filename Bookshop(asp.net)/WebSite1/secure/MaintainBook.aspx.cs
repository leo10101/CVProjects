using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class secure_MaintainBook : System.Web.UI.Page
{
    BookshopEntities ctx;
    public secure_MaintainBook()
    {
        ctx = new BookshopEntities();
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
            //labelBookID.Visible = true;
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
        Page.Validate("Submit");
        if (Page.IsValid)
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
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Page.Validate("Submit");
        if (Page.IsValid)
        {
            //labelBookID.Visible = true;
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
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(tbxBookID.Text);
        var bookID = ctx.Books.Where(x => x.BookID == id).FirstOrDefault();
        ctx.Books.Remove(bookID);
        ctx.SaveChanges();
        Response.Redirect("BookSummaries.aspx");
    }

    protected void ISBNCustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = IsValidIsbn13(args.Value);
    }
    private static bool IsValidIsbn13(string isbn13)
    {
        bool result = false;
        if (!string.IsNullOrEmpty(isbn13))
        {
            long j;
            if (isbn13.Contains('-')) isbn13 = isbn13.Replace("-", "");

            // Check if it contains any non numeric chars, if yes, return false
            if (!Int64.TryParse(isbn13, out j))
                return false;

            int sum = 0;
            // Comment Source: Wikipedia
            // The calculation of an ISBN-13 check digit begins with the first
            // 12 digits of the thirteen-digit ISBN (thus excluding the check digit itself).
            // Each digit, from left to right, is alternately multiplied by 1 or 3,
            // then those products are summed modulo 10 to give a value ranging from 0 to 9.
            // Subtracted from 10, that leaves a result from 1 to 10. A zero (0) replaces a
            // ten (10), so, in all cases, a single check digit results.
            for (int i = 0; i < 12; i++)
            {
                sum += Int32.Parse(isbn13[i].ToString()) * (i % 2 == 1 ? 3 : 1);
            }

            int remainder = sum % 10;
            int checkDigit = 10 - remainder;
            if (checkDigit == 10) checkDigit = 0;

            result = (checkDigit == int.Parse(isbn13[12].ToString()));
        }

        return result;
    }

    protected void StockCustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
    {
        Int32 quantity = 0;
        args.IsValid = Int32.TryParse(args.Value, out quantity);
    }

    protected void PriceCustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
    {
        decimal price = 0;
        args.IsValid = decimal.TryParse(args.Value, out price);
    }
}