using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Book_Shoppy.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.ClearHeaders();
            Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
            Response.AddHeader("Pragma", "no-cache");
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("../Admin-login.aspx");
        }
    }
}