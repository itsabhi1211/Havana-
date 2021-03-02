using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using HavanaDAL;

namespace Havana.User
{
    public partial class Update_profile : System.Web.UI.Page
    {
        InsertionLayer objlayer = new InsertionLayer();
        ShowDataLayer objshow = new ShowDataLayer();
        tblprofile profile = new tblprofile();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var q = objshow.showuserdata(Convert.ToInt32(Session["Id"]));
                if (q.Any())
                {
                    foreach (tblprofile k in q)
                    {
                        txtaddress.Value = k.Address;
                        txtcity.Value = k.City;
                        txtpincode.Value = (k.Pin).ToString();
                        txtdob.Value = (k.DOB).ToString();
                        txtstate.Value = k.State;
                        ddlgender.Text = k.Gender.ToString();
                        hdf1.Value = k.Picture;

                    }


                }
            }


        }

        /// <summary>
        /// code to insert profile details...
        /// </summary>
        void profileInsertion()
        {
            string s1 = "";
            try
            {
                string FileName = "";
                string FilePath = "Userprofilepictures/";

                if (txtimg.PostedFile.ContentLength > 0 && txtimg.PostedFile != null)
                {
                    FileName = Guid.NewGuid().ToString() + Path.GetExtension(txtimg.FileName);
                    string Extension = Path.GetExtension(txtimg.FileName);
                    int Length = txtimg.PostedFile.ContentLength;
                    s1 = FilePath + FileName;
                    #region checking out File Length

                    if (Length <= 1000000)
                    {
                        #region Checking file Extensions

                        switch (Extension.ToLower())
                        {
                            #region When File Extension Is .JPG

                            case ".jpg":
                                txtimg.SaveAs(Server.MapPath(FilePath + FileName));
                                profile.RegId = Convert.ToInt32(Session["Id"]);
                                profile.Picture = s1;
                                profile.Gender = Convert.ToChar(ddlgender.SelectedValue);
                                profile.State = txtstate.Value;
                                profile.City = txtcity.Value;
                                profile.Address = txtaddress.Value;
                                profile.Pin = Convert.ToInt64(txtpincode.Value);
                                profile.DOB = Convert.ToDateTime(txtdob.Value);
                                InsertionLayer.userprofileinsertion(profile);
                                lblmsg.Text = "Profile Updated Successfully.";
                                lblmsg.ForeColor = System.Drawing.Color.Green;
                                clearsection();
                                // img1.ImageUrl = FilePath + FileName;


                                break;

                            #endregion


                            #region When File Extension Is .JPEG

                            case ".jpeg":
                                txtimg.SaveAs(Server.MapPath(FilePath + FileName));
                                profile.RegId = Convert.ToInt32(Session["Id"]);
                                profile.Picture = s1;
                                profile.Gender = Convert.ToChar(ddlgender.SelectedItem.Text);
                                profile.State = txtstate.Value;
                                profile.City = txtcity.Value;
                                profile.Address = txtaddress.Value;
                                profile.Pin = Convert.ToInt64(txtpincode.Value);
                                profile.DOB = Convert.ToDateTime(txtdob.Value);
                                InsertionLayer.userprofileinsertion(profile);
                                lblmsg.Text = "Profile Updated Successfully.";
                                lblmsg.ForeColor = System.Drawing.Color.Green;
                                // img1.ImageUrl = FilePath + FileName;
                                clearsection();
                                break;

                            #endregion


                            #region When File Extension Is .PNG

                            case ".png":
                                txtimg.SaveAs(Server.MapPath(FilePath + FileName));
                                profile.RegId = Convert.ToInt32(Session["Id"]);
                                profile.Picture = s1;
                                profile.Gender = Convert.ToChar(ddlgender.SelectedItem.Text);
                                profile.State = txtstate.Value;
                                profile.City = txtcity.Value;
                                profile.Address = txtaddress.Value;
                                profile.Pin = Convert.ToInt64(txtpincode.Value);
                                profile.DOB = Convert.ToDateTime(txtdob.Value);
                                InsertionLayer.userprofileinsertion(profile);
                                lblmsg.Text = "Profile Updated Successfully.";
                                lblmsg.ForeColor = System.Drawing.Color.Green;
                                clearsection();
                                // img1.ImageUrl = FilePath + FileName;
                                break;

                            #endregion

                            default:
                                lblmsg.Text = "Only jpg jpeg and png file accepted";
                                lblmsg.ForeColor = System.Drawing.Color.Red;
                                break;

                        }

                        #endregion
                    }
                    else
                    {
                        lblmsg.Text = "File must be  less than 1 mb";
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                    }
                    #endregion

                }
                else
                {

                    profile.RegId = Convert.ToInt32(Session["Id"]);
                    profile.Picture = "img/avatar.png";
                    profile.Gender = Convert.ToChar(ddlgender.SelectedValue);
                    profile.State = txtstate.Value;
                    profile.City = txtcity.Value;
                    profile.Address = txtaddress.Value;
                    profile.Pin = Convert.ToInt64(txtpincode.Value);
                    profile.DOB = Convert.ToDateTime(txtdob.Value);
                    InsertionLayer.userprofileinsertion(profile);
                    lblmsg.Text = "Profile Updated Successfully.";
                    lblmsg.ForeColor = System.Drawing.Color.Green;
                    clearsection();
                }


            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        /// <summary>
        /// code to update profile details....
        /// </summary>
        void Update()
        {
            try
            {
                string FileName = "";
                string FilePath = "Userprofilepictures/";

                string PreviousFile = objshow.GetFileNameOnRegId(Convert.ToInt32(Session["Id"]));
                string MapPath = Server.MapPath(PreviousFile);

                if (txtimg.PostedFile.ContentLength > 0 && txtimg.PostedFile != null)
                {
                    if (File.Exists(MapPath))
                    {
                        File.Delete(MapPath);
                    }
                    FileName = Guid.NewGuid().ToString() + Path.GetExtension(txtimg.FileName);
                    string Extension = Path.GetExtension(txtimg.FileName);
                    int Length = txtimg.PostedFile.ContentLength;
                    string s1 = FilePath + FileName;
                    #region checking out File Length

                    if (Length <= 1000000)
                    {
                        #region Checking file Extensions

                        switch (Extension.ToLower())
                        {
                            #region When File Extension Is .JPG

                            case ".jpg":
                                txtimg.SaveAs(Server.MapPath(FilePath + FileName));

                                Editlayer.updateuserprofile(Convert.ToInt32(Session["Id"]), txtstate.Value, txtcity.Value, txtaddress.Value, Convert.ToInt64(txtpincode.Value), Convert.ToDateTime(txtdob.Value), s1);
                                lblmsg.Text = "Profile Updated Successfully.";
                                lblmsg.ForeColor = System.Drawing.Color.Green;

                                break;

                            #endregion


                            #region When File Extension Is .JPEG

                            case ".jpeg":

                                txtimg.SaveAs(Server.MapPath(FilePath + FileName));

                                Editlayer.updateuserprofile(Convert.ToInt32(Session["Id"]), txtstate.Value, txtcity.Value, txtaddress.Value, Convert.ToInt64(txtpincode.Value), Convert.ToDateTime(txtdob.Value), s1);
                                lblmsg.Text = "Profile Updated Successfully.";
                                lblmsg.ForeColor = System.Drawing.Color.Green;
                                break;

                            #endregion


                            #region When File Extension Is .PNG

                            case ".png":

                                txtimg.SaveAs(Server.MapPath(FilePath + FileName));

                                Editlayer.updateuserprofile(Convert.ToInt32(Session["Id"]), txtstate.Value, txtcity.Value, txtaddress.Value, Convert.ToInt64(txtpincode.Value), Convert.ToDateTime(txtdob.Value), s1);
                                lblmsg.Text = "Profile Updated Successfully.";
                                lblmsg.ForeColor = System.Drawing.Color.Green;
                                break;

                            #endregion

                            default:
                                lblmsg.Text = "Only jpg jpeg and png file accepted";
                                lblmsg.ForeColor = System.Drawing.Color.Red;
                                break;

                        }

                        #endregion
                    }
                    else
                    {
                        lblmsg.Text = "File must be  less than 1 mb";
                        lblmsg.ForeColor = System.Drawing.Color.Red;

                    }
                    #endregion

                }
                else
                {
                    Editlayer.updateuserprofile(Convert.ToInt32(Session["Id"]), txtstate.Value, txtcity.Value, txtaddress.Value, Convert.ToInt64(txtpincode.Value), Convert.ToDateTime(txtdob.Value), hdf1.Value);
                }


            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        /// <summary>
        /// code to submit details..
        /// </summary>
        void SubmitDetails()
        {
            var q = objshow.showuserdata(Convert.ToInt32(Session["Id"]));
            if (q.Any())
            {
                Update();
            }
            else
            {
                profileInsertion();
            }
        }

        /// <summary>
        /// code to clear section...
        /// </summary>
        void clearsection()
        {
            txtaddress.Value = "";
            txtcity.Value = "";
            txtdob.Value = "";
            txtpincode.Value = "";
            txtstate.Value = "";
            ddlgender.ClearSelection();
        }

       

        /// <summary>
        /// code to submit on click...
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnsbmt_Click(object sender, EventArgs e)
        {
            try
            {
                SubmitDetails();
                lblmsg.Visible = true;


            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Visible = true;
            }
        }
    }
}