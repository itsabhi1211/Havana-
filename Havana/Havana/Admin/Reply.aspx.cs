using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana.Admin
{
    public partial class Rply : System.Web.UI.Page
    {
        InsertionLayer objlayer = new InsertionLayer();
        ShowDataLayer objshw = new ShowDataLayer();
        tblrplycontact objrply = new tblrplycontact();
        MailAccessLayer objmaillayer = new MailAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetDetailsInQueryString();
            }
        }

        /// <summary>
        /// code to get details in query string
        /// </summary>
        void GetDetailsInQueryString()
        {
            try
            {
                if(Request.QueryString["Id"]!=null)
                {
                    var q = objshw.rply(Convert.ToInt32(Request.QueryString["Id"]));
                    if(q.Any())
                    {
                        txtname.Value = Request.QueryString["Name"];
                        txtname.Attributes.Add("readonly", "readonly");
                        txtemail.Value = Request.QueryString["Email"];
                        txtemail.Attributes.Add("readonly", "readonly");
                        txtcontact.Value = Request.QueryString["Contact"];
                        txtcontact.Attributes.Add("readonly", "readonly");
                    }
                }
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }

        /// <summary>
        /// code to rply
        /// </summary>
        void rply()
        {
            try
            {
                objrply.ContactId=Convert.ToInt32(Request.QueryString["Id"]);
                objrply.Rply = txtrply.Value;
                int Issuccessfull = InsertionLayer.Rply(objrply);
                if(Issuccessfull==1)
                {
                    lblmsg.Text = "You have Replied To " + txtname.Value;
                    clearSection();
                }
                else
                {
                    lblmsg.Text = "Technical Error !! Try After Sometime";
                }
              
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
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
                string filepath = Server.MapPath("ReplyFeedback.html");
                string name = txtname.Value;
                string mail = txtemail.Value;
                string contactno = txtcontact.Value;
                string replymsg = txtrply.Value;
                string datetime = DateTime.Now.ToString();
                string year = DateTime.Now.Year.ToString();
                MailAccessLayer.Sendfeedbackmail(mail, name, contactno, datetime, filepath, year, replymsg);
                rply();
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