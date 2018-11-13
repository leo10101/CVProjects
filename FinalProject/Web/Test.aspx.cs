using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AD
{
    public partial class 测试 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {



        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            encryption enc = new encryption();
            TextBox1.Text = enc.Encryption(TextBox1.Text.ToString());
            TextBox2.Text = enc.Encryption(TextBox2.Text.ToString());
            TextBox3.Text = enc.Encryption(TextBox3.Text.ToString());
            TextBox4.Text = enc.Encryption(TextBox4.Text.ToString());
            TextBox5.Text = enc.Encryption(TextBox5.Text.ToString());
            TextBox6.Text = enc.Encryption(TextBox6.Text.ToString());
            TextBox7.Text = enc.Encryption(TextBox7.Text.ToString());
            TextBox8.Text = enc.Encryption(TextBox8.Text.ToString());
            TextBox9.Text = enc.Encryption(TextBox9.Text.ToString());
            TextBox10.Text = enc.Encryption(TextBox10.Text.ToString());
            TextBox11.Text = enc.Encryption(TextBox11.Text.ToString());
            TextBox12.Text = enc.Encryption(TextBox12.Text.ToString());

        }
    }
}