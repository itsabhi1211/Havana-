using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HavanaDAL;

namespace HavanaDAL
{
    public class Editlayer

    {
        connection con = new connection();

        /// <summary>
        /// code to change password..
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public static int PasswordChange(int ids,string password)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblreg reg = objdata.tblregs.Where(x => x.Id == ids).FirstOrDefault();
                    if(reg!=null)
                    {
                        reg.Password = password;
                    }
                    objdata.SubmitChanges();
                    return 1;

                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to change password on mail....
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public static int PasswordChangeOnEmail(string mail, string password)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblreg reg = objdata.tblregs.Where(x => x.Email == mail).FirstOrDefault();
                    if (reg != null)
                    {
                        reg.Password = password;
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
        public static int updatePropertyDetails(int ids,string add ,long price, int bed,int bath,long area,string _for,int flat)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblProperty property = objdata.tblProperties.Where(x => x.Id == ids).FirstOrDefault();
                    if (property != null)
                    {
                        property.Address = add;
                        property.Bedroom = bed;
                        property.Bathroom = bath;
                        property.Area = area;
                        property.Price = Convert.ToInt64(price);
                        property.For = _for;
                        property.FlatId = flat;


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
        public static int updateBankDetails(int ids, long accNo, string branch, string ifsc,string bankname)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblbank bank = objdata.tblbanks.Where(x => x.RegId == ids).FirstOrDefault();
                    if(bank!=null)
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
            catch(Exception ex)
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
        public static int EditKYCDetails(int ids,string pan,long aadhar)
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
            catch(Exception ex)
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
        public static int EditBlockName(int ids,string blockname)
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
            catch(Exception ex)
            {
                throw ex;
            }
        }


        /// <summary>
        /// code to delete blocks...
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public static int DeleteBlock(int ids)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblblockcategory blockcatgry = objdata.tblblockcategories.Where(x => x.Id == ids).FirstOrDefault();
                    if(blockcatgry!=null)
                    {
                        blockcatgry.IsActive = false;
                    }
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch(Exception ex)
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
        public static int EditFlatsName(int ids,int flatname,int BlockId)
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
            catch(Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to delete flats...
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public static int DeleteFlats(int ids)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblavailableblock avlblocks  = objdata.tblavailableblocks.Where(x => x.Id == ids).FirstOrDefault();
                    if (avlblocks != null)
                    {
                        avlblocks.IsActive = false;
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
                    if(fdbck != null)
                    {
                        fdbck.IsActive = false;
                    }
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch(Exception ex)
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
                    if(objplanmmaster!=null)
                    {
                        objplanmmaster.IsActive = false;
                    }
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch(Exception ex)
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
        public static int EditPlan(int ids,string nameOfPlan,int desc)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblPlansMaster objplanmaster = objdata.tblPlansMasters.Where(x => x.Id == ids).FirstOrDefault();
                    if(objplanmaster!=null)
                    {
                        objplanmaster.PlanName = nameOfPlan;
                        objplanmaster.PropertyId = desc;
                        
                    }
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch(Exception ex)
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
        public static int UpdateProfilePicture(int ids,string img)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblprofile pro = objdata.tblprofiles.Where(x => x.RegId == ids).FirstOrDefault();
                    if(pro!=null)
                    {
                        pro.Picture = img
;                    }
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to delete properties....
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public static int DeletePropertiesDetails(int ids)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblProperty property = objdata.tblProperties.Where(x => x.Id == ids).FirstOrDefault();
                    if (property != null)
                    {
                        property.IsActive = false ;
                    }
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }



        /// <summary>
        /// code to edit plan details...
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="emi"></param>
        /// <param name="totalEmi"></param>
        /// <returns></returns>
        public static int EditPlansDetails(int ids,int planname, decimal totalEmi,decimal emi,decimal tax,decimal taxedamount,decimal monthlyamount,decimal totalamount,decimal price)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    tblPlanCharge plnchrge = objdata.tblPlanCharges.Where(x => x.Id == ids).FirstOrDefault();
                    if(plnchrge !=null)
                    {
                        plnchrge.PlanId = Convert.ToInt32(planname);
                        plnchrge.EMI = emi;
                        plnchrge.Total_EMI = totalEmi;
                        plnchrge.Tax = tax;
                        plnchrge.Taxed_Amount = taxedamount;
                        plnchrge.Monthly_Amount = monthlyamount;
                        plnchrge.Total_Amount = totalamount;
                        plnchrge.Price = price;
                    }
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to delete plans for property..
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public int deleteplansforproperty(int ids)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                    
                {
                    tblPlansMaster planmaster = objdata.tblPlansMasters.Where(x => x.Id == ids).FirstOrDefault();
                    if (planmaster != null)
                    {
                        planmaster.IsActive = false;
                    }
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public void UpdateFlatIdStatus(int FlatId)
        {
            tblavailableblock k = con.da.tblavailableblocks.Where(x => x.Id == FlatId).FirstOrDefault();
            if(k!=null)
            {
                k.IsBooked = true;
            }
            con.da.SubmitChanges();
        }
        
    }
}
