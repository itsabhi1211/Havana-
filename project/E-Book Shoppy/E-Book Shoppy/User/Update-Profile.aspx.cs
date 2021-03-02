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

namespace E_Book_Shoppy.User
{
    public partial class Update_Profile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("../User-login.aspx");
            }
            hdfvalue.Value = Session["userid"].ToString();
            if (!IsPostBack)
            {
                RegDetails();
                ProfileDetails();
                showprofilepicture();

            }
            
        }

        /// <summary>
        /// code to update profile details
        /// </summary>
        void UpdateProfile()
        {
            
            try
            {
                
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_profile", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RegId", hdfvalue.Value);
                cmd.Parameters.AddWithValue("@Gender",ddlgender.SelectedValue);
                cmd.Parameters.AddWithValue("@State",txtstate.Value);
                cmd.Parameters.AddWithValue("@City",txtcity.Value);
                cmd.Parameters.AddWithValue("@Address",txtadd.Value);
                cmd.Parameters.AddWithValue("@Pincode",txtpin.Value);
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    lblmsg1.Text = "You Have Successfully Updated Your Details....";
                   
                }
                else
                {
                    lblmsg1.Text = "Technical Error !!! Please Try After Sometime...";
                }
                con.Close();
            }
            catch(Exception ex)
            {
                lblmsg1.Text = ex.Message;
            }

        }

       
        /// <summary>
        /// code to show registration details...
        /// </summary>
        void RegDetails()
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
                    txtname.Value = reader["Name"].ToString();
                    txtdob.Value = reader["DOB"].ToString();
                    txtcontactno.Value = reader["ContactNo"].ToString();
                    txtmail.Value = reader["Email"].ToString();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }


        /// <summary>
        /// code to show profile details....
        /// </summary>
        void ProfileDetails()
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
                    txtstate.Value = reader["State"].ToString();
                    txtcity.Value = reader["City"].ToString();
                    txtadd.Value = reader["Address"].ToString();
                    txtpin.Value = reader["Pincode"].ToString();
                    ddlgender.SelectedValue = reader["Gender"].ToString();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        /// <summary>
        /// code to edit Registration details...
        /// </summary>
        void EditRegDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("sp_UpdateUserDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Parameters.AddWithValue("@userid", Convert.ToInt32(Session["userid"].ToString()));
                cmd.Parameters.AddWithValue("@Name", txtname.Value);
                cmd.Parameters.AddWithValue("@DOB", txtdob.Value);
                cmd.Parameters.AddWithValue("@ContactNo",txtcontactno.Value);
                cmd.Parameters.AddWithValue("@Email", txtmail.Value);
                cmd.ExecuteNonQuery();
                con.Close();


            }
            catch(Exception ex)
            {
                lblmsg1.Text = ex.Message;
            }
        }

        /// <summary>
        /// code to edit profile details...
        /// </summary>
        void EditProfileDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("sp_Updateuserprofiledetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Parameters.AddWithValue("@userid", Convert.ToInt32(Session["userid"].ToString()));
                cmd.Parameters.AddWithValue("@Gender", ddlgender.SelectedValue);
                cmd.Parameters.AddWithValue("@State", txtstate.Value);
                cmd.Parameters.AddWithValue("@City", txtcity.Value);
                cmd.Parameters.AddWithValue("@Address", txtadd.Value);
                cmd.Parameters.AddWithValue("@Pincode", txtpin.Value);
                cmd.ExecuteNonQuery();
                con.Close();
                lblmsg1.Text = "You have Updated Successfully";


            }
            catch(Exception ex)
            {
                lblmsg1.Text = ex.Message;
            }
        }

        /// <summary>
        /// code to submit details...
        /// </summary>
        void Submitdetails()
        {
            try
            {
                if(Session["userid"].ToString()!=null)
                {
                    EditProfileDetails();
                    EditRegDetails();
                }
                else
                {
                    UpdateProfile();
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// btn click events...
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnupdate_Click(object sender, EventArgs e)
        {
            try
            {
                Submitdetails();
                lblmsg1.Visible = true;
                lblmsg1.Focus();
            }
            catch(Exception ex)
            {
                throw ex;

            }
        }


        /// <summary>
        /// code to update profile picture...
        /// </summary>
        void updateprofilepicture()
        {
            string s1 = "";
            try
            {
                string FileName = "";
                string FilePath = "~/Images";
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
                SqlCommand cmd = new SqlCommand("sp_updateProfilePicture ", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RegId", hdfvalue.Value);
                cmd.Parameters.AddWithValue("@Image", s1);
                img1.Src = s1;
                
               int i= cmd.ExecuteNonQuery();
                if(i>0)
                {
                    lblmsg1.Text = "Profile Picture Uploaded Successfully";
                }
                else
                {
                    lblmsg1.Text = "Failed...!!!!";
                }
                con.Close();
            }
            catch(Exception ex)
            {
                throw ex;
            }
            
        }


        /// <summary>
        /// code to edit profile picture..
        /// </summary>
        void EditProfilePicture()
        {
            string s1 = "";
            try
            {
                string FileName = "";
                string FilePath = "~/Images";
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
                SqlCommand cmd = new SqlCommand("sp_editProfilePicture ", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userid", Convert.ToInt32(Session["userid"].ToString()));
                cmd.Parameters.AddWithValue("@Image", s1);
                img1.Src = s1;

                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    lblmsg1.Text = "Profile Picture Uploaded Successfully";
                }
                else
                {
                    lblmsg1.Text = "Failed...!!!!";
                }
                con.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to submit profile pictures...
        /// </summary>
        void Submit()
        {
            try
            {
                if (Session["userid"].ToString() != null)
                {
                    EditProfilePicture();

                }
                else
                {
                    updateprofilepicture();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// btn click event..
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnuploadimage_Click(object sender, EventArgs e)
           {
            try
            {
                Submit();
                lblmsg1.Visible = true;
                lblmsg1.Focus();
            }
            catch(Exception ex)
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
                   
                    img1.Src = reader["Image"].ToString();
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