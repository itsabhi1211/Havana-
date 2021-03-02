using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana.User
{
    public partial class Change_Password : System.Web.UI.Page
    {
        connection con = new connection();
        Editlayer objedit = new Editlayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        /// <summary>
        /// code to change password...
        /// </summary>
        void changepassword()
        {
            try
            {
                if(Convert.ToString(Session["Password"])==txtold.Value)
                {
                    Editlayer.PasswordChange(Convert.ToInt32(Session["Id"]), txtnew.Value);
                    lblmsg.Text = "Password Successfully Changed";
                    Response.Redirect("../Userlogin.aspx");
                    Session["Id"] = null;
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Buffer = true;
                    Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
                    Response.Expires = -1000;
                    Response.CacheControl = "no-cache";
                    Session.Clear();
                    Session.Abandon();
                    Session.RemoveAll();
                    
                }
                else
                {
                    lblmsg.Text = "Password Do Not Match";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        protected void btnchange_Click(object sender, EventArgs e)
        {
            try
            {
                changepassword();
                lblmsg.Visible = true;
                lblmsg.Focus();
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}