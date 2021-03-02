using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana.Admin
{
    public partial class User_Bank_Details : System.Web.UI.Page
    {
        ShowDataLayer objshw = new ShowDataLayer();
        Editlayer objedit = new HavanaDAL.Editlayer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindUserBankdetails();
            }
        }

        void bindUserBankdetails()
        {
            try
            {
                userbankdetail.DataSource = objshw.showuserBankdetails(Convert.ToInt32(Request.QueryString["Id"]));
                userbankdetail.DataBind();
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }

    }
}