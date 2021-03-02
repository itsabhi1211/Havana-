using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana.Admin
{
    public partial class emi_modes : System.Web.UI.Page
    {
        InsertionLayer objinsert = new InsertionLayer();
        ShowDataLayer objshw = new ShowDataLayer();
        tblEmiMode emimode = new tblEmiMode();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindPropertyinDDl();
                bindModeDetails();

            }

        }

        #region bind property in ddl

        void bindPropertyinDDl()
        {
            try
            {
                try
                {
                    ddlproperty.DataValueField = "Id";
                    ddlproperty.DataTextField = "PropertyName";
                    ddlproperty.DataSource = objshw.bindblocknowithflatnameForEMIPlans();
                    ddlproperty.DataBind();
                    ddlproperty.Items.Insert(0, "Choose Property");
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region get details of property on plan charge id

        void Detailsofproperty(int planchargeID)
        {
            try
            {
                var q = objshw.showPlansDetailsforUpdation(Convert.ToInt32(ddlplancharges.SelectedValue)); ;
                if (q.Any())
                {
                    foreach (tblPlanCharge k in q)
                    {

                        lblEMI.Text = k.EMI.ToString();
                        lbltotalEMI.Text = k.Total_EMI.ToString();
                        lbltax.Text = k.Tax.ToString();
                        lbltaxedamt.Text = k.Taxed_Amount.ToString();
                        lblmonthlyamt.Text = k.Monthly_Amount.ToString();
                        lbltotalamt.Text = k.Total_Amount.ToString();
                        lblprice.Text = k.Price.ToString();


                    }
                }
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }

        #endregion

        #region fetchplanmaster on property id
        /// <summary>
        /// code to fetch property Id
        /// </summary>
        /// <param name="PropertyId"></param>
        void FetchPlanMaster(int PropertyId)
        {
            ddlplanmaster.Enabled = true;
            ddlplanmaster.DataValueField = "Id";
            ddlplanmaster.DataTextField = "PlanName";
            ddlplanmaster.DataSource = objshw.showPlansOnPropertyId(PropertyId);
            ddlplanmaster.DataBind();
            ddlplanmaster.Items.Insert(0, "Choose Plan ");
        }
        #endregion

        #region fetch plancharge on plan master Id

        void FetchPlanCharge(int PlanmasterId)
        {
            ddlplancharges.Enabled = true;
            ddlplancharges.DataValueField = "Id";
            ddlplancharges.DataTextField = "Text";
            ddlplancharges.DataSource = objshw.ConcatenateEmisWithText(PlanmasterId);
            ddlplancharges.DataBind();
            ddlplancharges.Items.Insert(0, "Choose Plan  ");
        }
        #endregion

        #region ddlproperty
        protected void ddlproperty_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlproperty.SelectedIndex != 0)
                {
                    FetchPlanMaster(Convert.ToInt32(ddlproperty.SelectedValue));
                }
                else
                {
                    lblmsg.Text = "Please Choose Property first....";
                }
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }

        #endregion

        #region ddlplanmaster

        protected void ddlplanmaster_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlproperty.SelectedIndex != 0)
                {
                    FetchPlanCharge(Convert.ToInt32(ddlplanmaster.SelectedValue));
                }
                else
                {
                    lblmsg.Text = "Please Choose Property first....";
                }

            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }

        #endregion

        #region ddlplancharge

        protected void ddlplancharges_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlproperty.SelectedIndex != 0)
                {
                    Detailsofproperty(Convert.ToInt32(ddlplancharges.SelectedValue));
                }
                else
                {
                    lblmsg.Text = "Please Choose Property first....";
                }

            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }

        #endregion

        #region EMI and Price Calculation

        void EMIandPriceCalculation()
        {
            try
            {
                switch (Convert.ToInt32(ddlmodes.SelectedValue))
                {
                    case 1:
                        int monthly = Convert.ToInt32(lbltotalEMI.Text);
                        int totalEMi = monthly / 1;
                        txtinstallment.Value = totalEMi.ToString();
                        int amt = Convert.ToInt32(lblmonthlyamt.Text);
                        int totalamt = amt * 1;
                        txtEmiAMt.Value = totalamt.ToString();
                        break;

                    case 2:
                        int twomonthly = Convert.ToInt32(lbltotalEMI.Text);
                        int totalEMitwomonthly = twomonthly / 2;
                        txtinstallment.Value = totalEMitwomonthly.ToString();
                        int amttwomonthly = Convert.ToInt32(lblmonthlyamt.Text);
                        int totalamttwo = amttwomonthly * 2;
                        txtEmiAMt.Value = totalamttwo.ToString();
                        break;

                    case 3:
                        int quaterly = Convert.ToInt32(lbltotalEMI.Text);
                        int totalEMiquaterly = quaterly / 4;
                        txtinstallment.Value = totalEMiquaterly.ToString();
                        int Quaterlyamt = Convert.ToInt32(lblmonthlyamt.Text);
                        int Quaterlytotalamt = Quaterlyamt * 4;
                        txtEmiAMt.Value = Quaterlytotalamt.ToString();
                        break;

                    case 4:
                        int Halfyearly = Convert.ToInt32(lbltotalEMI.Text);
                        int HalfyearlytotalEMi = Halfyearly / 6;
                        txtinstallment.Value = HalfyearlytotalEMi.ToString();
                        int Halfyearlyamt = Convert.ToInt32(lblmonthlyamt.Text);
                        int Halfyearlytotalamt = Halfyearlyamt * 6;
                        txtEmiAMt.Value = Halfyearlytotalamt.ToString();
                        break;

                    case 5:
                        txtinstallment.Value = 1.ToString();
                        txttax.Visible = true;
                        lbltaxed.Visible = true;
                        lblemiamt.Visible = false;
                        lblinstallment.Visible = false;
                        txtinstallment.Visible = false;
                        txtEmiAMt.Visible = false;
                        break;



                }
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }

        #endregion

        #region ddlmodes

        protected void ddlmodes_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                EMIandPriceCalculation();
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }

        #endregion

        #region txttax text changed

        protected void txttax_TextChanged(object sender, EventArgs e)
        {
            try
            {
                decimal tax = Convert.ToDecimal(txttax.Text);
                decimal onetime = Convert.ToDecimal(lblprice.Text);
                decimal onetimeamt = (onetime * tax) / 100 + onetime;
                txtEmiAMt.Value = onetimeamt.ToString();
                lblemiamt.Visible = true;
                txtEmiAMt.Visible = true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region add Emi Modes

        void AddEmiModes()
        {
            try
            {
                emimode.PropertyId = Convert.ToInt32(ddlproperty.SelectedValue);
                emimode.PlanMasterId = Convert.ToInt32(ddlplanmaster.SelectedValue);
                emimode.PlanChargeId = Convert.ToInt32(ddlplancharges.SelectedValue);
                emimode.Mode = Convert.ToInt32(ddlmodes.SelectedValue);
                emimode.Installment = Convert.ToInt32(txtinstallment.Value);
                emimode.Amount = Convert.ToDecimal(txtEmiAMt.Value);
                int Issuccessfull = InsertionLayer.EMImode(emimode);
                if (Issuccessfull == 1)
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

        #endregion

        #region clear Section

        void clearSection()
        {
            try
            {
                ddlplancharges.ClearSelection();
                ddlplanmaster.ClearSelection();
                ddlmodes.ClearSelection();
                ddlproperty.ClearSelection();
                txtEmiAMt.Value = "";
                txtinstallment.Value = "";
                txttax.Text = "";
                
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }

        #endregion

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                AddEmiModes();
                bindModeDetails();
                lblmsg.Visible = true;
                lblmsg.Focus();
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }

        #region bind EMI modes of property

        void bindModeDetails()
        {
            try
            {
                grdshw.DataSource = objshw.EmiModeDetailsOfProperties();
                grdshw.DataBind();
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }

        #endregion

        protected void grdshw_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdshw.PageIndex = e.NewPageIndex;
            bindModeDetails();

        }

        protected void lnkdelte_Command(object sender, CommandEventArgs e)
        {

        }
    }
}