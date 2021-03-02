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
    public partial class Contact_Us : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// code to enter in contact us form...
        /// </summary>
        void ContactUs()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_contactus", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", txtname.Value);
                cmd.Parameters.AddWithValue("@Message", txtmsg.Value);
                cmd.Parameters.AddWithValue("@Email", txtemail.Value);
                cmd.Parameters.AddWithValue("@Subject", txtsub.Value);
                cmd.Parameters.AddWithValue("@ContactNo", txtno.Value);
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    lblmsg.Text = "You Have Successfully Submitted Your Details....";
                    ClearSection();
                }
                else
                {
                    lblmsg.Text = "Technical Error !!! Please Try After Sometime...";
                }
                con.Close();
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }

        /// <summary>
        /// code to clear details after submission...
        /// </summary>
        void ClearSection()
        {
            try
            {
                txtsub.Value = "";
                txtname.Value = "";
                txtmsg.Value = "";
                txtemail.Value = "";
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
                ContactUs();
                lblmsg.Visible = true;
                lblmsg.Focus();
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }
    }
}