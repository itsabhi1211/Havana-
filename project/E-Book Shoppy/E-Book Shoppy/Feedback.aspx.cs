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
    public partial class Feedback : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void feedback()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_feedback", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", txtname.Value);
                cmd.Parameters.AddWithValue("@Feedback", txtmsg.Value);
                cmd.Parameters.AddWithValue("@Email", txtemail.Value);
                cmd.Parameters.AddWithValue("@Rating", ddlrating.SelectedValue);
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    lblmsg.Text = "Thank you for your valuable feedback....";
                    ClearSection();
                }
                else
                {
                    lblmsg.Text = "Failed !!! Please Try After Sometime...";
                }
                con.Close();
            }
            catch (Exception ex)
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
                ddlrating.ClearSelection();
                txtname.Value = "";
                txtmsg.Value = "";
                txtemail.Value = "";
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                feedback();
                lblmsg.Visible = true;
                lblmsg.Focus();
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }
    }
}