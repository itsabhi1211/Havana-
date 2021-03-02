using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using HavanaDAL;

namespace Havana
{
    public partial class Listing : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        public DataTable dt;
        public char[] mychar = { '~', '/' };
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {
                Propertydetails();
            }
        }

        void Propertydetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_propertydetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
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