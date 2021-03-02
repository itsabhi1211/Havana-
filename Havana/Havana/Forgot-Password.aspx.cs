using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana
{
    public partial class Forgot_Password : System.Web.UI.Page
    {
        logindatalayer objlogin = new logindatalayer();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnchangepasword_Click(object sender, EventArgs e)
        {
            try
            {
                
                string no = "";
                string name = "";
                var q = objlogin.ForgotPassword(txtuserid.Value);
                if (q.Any())
                {

                    string Password = Guid.NewGuid().ToString().Substring(0, 10);

                    foreach (tblreg k in q)
                    {
                        no = Convert.ToInt64(k.ContactNo).ToString();
                        
                        name = k.Name;


                    }
                    string filepath = Server.MapPath("Forget.html");
                    string datetime = DateTime.Now.ToString();
                    string year = DateTime.Now.Year.ToString();

                    int Issuccess = MailAccessLayer.ForgotPassword(txtuserid.Value,name, name, no, datetime, filepath, year, Password);
                    if (Issuccess == 1)
                    {
                        Editlayer.PasswordChangeOnEmail(txtuserid.Value, Password);
                        lblmsg.Text = "Mail has been send successfully ...";
                    }
                    else
                    {
                        lblmsg.Text = "Technical Error Please try again later...";
                    }

                    lblmsg.Visible = true;
                    lblmsg.Focus();


                }
                else
                {
                    lblmsg.Text = "Please Enter a Valid Email-Id...";
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}