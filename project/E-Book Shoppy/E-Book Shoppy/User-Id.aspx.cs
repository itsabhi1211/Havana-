using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace E_Book_Shoppy.Admin
{
    public partial class User_Id : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// code to change password
        /// </summary>
        void changepassword()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("Select * from tblreg where ContactNo=@UserId or Email=@UserId", con);
                cmd.Parameters.AddWithValue("@UserId", txtuserid.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                con.Open();
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    Session["UserId"] = dt.Rows[0]["Email"].ToString();

                    Response.Redirect("Change-Password.aspx");
                }
                else
                {
                    lblmsg.Text = "Invalid UserId... Please Try Again !!!";
                    txtuserid.Text = "";




                }
            }
            catch (Exception ex)
            {
                lblmsg.Visible = true;
                throw ex;
            }
        }



        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                changepassword();
                lblmsg.Visible = true;
                lblmsg.Focus();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}