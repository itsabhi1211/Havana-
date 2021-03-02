using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HavanaDAL
{
    public class ShowDataLayer
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
        /// code for showing user reg details in profile
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

        public IQueryable<tblavailableblock> showavailableblocksonId(int BlockIds)
        {
            try
            {
                var q = con.da.tblavailableblocks.Where(x => x.BlockId == BlockIds);
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

        public IQueryable<tblavailableblock> showavailableblocksforsale(int ids)
        {
            try
            {
                var q = con.da.tblavailableblocks.Where(x => x.BlockId == ids);
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
        /// code to show payment plan details
        /// </summary>
        /// <returns></returns>
        public IQueryable<tblPlansMaster> PlansDetailsInDDL()
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

        public IQueryable<tblPlansMaster> showPlansOnPropertyId(int ids)


        {
            try
            {
                var q = con.da.tblPlansMasters.Where(x => x.PropertyId == ids);
                return q;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IQueryable<tblPlanCharge> showPlansChargesOnPlanMaster(int ids)


        {
            try
            {
                var q = con.da.tblPlanCharges.Where(x => x.PlanId == ids);
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
        /// code to show payment plans...
        /// </summary>
        /// <returns></returns>
        public Array PaymentPlansForProperties()
        {

            try
            {
               var query = from p in con.da.tblProperties
                            join f in con.da.tblavailableblocks on p.FlatId equals f.Id
                            join b in con.da.tblblockcategories on f.BlockId equals b.Id
                            join n in con.da.tblPlansMasters on p.Id equals n.PropertyId
                            where n.IsActive == true

                            select new
                            {
                                Id = p.Id,
                                Text = string.Format("{0} - {1}", b.BlockName, f.BlockNo),
                                PlanName = n.PlanName,
                                PlanId = n.Id,
                                n.IsActive



                            };
                return query.ToArray();
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }

        public Array ConcatenateEmisWithText(int PlanMasterId)
        {

            try
            {
                var query = from p in con.da.tblPlanCharges
                            where p.IsActive == true && p.PlanId == PlanMasterId
                            select new
                            {
                                Id = p.Id,
                                Text = string.Format("Total EMIs - {0}", p.Total_EMI),

                            };
                return query.ToArray();
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }


        /// <summary>
        /// code to join plan with properties...
        /// </summary>
        /// <returns></returns>
        public Array JoinPlannamewithproperty()
        {
            try
            {
                var q = from B in con.da.tblPlansMasters
                        join A in con.da.tblProperties on B.PropertyId equals A.Id
                        where A.IsActive == true
                        orderby A.Id descending
                        select new
                        {
                            Image = A.Image,
                            B.PlanName
                        };
                return q.ToArray();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to add properties...
        /// </summary>
        /// <returns></returns>
        public Array Propertydetails()
        {
            try
            {
                var q = from property in con.da.tblProperties
                        join avlblock in con.da.tblavailableblocks on property.FlatId equals avlblock.Id
                        join block in con.da.tblblockcategories on avlblock.BlockId equals block.Id
                        where property.IsActive == true
                        orderby avlblock.Id descending
                        select new
                        {
                            BlockNo = block.BlockName,
                            FlatNo = avlblock.BlockNo,
                            property.Image,
                            property.Address,
                            property.Price,
                            property.Bedroom,
                            property.Bathroom,
                            property.Area,
                            Type = property.For,
                            property.Id,
                            property.IsActive
                        };
                return q.ToArray();



            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        /// <summary>
        /// code to bind block name with flat name...
        /// </summary>
        /// <returns></returns>
        public Array bindblocknowithflatname()
        {
            try
            {
                var query = from p in con.da.tblProperties
                            join f in con.da.tblavailableblocks on p.FlatId equals f.Id
                            join b in con.da.tblblockcategories on f.BlockId equals b.Id

                            select new
                            {
                                Id = p.Id,
                                Text = string.Format("{0} - {1}", b.BlockName, f.BlockNo)

                            };
                return query.ToArray();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Array bindblocknowithflatnameForEMIPlans()
        {
            try
            {
                var query = from p in con.da.tblProperties
                            join f in con.da.tblavailableblocks on p.FlatId equals f.Id
                            join b in con.da.tblblockcategories on f.BlockId equals b.Id

                            select new
                            {
                                Id = p.Id,
                                PropertyName = string.Format("{0} - {1}", b.BlockName, f.BlockNo)

                            };
                return query.ToArray();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        /// <summary>
        /// code to bind flats with emi plans...
        /// </summary>
        /// <returns></returns>
        public Array bindflatswithEMIplans()
        {
            try
            {
                var q = from pc in con.da.tblPlanCharges
                        join pm in con.da.tblPlansMasters on pc.PlanId equals pm.Id
                        join pro in con.da.tblProperties on pm.PropertyId equals pro.Id
                        select new
                        {
                            PlanChargesId = pc.Id,
                            PlanMasterId = pm.Id,
                            PropertyId = pro.Id,
                            pc.Monthly_Amount,
                            pc.Price,
                            pc.Tax,
                            pc.Taxed_Amount,
                            pc.Total_Amount,
                            pc.Total_EMI,
                            pc.EMI,
                            pc.IsActive


                        };

                return q.ToArray();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to get blockid on flat id...
        /// </summary>
        /// <param name="FlatId"></param>
        /// <returns></returns>
        public int GetBlockIdOnFlatId(int FlatId)
        {
            int BlockId = con.da.tblavailableblocks.Where(x => x.Id == FlatId).Select(x => Convert.ToInt32(x.BlockId)).FirstOrDefault();
            return BlockId;
        }

        

        /// <summary>
        /// code to get planid on property id
        /// </summary>
        /// <param name="planid"></param>
        /// <returns></returns>
        public int GetPropertyIdOnPlanId(int PlanId)
        {
            int plan = con.da.tblPlansMasters.Where(x => x.Id == PlanId).Select(x => Convert.ToInt32(x.PropertyId)).FirstOrDefault();
            return plan;
        }

        public Array PropertydetailsOnId(int Ids)
        {
            try
            {
                var q = from property in con.da.tblProperties
                        join avlblock in con.da.tblavailableblocks on property.FlatId equals avlblock.Id
                        join block in con.da.tblblockcategories on avlblock.BlockId equals block.Id
                        where property.IsActive == true && property.Id == Ids
                        orderby avlblock.Id descending
                        select new
                        {
                            BlockNo = block.BlockName,
                            FlatNo = avlblock.BlockNo,
                            property.Image,
                            property.Address,
                            property.Price,
                            property.Bedroom,
                            property.Bathroom,
                            property.Area,
                            Type = property.For,
                            property.Id,
                            property.IsActive
                        };
                return q.ToArray();



            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        /// <summary>
        /// code to join plan with properties on Id...
        /// </summary>
        /// <returns></returns>
        public Array plandetailspropertyonId(int ids)
        {
            try
            {
                var query =
                            from p in con.da.tblProperties
                            join f in con.da.tblavailableblocks on p.FlatId equals f.Id
                            join b in con.da.tblblockcategories on f.BlockId equals b.Id
                            join n in con.da.tblPlansMasters on p.Id equals n.PropertyId
                            where n.IsActive == true && n.Id == ids

                            select new
                            {
                                Id = p.Id,
                                Text = string.Format("{0} - {1}", b.BlockName, f.BlockNo),
                                PlanName = n.PlanName,
                                PlanId = n.Id,

                                n.IsActive



                            };
                return query.ToArray();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Array EmiModeDetailsOfProperties()
        {
            try
            {
                var q =

                    from p in con.da.tblProperties
                    join f in con.da.tblavailableblocks on p.FlatId equals f.Id
                    join b in con.da.tblblockcategories on f.BlockId equals b.Id                  
                    join emimode in con.da.tblEmiModes on p.Id equals emimode.PropertyId
                    where p.IsActive == true
                    select new
                    {
                        emimode.Id,
                        PropertyName = string.Format("{0} - {1}", b.BlockName, f.BlockNo),
                        emimode.Mode,
                        emimode.Installment,
                        emimode.Amount                        
                    };
                return q.ToArray();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IQueryable<tblEmiMode> getPropertyDetailsOnEMIModeId(int ids)
        {
            var q = con.da.tblEmiModes.Where(x => x.Id == ids);
            return q;
           
        }

        
    }
}
