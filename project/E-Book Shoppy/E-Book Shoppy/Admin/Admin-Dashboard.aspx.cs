using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace E_Book_Shoppy.Admin
{
    public partial class Admin_Dashboard : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["userid"]==null)
            {
                Response.Redirect("Admin-login.aspx");
            }
            if (!IsPostBack)
            {
                countuserregistered();
            }
        }

        void countuserregistered()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT COUNT(IsActive) as Total FROM tblreg WHERE IsActive='1'", con);
                SqlCommand cmd1 = new SqlCommand("SELECT COUNT(IsActive) as Total FROM tblBook WHERE IsActive='1'", con);
                SqlCommand cmd2 = new SqlCommand("SELECT COUNT(IsActive) as Total FROM tblMagzine WHERE IsActive='1'", con);
                SqlCommand cmd3 = new SqlCommand("SELECT COUNT(IsActive) as Total FROM tblUpcomings WHERE IsActive='1'", con);
                Int32 count = Convert.ToInt32(cmd.ExecuteScalar());
                Int32 count1 = Convert.ToInt32(cmd1.ExecuteScalar());
                Int32 count2 = Convert.ToInt32(cmd2.ExecuteScalar());
                Int32 count3 = Convert.ToInt32(cmd3.ExecuteScalar());
                if (count > 0)
                {
                    lblusers.Text = Convert.ToString(count.ToString());
                    lblbooks.Text = Convert.ToString(count1.ToString());
                    lblmsg.Text = Convert.ToString(count2.ToString());
                    lblupcoming.Text = Convert.ToString(count3.ToString());
                }
                else
                {
                    lblusers.Text = "Not Any User Have Registered Yet..";
                    lblbooks.Text = "Not Any Book Have Been Uploaded Yet..";
                    lblmsg.Text = "Not Any Magzine Have Been Uploaded Yet..";
                    lblupcoming.Text = "Not Any Upcoming Have Been Uploaded Yet..";
                }
                con.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}