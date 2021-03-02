using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana
{
    public partial class Shopping_cart : System.Web.UI.Page
    {
        ShowDataLayer objshw = new ShowDataLayer();
        HavanadataclassesDataContext da = new HavanadataclassesDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                getPropertyDetails();
                getEmiDetails();
            }
        }

        #region get peroperty details

        void getPropertyDetails()
        {
            try
            {
                if (Request.QueryString["CartId"] != null)
                {

                    var q = objshw.showPropertiesDetails(Convert.ToInt32(Request.QueryString["CartId"]));
                    if (q.Any())
                    {
                        foreach (tblProperty k in q)
                        {
                            imgproperty.Src = k.Image.ToString();
                            lblprice.Text = k.Price.ToString();
                            lblfor.Text = k.For;
                            lbladd.Text = k.Address;
                            lblarea.Text = k.Area.ToString();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.Visible = true;

            }
        }

        #endregion

        void getEmiDetails()
        {
            try
            {
                grdemidetails.DataSource = da.spPropertyDetails(Convert.ToInt32(Request.QueryString["CartId"]));
                grdemidetails.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}