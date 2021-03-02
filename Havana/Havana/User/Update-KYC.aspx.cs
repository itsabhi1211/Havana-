using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;
namespace Havana.User
{
    public partial class Update_KYC : System.Web.UI.Page
    {
        tblkyc kyc = new tblkyc();
        InsertionLayer objlayer = new InsertionLayer();
        ShowDataLayer objshw = new ShowDataLayer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetKycDetails();
            }
        }

        void GetKycDetails()
        {
            var q = objshw.showuserKYCdetails(Convert.ToInt32(Session["Id"]));
            if (q.Any())
            {
                foreach (tblkyc k in q)
                {
                    txtAadhar1.Value = k.Aadhaar.ToString().Substring(0, 4);
                    txtAadhar2.Value = k.Aadhaar.ToString().Substring(4, 4);
                    txtAadhar3.Value = k.Aadhaar.ToString().Substring(8, 4);
                    txtPAN.Value = k.Pan;
                }
            }
        }
        /// <summary>
        /// code for kyc updation
        /// </summary>
        
        void updateKYC()
        {
            try
            {
                kyc.RegId = Convert.ToInt32(Session["Id"]);
                kyc.Pan = txtPAN.Value;
                string x = txtAadhar1.Value;
                string y = txtAadhar2.Value;
                string z = txtAadhar3.Value;
                string a = x + y + z;
                kyc.Aadhaar = Convert.ToInt64(a);
                InsertionLayer.userKYCdetails(kyc);
                clearselection();
                lblmsg.Text = "Your KYC Has Been Updated Successfully";
            }
            catch(Exception ex)
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
            txtAadhar1.Value = "";
            txtAadhar2.Value = "";
            txtAadhar3.Value = "";
            txtPAN.Value = "";
        }

        /// <summary>
        /// code to update KYC details
        /// </summary>
        void EditKYC()
        {
            hdf.Value =txtAadhar1.Value+txtAadhar2.Value+txtAadhar3.Value;
            Editlayer.EditKYCDetails(Convert.ToInt32(Session["Id"]), txtPAN.Value,Convert.ToInt64(hdf.Value ));
        }

        void SubmitChanges()
        {
            var q = objshw.showuserKYCdetails(Convert.ToInt32(Session["Id"]));
            if (q.Any())
            {
               EditKYC();
            }
            else
            {
                updateKYC();
            }
        }

        protected void btnsbmt_Click(object sender, EventArgs e)
        {
            try
            {
                SubmitChanges();
                lblmsg.Visible = true;
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Visible = true;
            }
        }
    }
}