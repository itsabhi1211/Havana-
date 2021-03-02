using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HavanaDAL;

namespace HavanaDAL
{
  public  class Editlayer
    {
        connection con = new connection();

        /// <summary>
        /// code for users approval
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>

        public static int ApprovedUsers(int ids)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblreg reg = objdata.tblregs.Where(x => x.Id == ids).FirstOrDefault();
                    if (reg != null)
                    {
                        reg.IsActive = false;
                    }
                    objdata.SubmitChanges();
                    return 1;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code for disapproval of users or deactivation of users
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>

        public static int PendingUsers(int ids)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblreg reg = objdata.tblregs.Where(x => x.Id == ids).FirstOrDefault();
                    if (reg != null)
                    {
                        reg.IsActive = true;
                    }
                    objdata.SubmitChanges();
                    return 1;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code for Verifying Users
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>

        public static int VerifiedUsers(int ids)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblreg reg = objdata.tblregs.Where(x => x.Id == ids).FirstOrDefault();
                    if (reg != null)
                    {
                        reg.IsVerified = true;
                    }
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code for denying users
        /// </summary>
        /// <param name="ids"></param>

        public static int denyingusers(int ids)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblreg reg = objdata.tblregs.Where(x => x.Id == ids).FirstOrDefault();
                    if (reg != null)
                    {
                        reg.IsVerified = false;
                    }
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        ///  code to update user profile
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="pin"></param>
        /// <param name="state"></param>
        /// <param name="city"></param>
        /// <param name="address"></param>
        /// <returns></returns>

        public static int updateuserprofile(int ids, string state, string city, string address, long pin, DateTime dob, string img)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblprofile profile = objdata.tblprofiles.Where(x => x.RegId == ids).FirstOrDefault();
                    if (profile != null)
                    {
                        profile.State = state;
                        profile.City = city;
                        profile.Address = address;
                        profile.Pin = pin;
                        profile.DOB = dob;
                        profile.Picture = img;

                    }
                    objdata.SubmitChanges();
                    return 1;

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code for updation of property details
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="price"></param>
        /// <param name="_for"></param>
        /// <returns></returns>
        public static int updatePropertyDetails(int ids, long price, string _for)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblProperty property = objdata.tblProperties.Where(x => x.Id == ids).FirstOrDefault();
                    if (property != null)
                    {
                        property.Price = Convert.ToInt64(price);
                        property.For = _for;

                    }
                    objdata.SubmitChanges();
                    return 1;

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        /// <summary>
        /// code to update bank kyc details
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="panNo"></param>
        /// <param name="aadhar"></param>
        /// <returns></returns>
        public static int updateKYC(int ids, long panNo, long aadhar)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblkyc kyc = objdata.tblkycs.Where(x => x.Id == ids).FirstOrDefault();
                    if (kyc != null)
                    {
                        kyc.Pan = panNo.ToString();
                        kyc.Aadhaar = Convert.ToInt64(aadhar);
                    }
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to update bank details 
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="accNo"></param>
        /// <param name="branch"></param>
        /// <param name="ifsc"></param>
        /// <returns></returns>
        public static int updateBankDetails(int ids, long accNo, string branch, string ifsc, string bankname)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblbank bank = objdata.tblbanks.Where(x => x.RegId == ids).FirstOrDefault();
                    if (bank != null)
                    {
                        bank.IFSC = ifsc.ToString();
                        bank.AccountNo = Convert.ToInt64(accNo);
                        bank.BankBranch = branch.ToString();
                        bank.BankName = bankname.ToString();
                    }
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        /// <summary>
        /// code to edit kyc details of users
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="pan"></param>
        /// <param name="aadhar"></param>
        /// <returns></returns>
        public static int EditKYCDetails(int ids, string pan, long aadhar)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblkyc kyc = objdata.tblkycs.Where(x => x.RegId == ids).FirstOrDefault();
                    if (kyc != null)
                    {
                        kyc.Aadhaar = Convert.ToInt64(aadhar);

                        kyc.Pan = pan.ToString();
                    }
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        /// <summary>
        /// code to edit block name
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="blockname"></param>
        /// <returns></returns>
        public static int EditBlockName(int ids, string blockname)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblblockcategory block = objdata.tblblockcategories.Where(x => x.Id == ids).FirstOrDefault();
                    if (block != null)
                    {
                        block.BlockName = blockname.ToString();
                    }
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// 
        /// code to edit flats name
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="flatname"></param>
        /// <returns></returns>
        public static int EditFlatsName(int ids, int flatname, int BlockId)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblavailableblock avlblock = objdata.tblavailableblocks.Where(x => x.Id == ids).FirstOrDefault();
                    if (avlblock != null)
                    {
                        avlblock.BlockNo = flatname;
                        avlblock.BlockId = BlockId;
                    }
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to delete contactus reply...
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public static int DeleteContactUsReply(int ids)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblcontactus contactus = objdata.tblcontactus.Where(x => x.Id == ids).FirstOrDefault();
                    if (contactus != null)
                    {
                        contactus.IsActive = false;
                    }
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to delete feedbacks....
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public static int DeleteFeedbacks(int ids)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblfeedback fdbck = objdata.tblfeedbacks.Where(x => x.Id == ids).FirstOrDefault();
                    if (fdbck != null)
                    {
                        fdbck.IsActive = false;
                    }
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to delete plans
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public static int DeletePlan(int ids)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblPlansMaster objplanmmaster = objdata.tblPlansMasters.Where(x => x.Id == ids).FirstOrDefault();
                    if (objplanmmaster != null)
                    {
                        objplanmmaster.IsActive = false;
                    }
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to delete plan details
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public static int DeletePlanDetails(int ids)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblPlanCharge objplancharge = objdata.tblPlanCharges.Where(x => x.Id == ids).FirstOrDefault();
                    if (objplancharge != null)
                    {
                        objplancharge.IsActive = false;
                    }
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to edit plans...
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="nameOfPlan"></param>
        /// <returns></returns>
        public static int EditPlan(int ids, string nameOfPlan)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblPlansMaster objplanmaster = objdata.tblPlansMasters.Where(x => x.Id == ids).FirstOrDefault();
                    if (objplanmaster != null)
                    {
                        objplanmaster.PlanName = nameOfPlan;
                    }
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to edit plans details...
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="nameOfPlan"></param>
        /// <returns></returns>
        public static int EditPlandetails(int ids, int _emi, int _totalEMIs, decimal _extracharges)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblPlanCharge objplancharge = objdata.tblPlanCharges.Where(x => x.Id == ids).FirstOrDefault();
                    if (objplancharge != null)
                    {
                        objplancharge.EMI = _emi;
                        objplancharge.Total_EMIs = _totalEMIs;
                        objplancharge.Extra_Charges = _extracharges;
                    }
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to update Profile Picture...
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="img"></param>
        /// <returns></returns>
        public static int UpdateProfilePicture(int ids, string img)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblprofile pro = objdata.tblprofiles.Where(x => x.RegId == ids).FirstOrDefault();
                    if (pro != null)
                    {
                        pro.Picture = img
;
                    }
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
