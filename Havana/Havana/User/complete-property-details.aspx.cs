using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana.User
{
    public partial class complete_property_details : System.Web.UI.Page
    {
        TransactionAccessLayer objtrans = new TransactionAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                emiDetails();
                flatDetails();
            }
        }

        #region emi details of property

        void emiDetails()
        {
            try
            {
                if(Request.QueryString["Id"]!=null && Request.QueryString["EmiMode"]!=null)
                {
                    grdbank.DataSource=objtrans.getEmiModedetailsonEmiModeId( Convert.ToInt32(Request.QueryString["EmiMode"]));
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

        #region flat details of property

        void flatDetails()
        {
            try
            {
                if (Request.QueryString["Id"] != null && Request.QueryString["EmiMode"] != null && Request.QueryString["FlatId"] !=null)
                {
                    grdflat.DataSource = objtrans.getflatdetailsOnFlatId(Convert.ToInt32(Request.QueryString["FlatId"]));
                    grdflat.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblflats.Text = ex.Message;
            }
        }
        #endregion
    }
}