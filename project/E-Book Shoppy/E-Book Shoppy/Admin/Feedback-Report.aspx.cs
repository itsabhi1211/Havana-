using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace E_Book_Shoppy.Admin
{
    public partial class Feedback_Report : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                bindFeedbackDetails();
            }
        }

        /// <summary>
        /// code to bind feedback details....
        /// </summary>
        void bindFeedbackDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tblFeedback",con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                grdshwdetails.DataSource = dt;
                grdshwdetails.DataBind();
                con.Close();

            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }

        protected void grdshwdetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grdshwdetails.PageIndex = e.NewPageIndex;
                grdshwdetails.DataBind();
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }

        protected void grdshwdetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                string ID = ((Label)grdshwdetails.Rows[e.RowIndex].FindControl("lblid")).Text;
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from tblFeedback where ID=" + Convert.ToInt32(ID) + "", con);
                cmd.ExecuteNonQuery();
                con.Close();
                bindFeedbackDetails();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}