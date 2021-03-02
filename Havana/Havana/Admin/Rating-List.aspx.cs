using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana.Admin
{
    public partial class Rating_List : System.Web.UI.Page
    {
        ShowDataLayer objshw = new ShowDataLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FeedbacksList();
            }
        }

        /// <summary>
        /// code for feedbacks list on rating....
        /// </summary>
        void FeedbacksList()
        {
            try
            {
                
                grdRating.DataSource = objshw.Ratinglist(Convert.ToChar(Request.QueryString["Rating"]));
                grdRating.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void grdRating_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
    }
}