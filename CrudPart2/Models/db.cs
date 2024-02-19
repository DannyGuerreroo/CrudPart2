using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CrudPart2.Models
{
    public static class db
    {
        public static string getConnection()
        {
            return "Server=.;Database=GourmetShop;Trusted_Connection=True;Encrypt=False";
        }
    }
}