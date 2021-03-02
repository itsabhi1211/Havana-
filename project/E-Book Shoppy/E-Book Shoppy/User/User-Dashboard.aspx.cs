using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace E_Book_Shoppy.User
{
    public partial class User_Dashboard : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null )
            {
                Response.Redirect("../User-login.aspx");

               
            }
            displaydata();
            displaydata1();
            showprofilepicture();
        }

        void displaydata()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tblreg where Id=@id ", con);
                cmd.Parameters.AddWithValue("@id", Convert.ToInt32(Session["userid"].ToString()));
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {

                    lblname.Text = reader["NAME"].ToString();
                    lbldob.Text = reader["DOB"].ToString();
                    lblcontact.Text = reader["ContactNo"].ToString();
                    lblemail.Text = reader["Email"].ToString();




                }
                con.Close();


            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
        void displaydata1()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tblprofile where Id=@id", con);
                cmd.Parameters.AddWithValue("@id", Convert.ToInt32(Session["userid"].ToString()));
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblstate.Text = reader["State"].ToString();
                    lblcity.Text = reader["City"].ToString();
                    lbladd.Text = reader["Address"].ToString();
                    lblpincode.Text = reader["Pincode"].ToString();




                }
                con.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to show profile picture...
        /// </summary>
        void showprofilepicture()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tblProfilePictures where Id=@id ", con);
                cmd.Parameters.AddWithValue("@id", Convert.ToInt32(Session["userid"].ToString()));

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {

                    img1.ImageUrl = reader["Image"].ToString();
                    
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