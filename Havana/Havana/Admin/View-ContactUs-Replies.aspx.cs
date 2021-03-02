using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana.Admin
{
    public partial class View_Replies : System.Web.UI.Page
    {
        ShowDataLayer objshw = new ShowDataLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                replydetails();
            }
        }

        /// <summary>
        /// code to bind reply details of contact us form...
        /// </summary>
        void replydetails()
        {
            try
            {
                userrplydetails.DataSource = objshw.rplycontact(Convert.ToInt32(Request.QueryString["Id"]));
                userrplydetails.DataBind();
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}