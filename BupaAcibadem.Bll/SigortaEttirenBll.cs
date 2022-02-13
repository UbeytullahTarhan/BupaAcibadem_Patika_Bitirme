using BupaAcibadem.Dal.Context;
using BupaAcibadem.Entity.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BupaAcibadem.Bll
{
   public class SigortaEttirenBll {

        //update eksik
        
        public bool Insert(SigortaEttiren sm)
        {
            string SpName = "SigortaEttirenCrud";
            string SType = "Insert";

            try
            {

                SqlParameter[] p = {
                    new SqlParameter("@SETc", sm.SETc),
                    new SqlParameter("@SEAdi", sm.SEAdi),
                    new SqlParameter("@SESoyadi", sm.SESoyadi),
                    new SqlParameter("@SECinsiyet", sm.SECinsiyet),
                    new SqlParameter("@SEDogumTarihi", sm.SEDogumTarihi),
                    new SqlParameter("@SETelefon", sm.SETelefon),
                    new SqlParameter("@SEEposta", sm.SEEposta),
                    new SqlParameter("@SEUlke", sm.SEUlke),
                    new SqlParameter("@SEAdres", sm.SEAdres),
                    new SqlParameter("@StatementType",SType),
                };
                DbContext db= DbContext.dbContext;
                
                return db.ExecuteNonQuery(SpName, p) > 0;
                
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            
        }
        public SigortaEttiren Find(int id,string ? tc)
        {

            string SpName = "SigortaEttirenCrud";
            string SType = "Find";
            SigortaEttiren sm=new SigortaEttiren();
            if (tc==null)
            {
                tc = "";
            }

            try
            {

                SqlParameter[] p = {
                    new SqlParameter("@SEId",id),
                    new SqlParameter("@SETc",tc),

                    new SqlParameter("@StatementType",SType),
                };
                
                DbContext db = DbContext.dbContext;

                SqlDataReader dr = db.ExecuteReader(SpName, p);
                if (dr.Read())
                {
                    
                    
                    sm.SEId = (int)dr["SEId"];
                    sm.SETc = dr["SETc"].ToString();
                    sm.SEAdi = dr["SEAdi"].ToString();
                    sm.SESoyadi = dr["SESoyadi"].ToString();
                    sm.SECinsiyet = Convert.ToChar(dr["SECinsiyet"]);
                    sm.SEDogumTarihi = (DateTime)dr["SEDogumTarihi"];
                    sm.SETelefon = dr["SETelefon"].ToString();
                    sm.SEEposta = dr["SEEposta"].ToString();
                    sm.SEUlke= dr["SEUlke"].ToString();
                    sm.SEAdres = dr["SEAdres"].ToString();
                    return sm;
                }
                dr.Close();
                return sm;

                
            }
            catch (SqlException ex)
            {
                throw ex;
            }

        }
        
        public bool  Delete(int id)
        {

            string SpName = "SigortaEttirenCrud";
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

        
        public List<SigortaEttiren> Select()
        {

            string SpName = "SigortaEttirenCrud";
            string SType = "Select";
            
            List<SigortaEttiren> lst = new List<SigortaEttiren>();


            try
            {

                SqlParameter[] p = {

                    new SqlParameter("@StatementType",SType),
                };

                DbContext db = DbContext.dbContext;
                
                SqlDataReader dr = db.ExecuteReader(SpName, p);

                while (dr.Read())
                {
                    SigortaEttiren sm = new SigortaEttiren {
                        SEId = (int)dr["SEId"],
                    SETc = dr["SETc"].ToString(),
                    SEAdi = dr["SEAdi"].ToString(),
                    SESoyadi = dr["SESoyadi"].ToString(),
                    SECinsiyet = Convert.ToChar(dr["SECinsiyet"]),
                    SEDogumTarihi = (DateTime)dr["SEDogumTarihi"],
                    SETelefon = dr["SETelefon"].ToString(),
                    SEEposta = dr["SEEposta"].ToString(),
                    SEUlke = dr["SEUlke"].ToString(),
                    SEAdres = dr["SEAdres"].ToString(),

                };
                    lst.Add(sm);
                    
                }
                dr.Close();
                return lst;


            }
            catch (SqlException ex)
            {
                throw ex;
            }

        }
        public bool Update(SigortaEttiren sm)
        {
            string SpName = "SigortaEttirenCrud";
            string SType = "Update";

            try
            {

                SqlParameter[] p = {
                    new SqlParameter("@SETc", sm.SETc),
                    new SqlParameter("@SEAdi", sm.SEAdi),
                    new SqlParameter("@SESoyadi", sm.SESoyadi),
                    new SqlParameter("@SECinsiyet", sm.SECinsiyet),
                    new SqlParameter("@SEDogumTarihi", "2012-02-02"),
                    new SqlParameter("@SETelefon", sm.SETelefon),
                    new SqlParameter("@SEEposta", sm.SEEposta),
                    new SqlParameter("@SEUlke", sm.SEUlke),
                    new SqlParameter("@SEAdres", sm.SEAdres),
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
