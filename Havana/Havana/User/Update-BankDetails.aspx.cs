using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;
namespace Havana.User
{
    public partial class Update_BankDetails : System.Web.UI.Page
    {
        tblbank bnk = new tblbank();
        InsertionLayer objlayer = new InsertionLayer();
        ShowDataLayer objshow = new ShowDataLayer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                var q = objshow.showuserBankdetails(Convert.ToInt32(Session["Id"]));
                foreach(tblbank k in q)
                {
                    txtacc.Value = k.AccountNo.ToString();
                    txtbank.Value = k.BankName;
                    txtbranch.Value = k.BankBranch;
                    txtifsc.Value = k.IFSC;
                }
            }
        }

        /// <summary>
        /// code for bank details updation
        /// </summary>

        void SubmitBankdetails()
        {
            try
            {
                bnk.RegId = Convert.ToInt32(Session["Id"]);
                bnk.BankName= txtbank.Value;
                bnk.BankBranch = txtbranch.Value;
                bnk.IFSC = txtifsc.Value;
                bnk.AccountNo = Convert.ToInt64(txtacc.Value);
                InsertionLayer.userBankdetails(bnk);
                clearselection();
                lblmsg.Text = "Your Bank Details Has Been Updated Successfully";
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;

            }
        }

        /// <summary>
        /// code for clearing section
        /// </summary>

        void clearselection()
        {
            txtbranch.Value = "";
            txtbank.Value = "";
            txtifsc.Value = "";
            txtacc.Value = "";
        }

        void updateBankDetails()
        {
            try
            {
                Editlayer.updateBankDetails(Convert.ToInt32(Session["Id"]), Convert.ToInt64(txtacc.Value), txtbranch.Value, txtifsc.Value,txtbank.Value);
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Visible = true;
            }
        }

        void submitchanges()
        {
            try
            {
                var q = objshow.showuserBankdetails(Convert.ToInt32(Session["Id"]));
                if (q.Any())
                {
                    updateBankDetails();
                }
                else
                {
                    SubmitBankdetails();
                }
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Visible = true;
            }
        }

        protected void btnsbmt_Click(object sender, EventArgs e)
        {
            try
            {
                SubmitBankdetails();
                lblmsg.Visible = true;
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Visible = true;
            }
        }
    }
}