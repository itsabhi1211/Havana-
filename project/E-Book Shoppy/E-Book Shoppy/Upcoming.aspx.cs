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
    public partial class Upcoming : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        public DataTable dt;

        public char[] mychar = { '~', '/' };
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Upcomings();
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
                dt = new DataTable();
                sda.Fill(dt);
                con.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}