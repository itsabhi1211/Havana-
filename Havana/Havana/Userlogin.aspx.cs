using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana
{
    public partial class Userlogin : System.Web.UI.Page
    {
        connection con = new connection();
        logindatalayer objdata = new logindatalayer();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Session["Id"] = null;
            }
        }
        void login()
        {
            try
            {
                var q = objdata.LoginWithMailId(txtuserid.Value, txtpassword.Value);
                if (q.Any())
                {
                    foreach (tblreg k in q)
                    {
                        Session["Id"] = k.Id;
                        Session["Email"] = k.Email;
                        Session["ContactNo"] = k.ContactNo;
                        Session["Password"] = k.Password;
                    }
                    if(Request.QueryString["Id"]!=null)
                    {
                        Response.Redirect("Shopping-cart.aspx?CartId=" + Convert.ToString(Request.QueryString["Id"]));
                    }
                    else
                    {
                        Response.Redirect("User/User-Dashboard");
                    }
                    
                }
                else
                {
                    var r = objdata.LoginWithContactNo(Convert.ToInt64(txtuserid.Value), txtpassword.Value);
                    if (r.Any())
                    {
                        foreach (tblreg k in r)
                        {
                            Session["Id"] = k.Id;
                            Session["Email"] = k.Email;
                            Session["ContactNo"] = k.ContactNo;
                            Session["Password"] = k.Password;
                        }
                        if (Request.QueryString["Id"] != null)
                        {
                            Response.Redirect("Shopping-cart.aspx?CartId=" + Convert.ToString(Request.QueryString["Id"]));
                        }
                        else
                        {
                            Response.Redirect("User/User-Dashboard");
                        }
                    }
                    else
                    {
                        lblmsg.Text = "Invalid LoginId/Password";
                        lblmsg.Attributes.Add("style", "color:red");
                    }
                }
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.Attributes.Add("style", "color:red");
            }
        }

        void loginfordetails()
        {
            try
            {
                
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    
        /// <summary>
        /// code to login...
        /// </summary>
        
        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                login();
                lblmsg.Visible = true;
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.Attributes.Add("style", "color:red");
            }
        }
    }
}