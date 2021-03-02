using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Havana
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                 if(txtuserid.Value == "Admin" && txtpassword.Value == "havana")
                {
                    Response.Redirect("Admin/Admin-Dashboard");
                    lblmsg.Visible = true;
                }
                else
                {
                    txtuserid.Value = "";
                    txtpassword.Value = "";
                    lblmsg.Visible = true;
                    lblmsg.Text = "Wrong UserId or Password";
                }
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
                
            }
        }
    }
}