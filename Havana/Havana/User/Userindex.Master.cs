using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana.User
{
    public partial class Userindex : System.Web.UI.MasterPage
    {
        ShowDataLayer objlayer = new ShowDataLayer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Id"] != null)
                {
                    string PreviousFile = objlayer.GetFileNameOnRegId(Convert.ToInt32(Session["Id"]));
                    if(PreviousFile!=null || !string.IsNullOrEmpty(PreviousFile) || !string.IsNullOrWhiteSpace(PreviousFile))
                    {
                        txtimg.Src = PreviousFile;
                    }
                    else
                    {
                        txtimg.Src = "img/avatar.png";
                    }
                    Response.ClearHeaders();
                    Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                    Response.AddHeader("Pragma", "no-cache");
                }
                else
                {
                    Response.Redirect("../Userlogin");
                }

            }
        }

        protected void lnklogout_Click(object sender, EventArgs e)
        {
            Session["Id"] = null;
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Buffer = true;
            Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
            Response.Expires = -1000;
            Response.CacheControl = "no-cache";
            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();
            Response.Redirect("../User-login.aspx", true);
        }
    }
}