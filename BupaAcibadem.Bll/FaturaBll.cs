using BupaAcibadem.Dal.Context;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BupaAcibadem.Bll
{
    public class FaturaBll
    {
        public bool Insert(int seid)
        {
            string SpName = "FaturaCrud";
            string SType = "Insert";

            try
            {

                SqlParameter[] p = {
                    new SqlParameter("@SEId", seid),
                    
                    new SqlParameter("@StatementType",SType),
                };
                DbContext db = DbContext.dbContext;

                return db.ExecuteNonQuery(SpName, p) > 0;

            }
            catch (SqlException ex)
            {
                throw ex;
            }

        }
        public int  Find(int seid)
        {

            string SpName = "FaturaCrud";
            string SType = "Find";
            
            

            try
            {

                SqlParameter[] p = {
                    new SqlParameter("@SEId",seid),

                    new SqlParameter("@StatementType",SType),
                };

                DbContext db = DbContext.dbContext;

                SqlDataReader dr = db.ExecuteReader(SpName, p);
                if (dr.Read())
                {


                    
                    return (int)dr["FId"]; ;
                }
                dr.Close();
                return 0;


            }
            catch (SqlException ex)
            {
                throw ex;
            }

        }

        public bool Delete(int id)
        {

            string SpName = "FaturaCrud";
            string SType = "Delete";
            try
            {

                SqlParameter[] p = {
                    new SqlParameter("@SEId",id),

                    new SqlParameter("@StatementType",SType),
                };

                DbContext db = DbContext.dbContext;
                return db.ExecuteNonQuery(SpName, p) > 0;





            }
            catch (SqlException ex)
            {
                throw ex;
            }

        }


       
        

    }
}

