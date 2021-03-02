using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana.User
{
    public partial class booking_report : System.Web.UI.Page
    {
        TransactionAccessLayer objtrans = new TransactionAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                bookingReport();
            }
        }

        void bookingReport()
        {
            try
            {
                
                grdshw.DataSource = objtrans.BookingReport();
                grdshw.DataBind();
               
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }
    }

}