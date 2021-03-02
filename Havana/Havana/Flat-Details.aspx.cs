using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace Havana
{
    public partial class Flat_Details : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        public DataTable dt;
        public DataTable dt1;
        public DataTable dt2;
        public char[] mychar = { '~', '/' };
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                bindflatDetails();
               
            }
        }

       

        /// <summary>
        /// code to bind flats for seeing whether it is booked or not....
        /// </summary>
        void bindflatDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd = new SqlCommand("select BlockNo from tblavailableblocks where BlockId=9 ", con);
                SqlCommand cmd1 = new SqlCommand("select BlockNo from tblavailableblocks where BlockId=8 ", con);
                SqlCommand cmd2 = new SqlCommand("select BlockNo from tblavailableblocks where BlockId=7 ", con);                
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
                SqlDataAdapter sda2 = new SqlDataAdapter(cmd2);
                dt = new DataTable();
                dt1 = new DataTable();
                dt2 = new DataTable();
                sda.Fill(dt);
                sda1.Fill(dt1);
                sda2.Fill(dt2);

                con.Close();
                
                
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }



       

  

    }
}