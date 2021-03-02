using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana
{
    public partial class User_login : System.Web.UI.Page
    {
        InsertionLayer objlayer = new InsertionLayer();
        tblreg reg = new tblreg();
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                try
                {
                    Random rnum = new Random();
                    hdfapp.Value = "Regno" + Convert.ToString(rnum.Next(100, 999));

                }
                catch (Exception ex)
                {
                    lblmsg.Text = ex.Message;
                    lblmsg.Attributes.Add("style", "color:red");
                }
            }
        }

        void registrationcode()
        {
            try
            {
                var q = objlayer.checkifmailorcontactexist(txtemail.Value, Convert.ToInt64(txtcontact.Value));

                if (q.Any())
                {
                    lblmsg.Text = "Email Or Contact Already Exists.Please Try With Another Contact Or Email";
                    lblmsg.Attributes.Add("style", "color:red");

                }
                else
                {
                    if (txtpassword.Value == txtcnfpassword.Value)
                    {
                        reg.RegNo = Convert.ToString(hdfapp.Value);
                        reg.Name = txtname.Value;
                        reg.Password = txtpassword.Value;
                        reg.ContactNo = Convert.ToInt64(txtcontact.Value);
                        reg.Email = txtemail.Value;
                        int Issuccessfull = InsertionLayer.userregistration(reg);
                        if (Issuccessfull == 1)
                        {
                            lblmsg.Text = "Registration Was Successfull.Once Registration Approved You can login Into Profile.";
                            lblmsg1.Text= "Your Registration Number Is " + hdfapp.Value + "Keep It For Future Reference.";
                            lblmsg.Attributes.Add("style", "color:green");
                            txtname.Value = "";
                            txtpassword.Value = "";
                            txtemail.Value = "";
                            txtcontact.Value = "";
                            txtcnfpassword.Value = "";
                        }
                        else
                        {
                            lblmsg.Text = "Technical Error.Try After Sometime";
                            lblmsg.Attributes.Add("style", "color:red");
                        }
                    }
                    else
                    {
                        lblmsg.Text = "Password Do Not Match";
                        lblmsg.Attributes.Add("style", "color:red");
                    }

                }
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.Attributes.Add("style", "color:red");
            }
        }




        protected void btnsbmt_Click(object sender, EventArgs e)
        {
            try
            {
                registrationcode();
                lblmsg.Visible = true;
                lblmsg1.Visible = true;
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.Attributes.Add("style", "color:red");
            }
        }
    }
}
