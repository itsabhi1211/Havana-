using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;
namespace Havana.Admin
{
    public partial class VerifiedUsers : System.Web.UI.Page
    {
        tblreg reg = new tblreg();
        ShowDataLayer objshw = new ShowDataLayer();
        Editlayer objedit = new HavanaDAL.Editlayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindverifieduserlist();
            }
        }


        /// <summary>
        /// code for verified Users...
        /// </summary>

        void bindverifieduserlist()

        {
            try
            {
                grdshw.DataSource = objshw.showVerifiedUsers();
                grdshw.DataBind();
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }

     

        protected void lnkdeny_Command(object sender, CommandEventArgs e)
        {
            int Ids = Convert.ToInt32(e.CommandArgument);
            Editlayer.denyingusers(Ids);
            bindverifieduserlist();
        }

        protected void grdshw_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grdshw.PageIndex = e.NewPageIndex;
                bindverifieduserlist();
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}