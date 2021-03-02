using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HavanaDAL
{
    public class TransactionAccessLayer
    {
        connection con = new connection();

        #region booking report

        public Array BookingReport()
        {
            var q = from User in con.da.tblregs
                    join Payment in con.da.tblPayments on User.Id equals Payment.UserId
                    join EmiModes in con.da.tblEmiModes on Payment.EMiModeId equals EmiModes.Id
                    join Property in con.da.tblProperties on EmiModes.PropertyId equals Property.Id
                    join Flat in con.da.tblavailableblocks on Property.FlatId equals Flat.Id
                    join Block in con.da.tblblockcategories on Flat.BlockId equals Block.Id
                    select new
                    {
                        User.Id,
                        EmiId = Payment.EMiModeId,
                        Payment.TotalAmount,
                        Payment.PaidAmount,
                        Payment.DueAmount,
                        Payment.ExtraCharge,
                        Payment.InstallmentNo,
                        Payment.NextDate,
                        Payment.PaymentDate,
                        Payment.IsPaymentCompleted,
                        PropertyId = Property.Id,
                        FlatId = Flat.Id,
                        BlockId = Block.Id,
                        
                    };
                   return q.ToArray();
        }

        #endregion


        public IQueryable<tblPaymentHistory> paymenthistory(int userid, int emimodeid)
        {
            try
            {
                var q = con.da.tblPaymentHistories.Where(x => x.IsActive == true && x.UserId==userid && x.EMiModeId==emimodeid);
                return q;
            }
            catch (Exception ex)
            {
                throw ex;

            }
        }

        public IQueryable<tblEmiMode> getEmiModedetailsonEmiModeId(int emimodeid)
        {
            try
            {
                var q = con.da.tblEmiModes.Where(x => x.IsActive == true && x.Id==emimodeid);
                return q;
            }
            catch(Exception ex)
            {
                throw ex;
            }
        


        }

        public IQueryable<tblPaymentMode> getpaymentModedetailsonEmiModeId(int userid, int emimodeid)
        {
            try
            {
                var q = con.da.tblPaymentModes.Where(x => x.IsActive == true && x.UserId==userid && x.EMiModeId==emimodeid);
                return q;
            }
            catch (Exception ex)
            {
                throw ex;
            }



        }

        public IQueryable<tblProperty> getflatdetailsOnFlatId(int flatid)
        {
            try
            {
                var q = con.da.tblProperties.Where(x => x.IsActive == true && x.FlatId == flatid);
                return q;
            }
            catch (Exception ex)
            {
                throw ex;
            }



        }
    }
}
