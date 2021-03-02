using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana.Admin
{
    public partial class Vew_Feedback_Replies : System.Web.UI.Page
    {
        ShowDataLayer objshw = new ShowDataLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindfeedbackdetails();
            }
        }

        /// <summary>
        /// code to bind feedbacks..
        /// </summary>
        void bindfeedbackdetails()
        {
            try
            {
                userrplydetails.DataSource = objshw.showfeebackRplies(Convert.ToInt32(Request.QueryString["Id"]));
                userrplydetails.DataBind();
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;

            }
        }
    }
}