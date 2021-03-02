using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana
{
    public partial class Feedback : System.Web.UI.Page
    {
        InsertionLayer objlayer = new InsertionLayer();
        tblfeedback fdbck = new tblfeedback();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// code to give feedback...
        /// </summary>
        
        void feedback()       
        {
            try
            {
                fdbck.Name = txtname.Value;
                fdbck.Email = txtemail.Value;
                fdbck.ContactNo = Convert.ToInt64(txtnum.Value);
                fdbck.Msg = txtmsg.Value;
                fdbck.Rating = Convert.ToChar(rbl.SelectedValue);
                int Issucessfull = InsertionLayer.feedback(fdbck);
                if(Issucessfull==1)
                {
                    lblmsg.Text = "We Appreciate for Your Proper Feedback...";
                    clearsection();
                }
                else
                {
                    lblmsg.Text = "Technical Error ! Please try After Sometime";
                }
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }

        /// <summary>
        /// code to clear section...
        /// </summary>
        void clearsection()
        {
            try
            {
                txtemail.Value = "";
                txtmsg.Value = "";
                txtname.Value = "";
                txtnum.Value = "";
                rbl.ClearSelection();

            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                feedback();
                lblmsg.Visible = true;
                lblmsg.Focus();
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }
    }
}