using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;
using System.IO;

namespace Havana.User
{
    public partial class Profile : System.Web.UI.Page
    {
        ShowDataLayer objshow = new ShowDataLayer();
        tblprofile profile = new tblprofile();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showuserdata();
                lblmail.Text = Convert.ToString(Session["Email"]);
                profileimg.Src = objshow.GetFileNameOnRegId(Convert.ToInt32(Session["Id"]));
            }
        }

        /// <summary>
        /// code to show user profile info
        /// </summary>

        void showuserdata()
        {
            var q = objshow.showuserdata(Convert.ToInt32(Session["Id"]));
            foreach (tblprofile s in q)
            {
                lbladd.Text = s.Address;
                lblcity.Text = s.City;
                lblstate.Text = s.State;
                lblpin.Text = s.Pin.ToString();
                lbldob.Text = string.Format("{0:dd-MM-yyyy}", s.DOB);

                txtadd.Value = s.Address;
                txtadd.Attributes.Add("readonly", "readonly");
                txtcity.Value = s.City;
                txtcity.Attributes.Add("readonly", "readonly");
                txtstate.Value = s.State;
                txtstate.Attributes.Add("readonly", "readonly");
                txtpin.Value = s.Pin.ToString();
                txtpin.Attributes.Add("readonly", "readonly");
               


            }
            var x = objshow.showreguserdata(Convert.ToInt32(Session["Id"]));
            foreach (tblreg s in x)
            {
                lblname.Text = s.Name;
                txtadd.Attributes.Add("readonly", "readonly");
                lblcontact.Text = s.ContactNo.ToString();
                txtemail.Value = s.Email;
                txtemail.Attributes.Add("readonly", "readonly");
                txtcontactno.Value = s.ContactNo.ToString();
                txtcontactno.Attributes.Add("readonly", "readonly");
            }
        }



        /// <summary>
        /// code to update profile picture...
        /// </summary>
        void updateprofilePicture()
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

                                Editlayer.UpdateProfilePicture(Convert.ToInt32(Session["Id"]), s1);
                                lblmsg.Text = "Profile Updated Successfully.";
                                lblmsg.ForeColor = System.Drawing.Color.Green;
                                profileimg.Src = s1;

                                break;

                            #endregion


                            #region When File Extension Is .JPEG

                            case ".jpeg":

                                txtimg.SaveAs(Server.MapPath(FilePath + FileName));

                                Editlayer.UpdateProfilePicture(Convert.ToInt32(Session["Id"]), s1);
                                lblmsg.Text = "Profile Updated Successfully.";
                                lblmsg.ForeColor = System.Drawing.Color.Green;
                                profileimg.Src = s1;
                                break;

                            #endregion


                            #region When File Extension Is .PNG

                            case ".png":

                                txtimg.SaveAs(Server.MapPath(FilePath + FileName));
                                Editlayer.UpdateProfilePicture(Convert.ToInt32(Session["Id"]), s1);
                                lblmsg.Text = "Profile Updated Successfully.";
                                lblmsg.ForeColor = System.Drawing.Color.Green;
                                profileimg.Src = s1;
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
                    lblmsg.Text = "Upload Failed..";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
            }

            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }

        protected void btnupld_Click(object sender, EventArgs e)
        {
            try
            {
                updateprofilePicture();
                Server.Transfer("Profile.aspx");
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}