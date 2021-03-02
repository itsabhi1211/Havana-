using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana.Admin
{
    public partial class Admin_Dashboard : System.Web.UI.Page
    {
        ShowDataLayer objshw = new ShowDataLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                count();
            }
        }

        void count()
        {
            try
            {
                lbltotalusers.Text = Convert.ToString(objshw.CountTotalUsers());
                lblapprovedusers.Text = Convert.ToString(objshw.CountTotalApprovedUsers());
                lblpendingusers.Text = Convert.ToString(objshw.CountTotalPendingUsers());
                lblverifiedusers.Text = Convert.ToString(objshw.CountTotalVerifiedUsers());
                lblnonverifiedusers.Text = Convert.ToString(objshw.CountTotalNonVerifiedUsers());
                lblproperties.Text = Convert.ToString(objshw.CountProperties());
                lblfeedback.Text = Convert.ToString(objshw.CountFeedback());
                lblcontactus.Text = Convert.ToString(objshw.CountContactus());
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}