using BupaAcibadem.Dal.Context;
using BupaAcibadem.Entity.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BupaAcibadem.Bll
{
  public  class SigortalıBll
    {
        
        public bool Insert(Sigortalı sm)
        {
            string SpName = "SigortalıCrud";
            string SType = "Insert";

            try
            {

                SqlParameter[] p = {
                    new SqlParameter("@STc", sm.STc),
                    new SqlParameter("@SAdi", sm.SAdi),
                    new SqlParameter("@SSoyadi", sm.SSoyadi),
                    new SqlParameter("@SCinsiyet", sm.SCinsiyet),
                    new SqlParameter("@SDogumTarihi", sm.SDogumTarihi),
                    new SqlParameter("@STelefon", sm.STelefon),
                    new SqlParameter("@SEposta", sm.SEposta),
                    new SqlParameter("@SUlke", sm.SUlke),
                    new SqlParameter("@SAdres", sm.SAdres),
                    new SqlParameter("@SMeslek", sm.SMeslek),
                    new SqlParameter("@SYakınlık", sm.SYakınlık),
                    new SqlParameter("@SKilo", sm.SKilo),
                    new SqlParameter("@SBoy", sm.SBoy),
                    new SqlParameter("@SEId", sm.SEId),
                    
                    
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
        public Sigortalı Find(int id ,string ? tc)
        {
            if (tc==null)
            {
                tc = "";
            }
            
            string SpName = "SigortalıCrud";
            string SType = "Find";
            Sigortalı sm = new Sigortalı();


            try
            {

                SqlParameter[] p = {
                    new SqlParameter("@SId",id),

                    new SqlParameter("@StatementType",SType),
                };

                DbContext db = DbContext.dbContext;

                SqlDataReader dr = db.ExecuteReader(SpName, p);
                if (dr.Read())
                {


                    sm.SId = (int)dr["SId"];
                    sm.STc = dr["STc"].ToString();
                    sm.SAdi = dr["SAdi"].ToString();
                    sm.SSoyadi = dr["SSoyadi"].ToString();
                    sm.SCinsiyet = Convert.ToChar(dr["SCinsiyet"]);
                    sm.SDogumTarihi = (DateTime)dr["SDogumTarihi"];
                    sm.STelefon = dr["STelefon"].ToString();
                    sm.SEposta = dr["SEposta"].ToString();
                    sm.SUlke = dr["SUlke"].ToString();
                    sm.SAdres = dr["SAdres"].ToString();
                    sm.SMeslek = dr["SMeslek"].ToString();
                    sm.SYakınlık = dr["SYakınlık"].ToString();
                    sm.SKilo =Convert.ToDecimal(dr["SKilo"].ToString());
                    sm.SBoy = Convert.ToDecimal( dr["SBoy"].ToString());
                    sm.SEId=(int)dr["SEId"];
                    
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

        public bool Delete(int id)
        {

            string SpName = "SigortalıCrud";
            string SType = "Delete";
            try
            {

                SqlParameter[] p = {
                    new SqlParameter("@SId",id),

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


        public List<Sigortalı> Select(int id)
        {

            string SpName = "SigortalıCrud";
            string SType = "Select";
            Sigortalı sm = new Sigortalı();

            List<Sigortalı> lst = new List<Sigortalı>();


            try
            {

                SqlParameter[] p = {
                    new SqlParameter("@SEId",id),
                    new SqlParameter("@StatementType",SType),
                };

                DbContext db = DbContext.dbContext;

                SqlDataReader dr = db.ExecuteReader(SpName, p);

                while (dr.Read())
                {
                    sm.SId = (int)dr["SId"];
                    sm.STc = dr["STc"].ToString();
                    sm.SAdi = dr["SAdi"].ToString();
                    sm.SSoyadi = dr["SSoyadi"].ToString();
                    sm.SCinsiyet = Convert.ToChar(dr["SCinsiyet"]);
                    //sm.SDogumTarihi = (DateTime)dr["SDogumTarihi"];
                    sm.STelefon = dr["STelefon"].ToString();
                    sm.SEposta = dr["SEposta"].ToString();
                    sm.SUlke = dr["SUlke"].ToString();
                    sm.SAdres = dr["SAdres"].ToString();
                    sm.SMeslek = dr["SMeslek"].ToString();
                    sm.SYakınlık = dr["SYakınlık"].ToString();
                    sm.SKilo = Convert.ToDecimal(dr["SKilo"].ToString());
                    sm.SBoy = Convert.ToDecimal(dr["SBoy"].ToString());
                    sm.SEId = (int)dr["SEId"];

               
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
        public bool Update(Sigortalı sm)
        {
            string SpName = "SigortalıCrud";
            string SType = "Update";

            try
            {

                SqlParameter[] p = {
                    new SqlParameter("@STc", sm.STc),
                    new SqlParameter("@SAdi", sm.SAdi),
                    new SqlParameter("@SSoyadi", sm.SSoyadi),
                    new SqlParameter("@SCinsiyet", sm.SCinsiyet),
                    new SqlParameter("@SDogumTarihi", "2012-02-02"),
                    new SqlParameter("@STelefon", sm.STelefon),
                    new SqlParameter("@SEposta", sm.SEposta),
                    new SqlParameter("@SUlke", sm.SUlke),
                    new SqlParameter("@SAdres", sm.SAdres),
                    new SqlParameter("@SMeslek", sm.SMeslek),
                    new SqlParameter("@SYakınlık", sm.SYakınlık),
                    new SqlParameter("@SKilo", sm.SKilo),
                    new SqlParameter("@SBoy", sm.SBoy),
                    new SqlParameter("@SEId", sm.SEId),


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
