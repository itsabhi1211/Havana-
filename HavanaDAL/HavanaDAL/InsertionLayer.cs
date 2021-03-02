using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HavanaDAL
{

    public class InsertionLayer
    {
        connection con = new connection();
        /// <summary>
        /// Code for User registration
        /// </summary>
        /// <param name="reg"></param>
        /// <returns></returns>
       
        public static int userregistration(tblreg reg)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    reg.Crdt = DateTime.Now;
                    reg.Updt = DateTime.Now;
                    reg.IsActive = false;
                    reg.IsVerified = false;
                    objdata.tblregs.InsertOnSubmit(reg);
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
        /// code for user profile updation
        /// </summary>
        /// <param name="profile"></param>
        /// <returns></returns>
        
        public static int userprofileinsertion(tblprofile profile)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    profile.Updt = DateTime.Now;
                    profile.Crdt = DateTime.Now;
                    profile.IsActive = false;
                    objdata.tblprofiles.InsertOnSubmit(profile);
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
        /// code for user KYC details
        /// </summary>
        /// <param name="kyc"></param>
        /// <returns></returns>

        public static int userKYCdetails(tblkyc kyc)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    kyc.Crdt = DateTime.Now;
                    kyc.Updt = DateTime.Now;
                    kyc.IsActive = true;
                    objdata.tblkycs.InsertOnSubmit(kyc);
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
        /// code for checking if mail or contact exist or not
        /// </summary>
        /// <param name="Mail"></param>
        /// <param name="Contact"></param>
        /// <returns></returns>

        public IQueryable<tblreg>checkifmailorcontactexist(string Mail,long Contact )

        { 
            try
            {
                var q = con.da.tblregs.Where(x => x.Email == Mail || x.ContactNo == Contact);
                return q;
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public static int PropertyUpdation(tblProperty property)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    property.Crdt = DateTime.Now;
                    property.Updt = DateTime.Now;
                    property.IsActive = true;
                    objdata.tblProperties.InsertOnSubmit(property);
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public static int userProfileUpdation(int ids, string state, string city, string address,long pin)
        {
            tblprofile profile = new tblprofile();
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    profile.Updt = DateTime.Now;
                    profile.State = state;
                    profile.City = city;
                    profile.Address = address;
                    profile.Pin = pin;
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
        /// code for user's bank details
        /// </summary>
        /// <param name="bnk"></param>
        /// <returns></returns>

        public static int userBankdetails(tblbank bnk)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    bnk.Crdt = DateTime.Now;
                    bnk.Updt = DateTime.Now;
                    bnk.IsActive = true;
                    objdata.tblbanks.InsertOnSubmit(bnk);
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
        /// code for insertion of blocks 
        /// </summary>
        /// <param name="block"></param>
        /// <returns></returns>
        public static int insertblocks(tblblockcategory block)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    block.Crdt = DateTime.Now;
                    block.Updt = DateTime.Now;
                    block.IsActive = true;
                    objdata.tblblockcategories.InsertOnSubmit(block);
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
        /// code to insert no. of flats
        /// </summary>
        /// <param name="avlblock"></param>
        /// <returns></returns>
        public static int insertNoOFflats(tblavailableblock avlblock)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    avlblock.Crdt = DateTime.Now;
                    avlblock.Updt = DateTime.Now;
                    avlblock.IsActive = true;
                    avlblock.IsBooked = false;
                    objdata.tblavailableblocks.InsertOnSubmit(avlblock);
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
        /// code for contactUs
        /// </summary>
        /// <param name="contact"></param>
        /// <returns></returns>
        public static int ContactUs(tblcontactus contact)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    contact.Crdt = DateTime.Now;
                    contact.Updt = DateTime.Now;
                    contact.IsActive = true;
                    objdata.tblcontactus.InsertOnSubmit(contact);
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
        /// code to rply contact
        /// </summary>
        /// <param name="rply"></param>
        /// <returns></returns>
        public static int Rply(tblrplycontact rply)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    rply.Crdt = DateTime.Now;
                    rply.Updt = DateTime.Now;
                    rply.IsActive = true;
                    objdata.tblrplycontacts.InsertOnSubmit(rply);
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
        /// code to insert feedback
        /// </summary>
        /// <param name="feedbck"></param>
        /// <returns></returns>
        public static int feedback(tblfeedback feedbck)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    feedbck.Crdt = DateTime.Now;
                    feedbck.Updt = DateTime.Now;
                    feedbck.IsActive = true;
                    objdata.tblfeedbacks.InsertOnSubmit(feedbck);
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
        /// code to rply to the feedback
        /// </summary>
        /// <param name="fdrply"></param>
        /// <returns></returns>
        public static int rplyfeedback(FeebackRply fdrply)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    fdrply.Crdt = DateTime.Now;
                    fdrply.Updt = DateTime.Now;
                    fdrply.IsActive = true;
                    objdata.FeebackRplies.InsertOnSubmit(fdrply);
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
        /// code to insert into Payment plans...
        /// </summary>
        /// <param name="planmstr"></param>
        /// <returns></returns>
        public static int PaymentPlans(tblPlansMaster planmstr)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    planmstr.Crdt = DateTime.Now;
                    planmstr.Updt = DateTime.Now;
                    planmstr.IsActive = true;
                    objdata.tblPlansMasters.InsertOnSubmit(planmstr);
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
        /// code to insert plan details.....
        /// </summary>
        /// <param name="plancharges"></param>
        /// <returns></returns>
        public static int PaymentPlansDetails(tblPlanCharge plancharges)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {
                    plancharges.Crdt = DateTime.Now;
                    plancharges.Updt = DateTime.Now;
                    plancharges.IsActive = true;
                    objdata.tblPlanCharges.InsertOnSubmit(plancharges);
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
        /// code to insert data in emi mode
        /// </summary>
        /// <param name="emimode"></param>
        /// <returns></returns>
        public static int EMImode(tblEmiMode emimode)
        {
            try
            {
                using (var objdata = new HavanadataclassesDataContext())
                {


                    emimode.Crdt = DateTime.Now;
                    emimode.Updt = DateTime.Now;
                    emimode.IsActive = true;
                    objdata.tblEmiModes.InsertOnSubmit(emimode);
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }

}
