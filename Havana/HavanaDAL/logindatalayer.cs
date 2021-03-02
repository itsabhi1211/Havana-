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

        public IQueryable<tblreg> LoginWithMailId(string mail, string password)
        {
            var q = con.da.tblregs.Where(x => x.Email == mail && x.Password == password && x.IsActive == true);
            return q;
        }

        public IQueryable<tblreg> LoginWithContactNo(long Contact, string password)
        {
            var q1 = con.da.tblregs.Where(x => x.ContactNo == Contact && x.Password == password && x.IsActive == true);
            return q1;
        }
        public IQueryable<tblreg> LoginwithMailId(int Ids)
        {
            var r = con.da.tblregs.Where(x => x.Id == Ids && x.IsActive == true);
            return r;
        }
    }
}
