using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana.User
{
    public partial class Shopping_cart : System.Web.UI.Page
    {
        HavanadataclassesDataContext da = new HavanadataclassesDataContext();
        Editlayer objedit = new Editlayer();
        ShowDataLayer objshw = new ShowDataLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getDetailsInQueryString();
            }
        }

        #region get Property details

        void getDetailsInQueryString()
        {
            try
            {
                if (Request.QueryString["EmiModeId"] != null && Request.QueryString["EmiMode"] != null)
                {
                    var q = objshw.getPropertyDetailsOnEMIModeId(Convert.ToInt32(Request.QueryString["EmiModeId"]));
                    if (q.Any())
                    {
                        foreach (tblEmiMode k in q)
                        {
                            txttotalamt.Value = k.Amount.ToString();
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

        protected void btnbuy_Click(object sender, EventArgs e)
        {
            SubmitCode();
        }

        #region paid amount text changed

        protected void txtpaidamt_TextChanged(object sender, EventArgs e)
        {
            try
            {
                hdfapp.Value = Convert.ToString(Request.QueryString["EmiMode"]);
                decimal dueamt = 0;
                decimal totalamt = Convert.ToDecimal(txttotalamt.Value);
                decimal paidamt = Convert.ToDecimal(txtpaidamt.Text);
                dueamt = totalamt - paidamt;
                txtdueamt.Value = Convert.ToString(dueamt);
                if(hdfapp.Value== "One Time Payment" && dueamt!=0)
                {
                    btnbuy.Enabled = false;
                    lblmsg.Text = "You Had Chosen One Time Payment Mode So You Had To Pay Full Amount.";
                    lblmsg.Visible = true;
                }
                else
                {
                    btnbuy.Enabled = true;                                      
                }
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.Visible = true;
            }
        }

        #endregion

        #region bind ddl mode of payment

        protected void ddlmode_SelectedIndexChanged(object sender, EventArgs e)
        {
            paymentcases();
        }

        #endregion

        #region payment cases

        void paymentcases()
        {
            try
            {
                // 1-Cash 2-Cheque 3-DD 4- Online
                switch (Convert.ToInt32(ddlmode.SelectedValue))
                {
                    case 1:

                        lblchq.Disabled = true;
                        lbldd.Disabled = true;
                        txtcheque.Disabled = true;
                        txtdemand.Disabled = true;
                        lbltrans.Disabled = true;
                        txttransaction.Disabled = true;
                        lblbnknme.Disabled = true;
                        lblbnkbrnch.Disabled = true;
                        txtbnkbrnch.Disabled = true;
                        txtbnk.Disabled = true;
                        clearsection();

                        break;

                    case 2:

                        lblbnknme.Disabled = false;
                        lblbnkbrnch.Disabled = false;
                        txtbnkbrnch.Disabled =false;
                        txtbnk.Disabled = false;
                        lbldd.Disabled = true;
                        txtdemand.Disabled = true;
                        lbltrans.Disabled = true;
                        txttransaction.Disabled = true;
                        lblchq.Disabled = false;
                        txtcheque.Disabled = false;
                        clearsection();
                        break;

                    case 3:

                        lblbnknme.Disabled = false;
                        lblbnkbrnch.Disabled = false;
                        txtbnkbrnch.Disabled = false;
                        txtbnk.Disabled = false;
                        txtcheque.Disabled = true;
                        txtdemand.Disabled = false;
                        lbldd.Disabled = false;
                        lbltrans.Disabled = true;
                        txttransaction.Disabled = true;
                        clearsection();
                        break;

                    case 4:

                        lbltrans.Disabled = false;
                        txttransaction.Disabled = false;
                        lblbnknme.Disabled = true;
                        lblbnkbrnch.Disabled = true;
                        txtbnkbrnch.Disabled = true;
                        txtbnk.Disabled = true;
                        lbldd.Disabled = true;
                        txtdemand.Disabled = true;
                        clearsection();
                        break;


                }
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }

        #endregion

        void clearsection()
        {
            try
            {
                txtbnk.Value = "";
                txtbnkbrnch.Value = "";
                txtcheque.Value = "0";
                txtdemand.Value = "0";
                txttransaction.Value = "NA";
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }

        void SubmitCode()
        {
            try
            {
                string Message = "";long? InvoiceNumber = 0;
                hdfapp.Value = Convert.ToString(Request.QueryString["EmiMode"]);
                switch(hdfapp.Value)
                {
                    case "Monthly":

                        #region Inserting Data Into Payment Table

                        da.spUpdatePayment(Convert.ToInt32(Session["id"]), Convert.ToInt32(Request.QueryString["EmiModeId"]), Convert.ToDecimal(txttotalamt.Value), Convert.ToDecimal(txtpaidamt.Text), Convert.ToDecimal(txtdueamt.Value), Convert.ToDecimal(txtextrachrge.Value), 1, DateTime.Now.AddMonths(1), DateTime.Now.Date, ref Message);

                        #endregion

                        #region Inserting Data Into Payment History Table

                        da.spPaymentHistory(Convert.ToInt32(Session["id"]), Convert.ToInt32(Request.QueryString["EmiModeId"]), Convert.ToDecimal(txttotalamt.Value), Convert.ToDecimal(txtpaidamt.Text), Convert.ToDecimal(txtdueamt.Value), Convert.ToDecimal(txtextrachrge.Value), 1, DateTime.Now.AddMonths(1), DateTime.Now.Date, 
                            ref InvoiceNumber);

                        #endregion

                        #region Inserting Data into Payment Mode

                        da.spPaymentMode(Convert.ToInt32(Session["id"]), Convert.ToInt32(ddlmode.SelectedValue), txtbnk.Value = txtbnk.Value == "" ? "NA" : txtbnk.Value, txtbnkbrnch.Value = txtbnkbrnch.Value == "" ? "NA" : txtbnkbrnch.Value, Convert.ToInt32(txtcheque.Value), Convert.ToInt32(txtdemand.Value), txttransaction.Value, Convert.ToInt32(Request.QueryString["EmiModeId"]));

                        #endregion

                        #region Update Booking Status
                        objedit.UpdateFlatIdStatus(Convert.ToInt32(Request.QueryString["FlatId"]));
                        #endregion

                        #region Display Message

                        lblmsg.Text = "Booking Completed with reference to bill number " + Convert.ToString(InvoiceNumber);

                        #endregion

                        break;

                    case "Two-Month":

                        #region Inserting Data Into Payment Table

                        da.spUpdatePayment(Convert.ToInt32(Session["id"]), Convert.ToInt32(Request.QueryString["EmiModeId"]), Convert.ToDecimal(txttotalamt.Value), Convert.ToDecimal(txtpaidamt.Text), Convert.ToDecimal(txtdueamt.Value), Convert.ToDecimal(txtextrachrge.Value), 1, DateTime.Now.AddMonths(2), DateTime.Now.Date, ref Message);

                        #endregion

                        #region Inserting Data Into Payment History Table

                        da.spPaymentHistory(Convert.ToInt32(Session["id"]), Convert.ToInt32(Request.QueryString["EmiModeId"]), Convert.ToDecimal(txttotalamt.Value), Convert.ToDecimal(txtpaidamt.Text), Convert.ToDecimal(txtdueamt.Value), Convert.ToDecimal(txtextrachrge.Value), 1, DateTime.Now.AddMonths(2), DateTime.Now.Date,
                            ref InvoiceNumber);

                        #endregion

                        #region Inserting Data into Payment Mode

                        da.spPaymentMode(Convert.ToInt32(Session["id"]), Convert.ToInt32(ddlmode.SelectedValue), txtbnk.Value = txtbnk.Value == "" ? "NA" : txtbnk.Value, txtbnkbrnch.Value = txtbnkbrnch.Value == "" ? "NA" : txtbnkbrnch.Value, Convert.ToInt32(txtcheque.Value), Convert.ToInt32(txtdemand.Value), txttransaction.Value, Convert.ToInt32(Request.QueryString["EmiModeId"]));

                        #endregion

                        #region Update Booking Status
                        objedit.UpdateFlatIdStatus(Convert.ToInt32(Request.QueryString["FlatId"]));
                        #endregion

                        #region Display Message

                        lblmsg.Text = "Booking Completed with reference to bill number " + Convert.ToString(InvoiceNumber);

                        #endregion

                        break;

                    case "Quarterly":

                        #region Inserting Data Into Payment Table

                        da.spUpdatePayment(Convert.ToInt32(Session["id"]), Convert.ToInt32(Request.QueryString["EmiModeId"]), Convert.ToDecimal(txttotalamt.Value), Convert.ToDecimal(txtpaidamt.Text), Convert.ToDecimal(txtdueamt.Value), Convert.ToDecimal(txtextrachrge.Value), 1, DateTime.Now.AddMonths(3), DateTime.Now.Date, ref Message);

                        #endregion

                        #region Inserting Data Into Payment History Table

                        da.spPaymentHistory(Convert.ToInt32(Session["id"]), Convert.ToInt32(Request.QueryString["EmiModeId"]), Convert.ToDecimal(txttotalamt.Value), Convert.ToDecimal(txtpaidamt.Text), Convert.ToDecimal(txtdueamt.Value), Convert.ToDecimal(txtextrachrge.Value), 1, DateTime.Now.AddMonths(3), DateTime.Now.Date,
                            ref InvoiceNumber);

                        #endregion

                        #region Inserting Data into Payment Mode

                        da.spPaymentMode(Convert.ToInt32(Session["id"]), Convert.ToInt32(ddlmode.SelectedValue), txtbnk.Value = txtbnk.Value == "" ? "NA" : txtbnk.Value, txtbnkbrnch.Value = txtbnkbrnch.Value == "" ? "NA" : txtbnkbrnch.Value, Convert.ToInt32(txtcheque.Value), Convert.ToInt32(txtdemand.Value), txttransaction.Value, Convert.ToInt32(Request.QueryString["EmiModeId"]));

                        #endregion

                        #region Update Booking Status
                        objedit.UpdateFlatIdStatus(Convert.ToInt32(Request.QueryString["FlatId"]));
                        #endregion

                        #region Display Message

                        lblmsg.Text = "Booking Completed with reference to bill number " + Convert.ToString(InvoiceNumber);

                        #endregion

                        break;

                    case "Half-Yearly":

                        #region Inserting Data Into Payment Table

                        da.spUpdatePayment(Convert.ToInt32(Session["id"]), Convert.ToInt32(Request.QueryString["EmiModeId"]), Convert.ToDecimal(txttotalamt.Value), Convert.ToDecimal(txtpaidamt.Text), Convert.ToDecimal(txtdueamt.Value), Convert.ToDecimal(txtextrachrge.Value), 1, DateTime.Now.AddMonths(6), DateTime.Now.Date, ref Message);

                        #endregion

                        #region Inserting Data Into Payment History Table

                        da.spPaymentHistory(Convert.ToInt32(Session["id"]), Convert.ToInt32(Request.QueryString["EmiModeId"]), Convert.ToDecimal(txttotalamt.Value), Convert.ToDecimal(txtpaidamt.Text), Convert.ToDecimal(txtdueamt.Value), Convert.ToDecimal(txtextrachrge.Value), 1, DateTime.Now.AddMonths(6), DateTime.Now.Date,
                            ref InvoiceNumber);

                        #endregion

                        #region Inserting Data into Payment Mode

                        da.spPaymentMode(Convert.ToInt32(Session["id"]), Convert.ToInt32(ddlmode.SelectedValue), txtbnk.Value = txtbnk.Value == "" ? "NA" : txtbnk.Value, txtbnkbrnch.Value = txtbnkbrnch.Value == "" ? "NA" : txtbnkbrnch.Value, Convert.ToInt32(txtcheque.Value), Convert.ToInt32(txtdemand.Value), txttransaction.Value, Convert.ToInt32(Request.QueryString["EmiModeId"]));

                        #endregion

                        #region Update Booking Status
                        objedit.UpdateFlatIdStatus(Convert.ToInt32(Request.QueryString["FlatId"]));
                        #endregion

                        #region Display Message

                        lblmsg.Text = "Booking Completed with reference to bill number " + Convert.ToString(InvoiceNumber);

                        #endregion

                        break;
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}