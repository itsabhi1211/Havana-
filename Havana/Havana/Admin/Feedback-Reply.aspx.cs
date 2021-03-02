using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana.Admin
{
    public partial class Feedback_Reply : System.Web.UI.Page
    {
        InsertionLayer objlayer = new InsertionLayer();
        ShowDataLayer objshw = new ShowDataLayer();
        FeebackRply objrply = new FeebackRply();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                getdetailsofRply();
            }
        }

        /// <summary>
        /// code to get details of person whom to reply..
        /// </summary>
        void getdetailsofRply()
        {
            try
            {
                var q = objshw.rplyfeedback(Convert.ToInt32(Request.QueryString["Id"]));
                if(q.Any())
                {
                   foreach(tblfeedback k in q)
                    {
                        txtcontact.Value = (k.ContactNo).ToString();
                        txtemail.Value = k.Email.ToString();
                        txtnme.Value = k.Name.ToString();

                    }
                }
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }

        /// <summary>
        /// code to reply to the user...
        /// </summary>
        void rply()
        {
            try
            {
                objrply.RplyId = Convert.ToInt32(Request.QueryString["Id"]);
                objrply.Rply = txtrply.Value;
                int Issucessfull = InsertionLayer.rplyfeedback(objrply);
                if(Issucessfull==1)
                {
                    lblmsg.Text = "You Have Replied To " + txtnme.Value;
                    clearSection();
                }
                else
                {
                    lblmsg.Text = "Failed... Please try again Later...";
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        void clearSection()
        {
            txtrply.Value = "";


        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                rply();
                lblmsg.Visible = true;
                lblmsg.Focus();
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}