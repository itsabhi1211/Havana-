using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace E_Book_Shoppy
{
    public partial class Admin_login : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void login()
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("sp_Adminlogin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserId", (txtuserid.Value));
                cmd.Parameters.AddWithValue("@password", txtpassword.Value);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                con.Open();
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    Session["userid"] = dt.Rows[0]["UserId"].ToString();

                    Response.Redirect("~/Admin/Admin-Dashboard.aspx");
                }

                else
                {

                    lblmsg.Text = "WRONG USERID OR PASSWORD  !!!";
                    lblmsg.Focus();
                    lblmsg.Visible = true;
                }
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
                login();
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}