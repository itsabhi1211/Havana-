using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using HavanaDAL;
using System.Web.UI.WebControls;

namespace Havana.Admin
{
    public partial class Users_KYC_Details : System.Web.UI.Page
    {
        tblreg reg = new tblreg();
        ShowDataLayer objshw = new ShowDataLayer();
        Editlayer objedit = new HavanaDAL.Editlayer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindUserKYCdetails();
               
            }
        }

        void   bindUserKYCdetails()
        {
            try
            {
                userkycdetail.DataSource = objshw.showuserKYCdetails(Convert.ToInt32(Request.QueryString["Id"]));
                userkycdetail.DataBind();
                
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }

    }
}