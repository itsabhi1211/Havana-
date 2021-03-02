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
    public partial class Magzines : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        public DataTable dt;
        public char[] mychar = { '~', '/' };
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                MagzineImagesWithdetails();
            }
        }

        void MagzineImagesWithdetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tblMagzine", con);
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

        protected void btnorder_Click(object sender, EventArgs e)
        {

        }
    }
}