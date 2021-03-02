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
    public partial class Books : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        public DataTable dt;
        public char[] mychar = { '~', '/' };
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                booksImagesWithdetails();
            }
        }
        /// <summary>
        /// code to bind details of images with picture...
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
            catch(Exception ex)
            {
                throw ex;
            }
        }

        protected void btnorder_Click(object sender, EventArgs e)
        {
            try
            {
                //string aut = lblauthor.InnerText;
                //string name = lblname.InnerText;
                //string pub = lblpublisher.InnerText;
                //string price = lblprice.InnerText.ToString();
                //Response.Redirect(String.Format("Bag.aspx?aut{0)&name{1}&pub{2}&price{3}=" + Server.UrlEncode(aut),Server.UrlEncode(name),Server.UrlEncode(pub),Server.UrlEncode(price)));
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}