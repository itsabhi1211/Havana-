using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana.Admin
{
    public partial class Contact_Us_Report : System.Web.UI.Page
    {
        ShowDataLayer objshw = new ShowDataLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                bindcontactUs();
                getDateinQueryString();
            }
        }

        /// <summary>
        /// code for binding details of Contact Us
        /// </summary>
        void bindcontactUs()
        {
              try
                {
                    grdshw.DataSource = objshw.ShowContactUsDetails();
                    grdshw.DataBind();
                }
                catch (Exception ex)
                {
                    lblmsg.Text = ex.Message;
                    lblmsg.ForeColor = System.Drawing.Color.Red;

                }
            
           

        }

        protected void grdshw_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            try
            {
                grdshw.PageIndex = e.NewPageIndex;
                bindcontactUs();
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void lnkdeactivate_Command(object sender, CommandEventArgs e)
        {
            int Ids = Convert.ToInt32(e.CommandArgument);
            Editlayer.DeleteContactUsReply(Ids);
            bindcontactUs();
        }

        /// <summary>
        /// code to get date in quesry string for checking contact us on the day of login....
        /// </summary>
        void getDateinQueryString()
        {
            try
            {
                if (Request.QueryString["Type"] != null)
                {
                    grdshw.DataSource = objshw.checkContactUsOnDay();
                    grdshw.DataBind();
                }
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }
    }
}