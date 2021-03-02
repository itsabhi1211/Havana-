using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana.Admin
{
    public partial class Feedback_Report : System.Web.UI.Page
    {
        HavanadataclassesDataContext da = new HavanadataclassesDataContext();
        ShowDataLayer objshw = new ShowDataLayer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                bindFeedback();
                viewFeebacksOnRatings();
                getdateinQueryString();
            }
        }

        void bindFeedback()
        {
            try
            {
                grdshw.DataSource = objshw.fdbck();
                grdshw.DataBind();

            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }

        protected void grdshw_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grdshw.PageIndex = e.NewPageIndex;
                bindFeedback();
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        /// <summary>
        /// code to delete feedbacks..
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkdeactivate_Command(object sender, CommandEventArgs e)
        {
            int Ids = Convert.ToInt32(e.CommandArgument);
            Editlayer.DeleteFeedbacks(Ids);
            bindFeedback();
        }

        /// <summary>
        /// code to bind data on behalf of ratings...
        /// </summary>
        void viewFeebacksOnRatings()
        {
            try
            {
                grdRating.DataSource = da.sp_rating();
                grdRating.DataBind();
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to get date gor particular day feedback...
        /// </summary>
        void getdateinQueryString()
        {
            try
            {
                if(Request.QueryString["Type"]!=null)
                {
                    grdshw.DataSource = objshw.checkFeedbackOnDay();
                    grdshw.DataBind()
;                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}