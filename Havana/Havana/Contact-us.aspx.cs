using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana
{
    public partial class Contact_us : System.Web.UI.Page
    {
        InsertionLayer objlayer = new InsertionLayer();
        tblcontactus contact = new tblcontactus();
        MailAccessLayer objmaillayer = new MailAccessLayer();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// code to insert details in ContactUs form
        /// </summary>
        void ContactUs()
        {
            try
            {
                contact.Name = txtname.Value;
                contact.Message = txtmsg.Value;
                contact.Email = txtmail.Value;
                contact.Contact = Convert.ToInt64(txtno.Value);
                int Issuccessfull = InsertionLayer.ContactUs(contact);
                if (Issuccessfull == 1)
                {
                    lblmsg.Text = "You Have Successfully Submitted Your Query......";
                    ClearSection();
                }
                else
                {
                    lblmsg.Text = "Technical Error ! Please try After Sometime";
                }
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }
       
        void ClearSection()
        {
            txtno.Value = "";
            txtname.Value = "";
            txtmsg.Value = "";
            txtmail.Value = "";
        }


        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string filepath = Server.MapPath("~/Admin/MailBody.html");
                string name = txtname.Value;
                string mail = txtmail.Value;
                string contactno = txtno.Value;
                string contactmsg = txtmsg.Value;
                string datetime = DateTime.Now.ToString();
                string year = DateTime.Now.Year.ToString();
                MailAccessLayer.SendContactMail(mail, name, contactno, datetime, filepath, year, contactmsg);
                ContactUs();
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