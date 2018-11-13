using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }



    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        try { 
        string user = CreateUserWizard1.UserName;
        Roles.AddUserToRole(user, "User");
        Response.Redirect("~/Default.aspx");
        }
        catch (Exception ex)
        {
            string errormsg = string.Format("<script>Error:{0}</script>", ex.Message);
            Response.Write(errormsg);
        }
    }
}