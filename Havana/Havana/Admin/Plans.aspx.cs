using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;
namespace Havana.Admin
{
    public partial class Plans : System.Web.UI.Page
    {
        InsertionLayer objinsert = new InsertionLayer();
        ShowDataLayer objshw = new ShowDataLayer();
        tblPlansMaster objplanmaster = new tblPlansMaster();
        Editlayer objeditlayer = new Editlayer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindplans();               
                bindpropertyDetails();
                GetdetailsinQueryString();
                getdetailsofplanOnQueryString();
            }
        }

        /// <summary>
        /// code to bind property details..
        /// </summary>
        void bindpropertyDetails()
        {
            try
            {
                ddlproperties.DataValueField = "Id";
                ddlproperties.DataTextField = "Text";
                ddlproperties.DataSource = objshw.bindblocknowithflatname();
                ddlproperties.DataBind();
                ddlproperties.Items.Insert(0, "Choose Property");
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        /// <summary>
        /// code to add Payment plans ...
        /// </summary>
        void AddPlans()
        {
            try
            {
                objplanmaster.PlanName = txtplan.Value;
                objplanmaster.PropertyId = Convert.ToInt32(ddlproperties.SelectedValue);
                int Issuccessfull = InsertionLayer.PaymentPlans(objplanmaster);
                if (Issuccessfull == 1)
                {
                    lblmsg.Text = "Your Plan Have Successfully Submitted....";
                    txtplan.Value = "";
                }
                else
                {
                    lblmsg.Text = "Your Plan Have Not Submitted ... Please Try Again Later...";
                }
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }

        /// <summary>
        /// code to bind payment plans..
        /// </summary>
        void bindplans()
        {
            try
            {
                grdplan.DataSource = objshw.PaymentPlansForProperties();
                    grdplan.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void btnupld_Click(object sender, EventArgs e)
        {
            try
            {
                if(ddlproperties.SelectedIndex!=0)
                {
                    submitdetails();
                    bindplans();
                    lblmsg.Visible = true;
                }
                else
                {
                    lblmsg.Text = "Please Choose Property first...";
                    lblmsg.Visible = true;
                }
                
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.Visible = true;
            }
        }

        /// <summary>
        /// code to update plans name...
        /// </summary>
        void UpdatePlans()
        {
            try
            {
                if (Request.QueryString["Id"] != null)
                {
                    int IsUpdated=Editlayer.EditPlan(Convert.ToInt32(Request.QueryString["Id"]),txtplan.Value,Convert.ToInt32(ddlproperties.SelectedValue));
                    if(IsUpdated==1)
                    {
                        Response.Redirect("Plans.aspx");
                    }
                    else
                    {
                        lblmsg.Text = "Plans  Not Updated";
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    AddPlans();
                }
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }


        void submitdetails()
        {
            try
            {
                var q = objshw.showPlansforUpdation(Convert.ToInt32(Request.QueryString["Id"]));
                if (q.Any())
                {
                   UpdatePlans();
                }
                else
                {
                    AddPlans();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to get Id for Updation in Query string..
        /// </summary>
        void GetdetailsinQueryString()
        {
            try
            {
                if (Request.QueryString["Id"] != null)
                {
                    var q = objshw.showPlansforUpdation(Convert.ToInt32(Request.QueryString["Id"]));
                    if(q.Any())
                    {
                       foreach(tblPlansMaster pm in q)
                        {
                            txtplan.Value = pm.PlanName;
                            
                            ddlproperties.Items.FindByValue(pm.PropertyId.ToString()).Selected = true;
                            
                        }
                    }
                    btnupld.Text = "Update Plan Name";
                }
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }

        protected void lnkdelte_Command1(object sender, CommandEventArgs e)
        {
            int Ids = Convert.ToInt32(e.CommandArgument);
            Editlayer.DeletePlan(Ids);
            bindplans();
        }

        /// <summary>
        /// get details to see plan details for property..
        /// </summary>
        void getdetailsofplanOnQueryString()
        {
            try
            {
                if (Request.QueryString["PlanMasterId"] != null)
                {
                    grdplan.DataSource = objshw.plandetailspropertyonId(Convert.ToInt32(Request.QueryString["PlanMasterId"]));
                    grdplan.DataBind();
                    paymentcalculator.Visible = false;

                }


            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }

        protected void grdplan_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grdplan.PageIndex = e.NewPageIndex;
                bindplans();
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}