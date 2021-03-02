using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana.Admin
{
    public partial class User_Profile_Details : System.Web.UI.Page
    {

        tblreg reg = new tblreg();
        ShowDataLayer objshw = new ShowDataLayer();
        Editlayer objedit = new HavanaDAL.Editlayer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                bindprofiledetails();
            }
        }

        void bindprofiledetails()

        {
            try
            {
                userbasicdetail.DataSource = objshw.showreguserdata(Convert.ToInt32(Request.QueryString["Name"]));
                userbasicdetail.DataBind();
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void userbasicdetail_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {
            try
            {
                userbasicdetail.PageIndex = e.NewPageIndex;
                bindprofiledetails();
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}