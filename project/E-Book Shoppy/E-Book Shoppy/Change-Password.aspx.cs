using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace E_Book_Shoppy
{
    public partial class Change_Password : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("User-login.aspx");
            }
            txtuserid.Text = Session["userid"].ToString();
        }

        void pwdchange()
        {
            try
            {
                if (txtnewpassword.Text == txtcnfpassword.Text)
                {
                    SqlConnection con = new SqlConnection(strcon);
                    SqlCommand cmd = new SqlCommand("Update tblreg set Password=@new where (ContactNo=@userid or Email=@userid) and Password=@Old", con);
                    cmd.Parameters.AddWithValue("@userid", Session["userid"].ToString());
                    cmd.Parameters.AddWithValue("@Old", txtoldpassword.Text);
                    cmd.Parameters.AddWithValue("@new", txtnewpassword.Text);
                    con.Open();
                    int x = cmd.ExecuteNonQuery();
                    if (x > 0)
                    {
                        lblmsg.Text = "You Have Successfully Changed Your Password... ";
                        clearselection();
                    }
                    else
                    {
                        lblmsg.Text = "Your Old password is Wrong " + "Please Enter Again....";
                    }

                }
                else
                {
                    lblmsg.Text = "Your Password Not Matched" + "Please Enter Again..";
                }
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
            }



        }


        void clearselection()
        {
            try
            {
                txtnewpassword.Text = "";
                txtcnfpassword.Text = "";
                txtoldpassword.Text = "";
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        protected void btnlogin_Click(object sender, EventArgs e)
        {

            try
            {
                pwdchange();
                lblmsg.Visible = true;
                lblmsg.Focus();

            }
            catch (Exception ex)
            {
                throw ex;

            }
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.ClearHeaders();
            Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
            Response.AddHeader("Pragma", "no-cache");
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("User-login.aspx");
        }
    }
}