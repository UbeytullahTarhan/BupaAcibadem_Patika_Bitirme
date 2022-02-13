using BupaAcibadem.Dal.Context;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BupaAcibadem.Bll
{
    public class CustomerBll
    {
       
        DbContext db = DbContext.dbContext;
       
        public string Getir()
        {
            string a = "";
            SqlDataReader dr = db.ExecuteReader("select * from Products", null);
            while (dr.Read())
            {

                a = dr["ProductName"].ToString();

            }
            dr.Close();
            return a;
        }
    }
}
