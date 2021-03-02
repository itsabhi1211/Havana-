using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana.Admin
{
    public partial class Plans_Details : System.Web.UI.Page
    {
        InsertionLayer objinsert = new InsertionLayer();
        ShowDataLayer objshw = new ShowDataLayer();
        tblPlanCharge objplanCharges = new tblPlanCharge();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindpropertyinDDL();             
                bindPlanDetails();
                GetdetailsInQueryString();
               
                
            }
        }

        /// <summary>
        /// code to bind Drop down List...
        /// </summary>
        void bindDDL()
        {
            try
            {
                ddlplans.DataValueField = "Id";
                ddlplans.DataTextField = "PlanName";
                ddlplans.DataSource = objshw.PlansDetailsInDDL();
                ddlplans.DataBind();
                ddlplans.Items.Insert(0, "Choose Your Plan");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to bind property name with flat name for EMI plans
        /// </summary>
        void bindpropertyinDDL()
        {
            try
            {
                ddlproperty.DataValueField = "Id";
                ddlproperty.DataTextField = "PropertyName";
                ddlproperty.DataSource= objshw.bindblocknowithflatnameForEMIPlans();
                ddlproperty.DataBind();
                ddlproperty.Items.Insert(0, "Choose Property");
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to add plan Details....
        /// </summary>
        void AddPlansDetails()
        {
            try
            {

                objplanCharges.PlanId = Convert.ToInt32(ddlplans.SelectedValue);
                objplanCharges.EMI = Convert.ToInt32(txtEMI.Value);
                objplanCharges.Total_EMI= Convert.ToInt32(txttotalEMI.Text);
                objplanCharges.Tax = Convert.ToInt32(txtTAX.Text);
                objplanCharges.Taxed_Amount = Convert.ToInt32(txttaxedamount.Text);
                objplanCharges.Monthly_Amount = Convert.ToInt32(txtsubtotalamt.Text);
                objplanCharges.Total_Amount = Convert.ToInt32(txttotalamt.Text);
                objplanCharges.Price= Convert.ToInt32(txtprice.Text);
                int Issuccessfull = InsertionLayer.PaymentPlansDetails(objplanCharges);
                if(Issuccessfull==1)
                {
                    lblmsg.Text = "You have Successfully Added The Plan Details..";
                    clearSection();
                }
                else
                {
                    lblmsg.Text = "Failed... Please Try Again Later...";
                }
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }

        /// <summary>
        /// code to clear section..
        /// </summary>
        void clearSection()
        {
            txtEMI.Value = "";
            txttotalEMI.Text = "";
            txtsubtotalamt.Text = "";
            txtTAX.Text = "";
            txttaxedamount.Text = "";
            txttotalamt.Text="";
            ddlplans.ClearSelection();
        }

        /// <summary>
        /// code to bind plan details.....
        /// </summary>
        void bindPlanDetails()
        {
            try
            {
                grdplandetails.DataSource = objshw.bindflatswithEMIplans();
                grdplandetails.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to get details in query string for updation of plans...
        /// </summary>
        void GetdetailsInQueryString()
        {
            try
            {
                if(Request.QueryString["Id"]!=null)
                {
                    var q = objshw.showPlansDetailsforUpdation(Convert.ToInt32(Request.QueryString["Id"]));
                    if(q.Any())
                    {
                        foreach(tblPlanCharge k in q)
                        {
                            
                            txtEMI.Value = k.EMI.ToString();
                            txttotalEMI.Text = k.Total_EMI.ToString();
                            txtTAX.Text = k.Tax.ToString();
                            txttaxedamount.Text = k.Taxed_Amount.ToString();
                            txtsubtotalamt.Text = k.Monthly_Amount.ToString();
                            txttotalamt.Text = k.Total_Amount.ToString();
                            int PropertyId = objshw.GetPropertyIdOnPlanId(Convert.ToInt32(k.PlanId));
                            ddlproperty.Items.FindByValue(PropertyId.ToString()).Selected = true;
                            FetchPrice(Convert.ToInt32(ddlproperty.SelectedValue));
                            FetchPlanMaster(Convert.ToInt32(ddlproperty.SelectedValue));
                            ddlplans.Items.FindByValue(k.PlanId.ToString()).Selected = true;
                            
                        }
                    }
                    btnupld.Text = "Update ";
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }


        /// <summary>
        /// code to edit plans details....
        /// </summary>
        void EditPlansdetails()
        {
            try
            {

                if(Request.QueryString["Id"]!=null)
                {
                    int updated = Editlayer.EditPlansDetails(Convert.ToInt32(Request.QueryString["Id"]), Convert.ToInt32(ddlplans.SelectedValue), Convert.ToDecimal(txttotalEMI.Text), Convert.ToDecimal(txtEMI.Value), Convert.ToDecimal(txtTAX.Text), Convert.ToDecimal(txttaxedamount.Text), Convert.ToDecimal(txtsubtotalamt.Text), Convert.ToDecimal(txttotalamt.Text), Convert.ToDecimal(txtprice.Text));
                    if (updated == 1)
                    {

                        Response.Redirect("Plan-Details");
                    }
                    else
                    {
                        lblmsg.Text = "Plan Details  Not Updated";
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to submit changes....
        /// </summary>
        void submitchanges()
        {
            try
            {
                var q = objshw.showPlansDetailsforUpdation(Convert.ToInt32(Request.QueryString["Id"]));
                if (q.Any())
                {
                    EditPlansdetails();
                }
                else
                {
                    AddPlansDetails();
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        protected void btnupld_Click(object sender, EventArgs e)
        {
            try
            {
                submitchanges();
                lblmsg.Visible = true;
                lblmsg.Focus();
                bindPlanDetails();
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.Visible = true;
            }
        }
        

        /// <summary>
        /// code to delete plan details...
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkdelte_Command(object sender, CommandEventArgs e)
        {
            int Ids = Convert.ToInt32(e.CommandArgument);
            Editlayer.DeletePlanDetails(Ids);
            grdplandetails.DataBind();
        }


        /// <summary>
        /// code to calculate amount..
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void txtTAX_TextChanged(object sender, EventArgs e)
        {
            try
            {
                decimal EmiCost = 0, TaxPercentage = 0, TaxedAmount = 0, MonthlyAmount = 0, FinalAmount = 0, TotalEmi = 0;
                if ((!string.IsNullOrEmpty(txtTAX.Text)) && (!string.IsNullOrEmpty(txttaxedamount.Text)) && (!string.IsNullOrEmpty(txttotalamt.Text)))
                {
                    TotalEmi = Convert.ToDecimal(txttotalEMI.Text);
                    EmiCost = Convert.ToDecimal(txtEMI.Value);
                    TaxPercentage = Convert.ToDecimal(txtTAX.Text);

                    TaxedAmount = (EmiCost * TaxPercentage) / 100;
                    MonthlyAmount = TaxedAmount + EmiCost;
                    FinalAmount = MonthlyAmount * TotalEmi;

                    txttaxedamount.Text = Convert.ToString(TaxedAmount);
                    txtsubtotalamt.Text = Convert.ToString(MonthlyAmount);
                    txttotalamt.Text = Convert.ToString(FinalAmount);
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to bind ddlproperty with ddlplan
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlproperty_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if(ddlproperty.SelectedIndex!=0)
                {
                    FetchPlanMaster(Convert.ToInt32(ddlproperty.SelectedValue));
                    
                    FetchPrice(Convert.ToInt32(ddlproperty.SelectedValue));
                   
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }


        /// <summary>
        /// code to fetch price..
        /// </summary>
        /// <param name="PropertyId"></param>
        void FetchPrice(int PropertyId)
        {
            try
            {
                var q = objshw.showPropertiesDetails(PropertyId);
                if (q.Any())
                {
                    foreach (tblProperty k in q)
                    {
                        txtprice.Text = k.Price.ToString();

                    }
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to fetch property Id
        /// </summary>
        /// <param name="PropertyId"></param>
        void FetchPlanMaster(int PropertyId)
        {
            ddlplans.Enabled = true;
            ddlplans.DataValueField = "Id";
            ddlplans.DataTextField = "PlanName";
            ddlplans.DataSource = objshw.showPlansOnPropertyId(PropertyId);
            ddlplans.DataBind();
            ddlplans.Items.Insert(0, "Choose Plan ");
        }

        protected void txttotalEMI_TextChanged(object sender, EventArgs e)
        {
            decimal totalprice = Convert.ToDecimal(txtprice.Text);
            decimal totalemi = Convert.ToDecimal(txttotalEMI.Text);

            decimal installment = (totalprice / totalemi);
            txtEMI.Value = installment.ToString();
        }
    }

}