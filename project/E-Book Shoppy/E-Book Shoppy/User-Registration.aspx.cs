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
    public partial class User_Registration : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// code for user registration..
        /// </summary>
        void userRegistration()
        {
            try
            {
                if(txtpswd.Value==txtcnfpswd.Value)
                { 
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_UserRegistration", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", txtname.Value);
                cmd.Parameters.AddWithValue("@DOB", txtbirthday.Value);
                cmd.Parameters.AddWithValue("@ContactNo", txtmob.Value);
                cmd.Parameters.AddWithValue("@Email", txtemail.Value);
                cmd.Parameters.AddWithValue("@Password", txtpswd.Value);
                cmd.Parameters.AddWithValue("@IsActive", true);
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    lblmsg.Text = "You Have Been Successfully Registered....";
                    ClearSection();
                }
                else
                {
                    lblmsg.Text = "Technical Error !!! Please Try After Sometime...";
                }
                con.Close();
                }
                else
                {
                    lblmsg.Text = "Passwords Don't Matched !!! Please Try Again...";
                }
            }
            
            catch (Exception ex)
            {
                throw ex;
            }
        }


        /// <summary>
        /// code for clearing the fields after submitting details..
        /// </summary>
        void ClearSection()
        {
            try
            {
                txtname.Value = "";
                txtmob.Value = "";
                txtemail.Value = "";
                txtbirthday.Value = "";
                txtpswd.Value = "";
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }


        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                userRegistration();
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