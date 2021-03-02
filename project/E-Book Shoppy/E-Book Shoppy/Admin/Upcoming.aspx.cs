using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace E_Book_Shoppy.Admin
{
    public partial class Upcoming : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           if(!IsPostBack)
            {
                gridBind();
            }
        }

        /// <summary>
        /// code to upload upcoming
        /// </summary>
        void UpcomingBooksandMagzines()
        {
            string s1 = "";
            try
            {
                string FileName = "";
                string FilePath = "~/images";
                if (txtfile.PostedFile.ContentLength > 0 && txtfile.PostedFile != null)
                {
                    FileName = Guid.NewGuid().ToString() + Path.GetExtension(txtfile.FileName);
                    string Extension = Path.GetExtension(txtfile.FileName);
                    int Length = txtfile.PostedFile.ContentLength;
                    #region checking out File Length

                    if (Length <= 1000000)
                    {
                        #region Checking file Extensions
                        switch (Extension.ToLower())
                        {
                            case ".jpg":
                                txtfile.SaveAs(Server.MapPath(FilePath + FileName));
                                //img1.ImageUrl = FilePath + FileName;
                                break;

                            case ".jpeg":
                                txtfile.SaveAs(Server.MapPath(FilePath + FileName));
                                //img1.ImageUrl = FilePath + FileName;
                                break;

                            case ".png":
                                txtfile.SaveAs(Server.MapPath(FilePath + FileName));
                                //img1.ImageUrl = FilePath + FileName;
                                break;

                            default:
                                lblmsg1.Text = "Only jpg jpeg and png file accepted";
                                lblmsg1.ForeColor = System.Drawing.Color.Red;
                                break;

                        }
                        #endregion
                    }
                    else
                    {
                        lblmsg1.Text = "File must be  less than 1 mb";
                        lblmsg1.ForeColor = System.Drawing.Color.Red;
                    }
                    #endregion
                }
                else
                {
                    lblmsg1.Text = "please choose the file";
                    lblmsg1.ForeColor = System.Drawing.Color.Red;
                }
                s1 = FilePath + FileName;
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_Upcomings", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", txtmagname.Text);
                cmd.Parameters.AddWithValue("@Author", txtauthor.Text);
                cmd.Parameters.AddWithValue("@Publisher", txtpublisher.Text);
                cmd.Parameters.AddWithValue("@Year", txtyear.Text);
                cmd.Parameters.AddWithValue("@Price", txtprice.Text);
                cmd.Parameters.AddWithValue("@For", ddltype.SelectedValue);
                cmd.Parameters.AddWithValue("@Image", s1);
                cmd.Parameters.AddWithValue("@IsActive", true);
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    lblmsg1.Text = "You Have Successfully Uploaded the Upcoming With Its Proper Details....";
                    ClearSection();
                }
                else
                {
                    lblmsg1.Text = "Technical Error !!! Please Try After Sometime...";
                }
                con.Close();
            }

            catch (Exception ex)
            {
                lblmsg1.Text = ex.Message;
            }
        }


        /// <summary>
        /// code to clear section..
        /// </summary>
        void ClearSection()
        {
            txtprice.Text = "";
            txtmagname.Text = "";
            txtauthor.Text = "";
            txtpublisher.Text = "";
            txtyear.Text = "";
            ddltype.ClearSelection();

        }

        /// <summary>
        /// code to bind upcomings details...
        /// </summary>
        void gridBind()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tblUpcomings", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                grdshwdetails.DataSource = dt;
                grdshwdetails.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnupload_Click(object sender, EventArgs e)
        {
            try
            {
                UpcomingBooksandMagzines();
                lblmsg1.Visible = true;
                lblmsg1.Focus();
                gridBind();

            }
            catch (Exception ex)
            {
                lblmsg1.Text = ex.Message;
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
                SqlCommand cmd = new SqlCommand("delete from tblUpcomings where ID=" + Convert.ToInt32(ID) + "", con);
                cmd.ExecuteNonQuery();
                con.Close();
                gridBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}