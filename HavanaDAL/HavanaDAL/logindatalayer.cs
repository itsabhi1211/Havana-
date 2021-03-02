using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HavanaDAL;

namespace HavanaDAL
{
   public class logindatalayer
    {
        connection con = new connection();

        /// <summary>
        /// code for login with E-mail....
        /// </summary>
        /// <param name="mail"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public IQueryable<tblreg> LoginWithMailId(string mail,string password)
        {
            var q = con.da.tblregs.Where(x => x.Email == mail && x.Password == password && x.IsActive == true);
            return q;
        }


        /// <summary>
        /// code for login with contact no.
        /// </summary>
        /// <param name="Contact"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public IQueryable<tblreg> LoginWithContactNo(long Contact, string password)
        {
            var q1 = con.da.tblregs.Where(x => x.ContactNo == Contact && x.Password == password && x.IsActive == true);
            return q1;
        }

        /// <summary>
        /// code for checking mail for forgot password...
        /// </summary>
        /// <param name="Ids"></param>
        /// <returns></returns>
        public IQueryable<tblreg> LoginwithMailId(int Ids)
        {
            var r = con.da.tblregs.Where(x => x.Id == Ids && x.IsActive == true);
            return r;
        }

        /// <summary>
        /// code for forgot password...
        /// </summary>
        /// <param name="mail"></param>
        /// <returns></returns>
        public IQueryable<tblreg> ForgotPassword(string mail)
        {
            var q = con.da.tblregs.Where(x => x.Email == mail);
            return q;
        }
    }
}
