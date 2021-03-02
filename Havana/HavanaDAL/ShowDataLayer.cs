using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HavanaDAL;

namespace HavanaDAL
{
  public  class ShowDataLayer
    {
        connection con = new connection();
        /// <summary>
        /// Code for Pending Users
        /// </summary>
        /// <returns></returns>

        public IQueryable<tblreg> showPendingdUsers()
        {
            try
            {
                var q = con.da.tblregs.Where(x => x.IsActive == false).OrderByDescending(x => x.Id);
                return q;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code for approved Users
        /// </summary>
        /// <returns></returns>

        public IQueryable<tblreg> showApproveddUsers()
        {
            try
            {
                var q = con.da.tblregs.Where(x => x.IsActive == true).OrderByDescending(x => x.Id);
                return q;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code for verified Users
        /// </summary>
        /// <returns></returns>

        public IQueryable<tblreg> showVerifiedUsers()
        {
            try
            {
                var q = con.da.tblregs.Where(x => x.IsVerified == true).OrderByDescending(x => x.Id);
                return q;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code for Non verifiedUsers
        /// </summary>
        /// <returns></returns>

        public IQueryable<tblreg> showNonVerifieddUsers()
        {
            try
            {
                var q = con.da.tblregs.Where(x => x.IsVerified == false).OrderByDescending(x => x.Id);
                return q;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code for updation of properties
        /// </summary>
        /// <returns></returns>
        /// 
        public IQueryable<tblProperty> propertydetails()
        {
            try
            {
                var q = con.da.tblProperties.Where(x => x.IsActive == true).OrderByDescending(x => x.Id);
                return q;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        /// <summary>
        /// code for showing user profile
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public IQueryable<tblprofile> showuserdata(int ids)
        {
            try
            {
                var q = con.da.tblprofiles.Where(x => x.RegId == ids);
                return q;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code for showing user reg details
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public IQueryable<tblreg> showreguserdata(int ids)
        {
            try
            {
                var q = con.da.tblregs.Where(x => x.Id == ids);
                return q;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code for showing user KYC details
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public IQueryable<tblkyc> showuserKYCdetails(int ids)
        {
            try
            {
                var r = con.da.tblkycs.Where(x => x.RegId == ids);
                return r;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code for showing user Bank details
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>

        public IQueryable<tblbank> showuserBankdetails(int ids)
        {
            try
            {
                var q = con.da.tblbanks.Where(x => x.RegId == ids);
                return q;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        /// <summary>
        /// code for updating profile image
        /// </summary>
        /// <param name="Ids"></param>
        /// <returns></returns>
        public string GetFileNameOnRegId(int Ids)
        {
            string Name = con.da.tblprofiles.Where(x => x.RegId == Ids).Select(x => x.Picture).FirstOrDefault();
            return Name;
        }
        /// <summary>
        /// code for showing details of properties for updation
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public IQueryable<tblProperty> showPropertiesDetails(int ids)
        {
            try
            {
                var q = con.da.tblProperties.Where(x => x.Id == ids);
                return q;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// /code to show block categories
        /// </summary>
        /// <returns></returns>
        public IQueryable<tblblockcategory> showblockcategories()
        {
            try
            {
                var q = con.da.tblblockcategories.Where(x => x.IsActive == true);
                return q;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IQueryable<tblblockcategory> AvailableBlocks()
        {
            try
            {
                var q = con.da.tblblockcategories.Where(x => x.IsActive == true).OrderByDescending(x => x.Id); ;
                return q;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        /// <summary>
        /// code to show blocks categories for updation of its name
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public IQueryable<tblblockcategory> blockcategories(int ids)
        {
            try
            {
                var q = con.da.tblblockcategories.Where(x => x.Id == ids);
                return q;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to show Flats in grid
        /// </summary>
        /// <returns></returns>
        public IQueryable<tblavailableblock> AvlFlats()
        {
            try
            {
                var q = con.da.tblavailableblocks.Where(x => x.IsActive == true);
                return q;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        /// <summary>
        /// code to show flats name for updating its name.
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public IQueryable<tblavailableblock> EditAvlflatsName(int ids)
        {
            try
            {
                var q = con.da.tblavailableblocks.Where(x => x.Id == ids);
                return q;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to binding blocks name and flat number
        /// </summary>
        /// <returns></returns>
        public Array JoinTwoTables()
        {
            try
            {
                var q = from B in con.da.tblblockcategories
                        join A in con.da.tblavailableblocks on B.Id equals A.BlockId
                        where A.IsActive == true
                        orderby A.Id descending
                        select new
                        {
                            BlockName = B.BlockName,
                            BlockNumber = A.BlockNo,
                            A.Id,
                            A.BlockId,
                            A.IsActive,
                            A.IsBooked
                        };
                return q.ToArray();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to delete flats and its details
        /// </summary>
        /// <param name="Ids"></param>
        /// <returns></returns>
        public IQueryable<tblavailableblock> DeleteAllRecordsOnId(int Ids)
        {
            var q = con.da.tblavailableblocks.Where(x => x.BlockId == Ids);
            if (q.Any())
            {
                foreach (tblavailableblock k in q)
                {
                    k.IsActive = false;
                }

            }
            con.da.SubmitChanges();
            return q;
        }
        /// <summary>
        /// code to show ContactUs details
        /// </summary>
        /// <returns></returns>
        public IQueryable<tblcontactus> ShowContactUsDetails()
        {
            try
            {
                var q = con.da.tblcontactus.Where(x => x.IsActive == true);
                return q;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to rply for contact
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public IQueryable<tblcontactus> rply(int ids)
        {
            try
            {
                var q = con.da.tblcontactus.Where(x => x.Id == ids);
                return q;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code for showing feedback...
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public IQueryable<tblfeedback> fdbck()
        {
            try
            {
                var q = con.da.tblfeedbacks.Where(x => x.IsActive == true);
                return q;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        /// <summary>
        /// code to see reply details of contact us
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public IQueryable<tblrplycontact> rplycontact(int ids)
        {
            try
            {
                var q = con.da.tblrplycontacts.Where(x => x.ContactId == ids);
                return q;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to rply
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public IQueryable<tblfeedback> rplyfeedback(int ids)
        {
            try
            {
                var q = con.da.tblfeedbacks.Where(x => x.Id == ids);
                return q;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to show feedback replies of particular user...
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public IQueryable<FeebackRply> showfeebackRplies(int ids)
        {
            try
            {
                var q = con.da.FeebackRplies.Where(x => x.RplyId == ids);
                return q;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to filter feedbacks on behalf of rating....
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public IQueryable<tblfeedback> Ratinglist(char rating)
        {
            try
            {
                var q = con.da.tblfeedbacks.Where(x => x.Rating == rating);
                return q;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to show payment plans...
        /// </summary>
        /// <returns></returns>
        public IQueryable<tblPlansMaster> PaymentPlans()
        {

            try
            {
                var q = con.da.tblPlansMasters.Where(x => x.IsActive == true);
                return q;
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }


        /// <summary>
        /// code to show payment plan details
        /// </summary>
        /// <returns></returns>
        public IQueryable<tblPlanCharge> PlansDetails()
        {
            try
            {
                var q = con.da.tblPlanCharges.Where(x => x.IsActive == true);
                return q;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to show payment plan for Updation...
        /// </summary>
        /// <returns></returns>
        public IQueryable<tblPlansMaster> showPlansforUpdation(int ids)
        {
            try
            {
                var q = con.da.tblPlansMasters.Where(x => x.Id == ids);
                return q;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to show payment plan details for Updation...
        /// </summary>
        /// <returns></returns>
        public IQueryable<tblPlanCharge> showPlansDetailsforUpdation(int ids)
        {
            try
            {
                var q = con.da.tblPlanCharges.Where(x => x.Id == ids);
                return q;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to show no. of Registerd Users
        /// </summary>
        /// <returns></returns>
        public int CountTotalUsers()
        {
            int Count = con.da.tblregs.Count();
            return Count;
        }

        /// <summary>
        /// code to show no.of pending users
        /// </summary>
        /// <returns></returns>
        public int CountTotalPendingUsers()
        {
            int Count = con.da.tblregs.Where(x => x.IsActive == false).Count();
            return Count;
        }

        /// <summary>
        /// code to show total approved users..
        /// </summary>
        /// <returns></returns>
        public int CountTotalApprovedUsers()
        {
            int Count = con.da.tblregs.Where(x => x.IsActive == true).Count();
            return Count;

        }

        /// <summary>
        /// code to show total Verified users..
        /// </summary>
        /// <returns></returns>
        public int CountTotalVerifiedUsers()
        {
            int Count = con.da.tblregs.Where(x => x.IsVerified == true).Count();
            return Count;
        }

        /// <summary>
        /// code to show total Non verified users..
        /// </summary>
        /// <returns></returns>
        public int CountTotalNonVerifiedUsers()
        {
            int Count = con.da.tblregs.Where(x => x.IsVerified == false).Count();
            return Count;
        }

        /// <summary>
        /// count properties..
        /// </summary>
        /// <returns></returns>
        public int CountProperties()
        {
            int Count = con.da.tblProperties.Where(x => x.IsActive == true).Count();
            return Count;
        }


        /// <summary>
        /// count feedback on the day of login...
        /// </summary>
        /// <returns></returns>
        public int CountFeedback()
        {
            int Count = con.da.tblfeedbacks.Where(x => x.IsActive == true && Convert.ToDateTime(x.Crdt).Date == DateTime.Now.Date).Count();
            return Count;
        }

        /// <summary>
        /// count contact us on the day of login..
        /// </summary>
        /// <returns></returns>
        public int CountContactus()
        {
            int Count = con.da.tblcontactus.Where(x => x.IsActive == true && Convert.ToDateTime(x.Crdt).Date == DateTime.Now.Date).Count();
            return Count;
        }

        /// <summary>
        /// code to fet feedback on the particular day of login...
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        public IQueryable<tblfeedback> checkFeedbackOnDay()
        {
            var q = con.da.tblfeedbacks.Where(x => Convert.ToDateTime(x.Crdt).Date == DateTime.Now.Date);
            return q;
        }

        /// <summary>
        /// code to check contact us on the day of login...
        /// </summary>
        /// <returns></returns>
        public IQueryable<tblcontactus> checkContactUsOnDay()
        {
            var q = con.da.tblcontactus.Where(x => Convert.ToDateTime(x.Crdt).Date == DateTime.Now.Date);
            return q;
        }

        public IQueryable<tblPlanCharge> GetPlanChargesDetails()
        {
            var q = con.da.tblPlanCharges.Where(x => x.IsActive == true);
            return q;
        }
    }
}
