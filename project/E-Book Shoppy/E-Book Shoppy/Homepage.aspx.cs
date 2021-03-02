using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace E_Book_Shoppy
{
    public partial class Homepage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        public DataTable dt;
        public DataTable dt1;
        public DataTable dt2;

        public char[] mychar = { '~', '/' };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                booksImagesWithdetails();
                MagzineImagesWithdetails();
                Upcomings();
            }
        }

        /// <summary>
        /// code to bind books with its details..
        /// </summary>
        void booksImagesWithdetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tblBook", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                con.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        void MagzineImagesWithdetails()
        {
            try
            {
                
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd1 = new SqlCommand("select * from tblMagzine", con);
                SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
                dt1 = new DataTable();
                sda1.Fill(dt1);
                con.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        void Upcomings()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tblUpcomings", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
               dt2 = new DataTable();
                sda.Fill(dt2);
                con.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }






    }
}