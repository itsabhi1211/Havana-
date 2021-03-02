using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana.User
{
    public partial class booking_details : System.Web.UI.Page
    {
        TransactionAccessLayer objtrans = new TransactionAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                gridbind();
            }
        }

        #region show payment history

        void gridbind()
        {
            try
            {
                if (Request.QueryString["Id"] != null && Request.QueryString["EmiMode"] != null)
                {
                    grdbank.DataSource = objtrans.paymenthistory(Convert.ToInt32(Request.QueryString["Id"]), Convert.ToInt32(Request.QueryString["EmiMode"]));
                    grdbank.DataBind();
                }
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.Visible = true;

            }
        }

        #endregion

    }
}