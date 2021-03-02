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
    public partial class Bag : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

                if (Request.QueryString["Id"] == null)
                {
                    Response.Redirect("Homepage.aspx");
                }

                if (Session["userid"] == null)
                {
                    Response.Redirect("User-login.aspx");
                }
                getMagzinedetailsInQueryString();
                getBookdetailsInQueryString();
                
               
            }
        }


        /// <summary>
        /// code to get book details...
        /// </summary>
        void getBookdetailsInQueryString()
        {
            try
            {
                if(Request.QueryString!=null)
                {
                    string val = Convert.ToInt32(Request.QueryString["Id"]).ToString();

                    SqlConnection con = new SqlConnection(strcon);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select * from tblBook where Id=@val ", con);
                    cmd.Parameters.AddWithValue("@val", Convert.ToInt32(Request.QueryString["Id"]));
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {

                        lblname.Text = reader["Name"].ToString();
                        lblauthor.Text = reader["Author"].ToString();
                       lblpublisher.Text = reader["Publisher"].ToString();
                        lblprice.Text = reader["Price"].ToString();

                    }
                    con.Close();

                }

            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to get magzine details...
        /// </summary>
        void getMagzinedetailsInQueryString()
        {
            try
            {
                if (Request.QueryString != null)
                {
                    string val = Convert.ToInt32(Request.QueryString["Id"]).ToString();

                    SqlConnection con = new SqlConnection(strcon);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select * from tblMagzine where Id=@val ", con);
                    cmd.Parameters.AddWithValue("@val", Convert.ToInt32(Request.QueryString["Id"]));
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {

                        lblname.Text = reader["Name"].ToString();
                        lblauthor.Text = reader["Author"].ToString();
                        lblpublisher.Text = reader["Publisher"].ToString();
                        lblprice.Text = reader["Price"].ToString();

                    }
                    con.Close();

                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        void Makeorder()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_Order", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RegId", Convert.ToInt32(Session["userid"]));
                cmd.Parameters.AddWithValue("@BookName", lblname.Text);
                cmd.Parameters.AddWithValue("@No_Of_Items", ddlcount.SelectedValue);
                cmd.Parameters.AddWithValue("@Price", lbltotalprice.Text);
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    lblmsg.Text = "You Have Successfully Ordered Your Book....";
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

        protected void btnorder_Click(object sender, EventArgs e)
        {
            try
            {
                Makeorder();
                lblmsg.Visible = true;
                lblmsg.Focus();
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

      /// <summary>
      /// code to calculate price...
      /// </summary>
      /// <param name="sender"></param>
      /// <param name="e"></param>

        protected void ddlcount_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int count = 0, price = 0, totalprice = 0;
                if ((!string.IsNullOrEmpty(ddlcount.SelectedValue) && (!string.IsNullOrEmpty(lblprice.Text))))
                {
                    price = Convert.ToInt32(lblprice.Text);
                    count = Convert.ToInt32(ddlcount.SelectedValue);
                    totalprice = count * price;
                    lbltotalprice.Text = Convert.ToString(totalprice);
                    lbltotalprice.Focus();

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}