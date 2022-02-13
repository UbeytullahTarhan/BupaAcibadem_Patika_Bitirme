using BupaAcibadem.Dal.Context;
using BupaAcibadem.Entity.Models;
using BupaAcibadem.Entity.Static;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BupaAcibadem.Bll
{
   public class PrimBll
    {
        enum PUrun
        {
            Yatarak = 800,
            YatarakVeAyakta = 1000,
            YatarakVeDogum = 1200,
            YatarakAyaktaDogun = 1800
        }
        public enum Yas
        {
            //0-15
            Cocuk = -10,
            //15-30
            Genc = -35,
            //+30
            Yaslı = 25
        }
        public bool Insert(Prim pm)
        {
            string SpName = "PrimCrud";
            string SType = "Insert";

            try
            {

                SqlParameter[] p = {
                    new SqlParameter("@PFiyat", pm.PFiyat),
                    new SqlParameter("@PTaksit", pm.PTaksit),
                    new SqlParameter("@SEId", pm.SEId),
                    


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
        public Prim Find(int id)
        {
            

            string SpName = "PrimCrud";
            string SType = "Find";
            Prim pm = new Prim();


            try
            {

                SqlParameter[] p = {
                    new SqlParameter("@SEId",id),

                    new SqlParameter("@StatementType",SType),
                };

                DbContext db = DbContext.dbContext;

                SqlDataReader dr = db.ExecuteReader(SpName, p);
                if (dr.Read())
                {


                    pm.PId = (int)dr["PId"];
                    pm.PFiyat =Convert.ToDecimal( dr["PFiyat"]);
                    pm.PTaksit =(int)(dr["PTaksit"]);
                    pm.SEId =(int) dr["SEId"];
                    
                    return pm;
                }
                dr.Close();
                return pm;


            }
            catch (SqlException ex)
            {
                throw ex;
            }

        }

        public bool Delete(int id)
        {

            string SpName = "PrimCrud";
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


        public List<Prim> Select(int id)
        {

            string SpName = "PrimCrud";
            string SType = "Select";
            Prim pm = new Prim();

            List<Prim> lst = new List<Prim>();


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
                    pm.PId = (int)dr["PId"];
                    pm.PFiyat = Convert.ToDecimal(dr["PFiyat"]);
                    pm.PTaksit = (int)(dr["PTaksit"]);
                    pm.SEId = (int)dr["SEId"];


                    lst.Add(pm);

                }
                dr.Close();
                return lst;


            }
            catch (SqlException ex)
            {
                throw ex;
            }

        }
        
        public Urun PrimCalculate(int id)
        {
            Urun um = new Urun();
            
            int Cocuk = 0;
            
            int Genc = 0;
            int Yaslı = 0;
            SigortalıBll bll = new SigortalıBll();
            List<Sigortalı> lst = bll.Select(id);
            foreach (var item in lst)
            {
                int yas = DateTime.Now.Year - item.SDogumTarihi.Year;
                if (yas <= 15)
                {
                    Cocuk++;
                }
                else if ((15 < yas) && (yas <= 30))
                {
                    Genc++;
                }
                else Yaslı++;
            }

            //Bu hesaplamaları genericleştir
            um.Yatarak = ((Cocuk * ((int)PUrun.Yatarak)+(Cocuk * ((int)PUrun.Yatarak)*((int)Yas.Cocuk)/100)))+ ((Genc * ((int)PUrun.Yatarak) + (Genc * ((int)PUrun.Yatarak) * ((int)Yas.Genc) / 100)))+ ((Yaslı * ((int)PUrun.Yatarak) + (Yaslı * ((int)PUrun.Yatarak) * ((int)Yas.Yaslı) / 100)));
            um.YatarakAyaktaDogun= ((Cocuk * ((int)PUrun.YatarakAyaktaDogun) + (Cocuk * ((int)PUrun.YatarakAyaktaDogun) * ((int)Yas.Cocuk) / 100))) + ((Genc * ((int)PUrun.YatarakAyaktaDogun) + (Genc * ((int)PUrun.YatarakAyaktaDogun) * ((int)Yas.Genc) / 100))) + ((Yaslı * ((int)PUrun.YatarakAyaktaDogun) + (Yaslı * ((int)PUrun.YatarakAyaktaDogun) * ((int)Yas.Yaslı) / 100)));
            um.YatarakVeAyakta=((Cocuk * ((int)PUrun.YatarakVeAyakta) + (Cocuk * ((int)PUrun.YatarakVeAyakta) * ((int)Yas.Cocuk) / 100))) + ((Genc * ((int)PUrun.YatarakVeAyakta) + (Genc * ((int)PUrun.YatarakVeAyakta) * ((int)Yas.Genc) / 100))) + ((Yaslı * ((int)PUrun.YatarakVeAyakta) + (Yaslı * ((int)PUrun.YatarakVeAyakta) * ((int)Yas.Yaslı) / 100)));
            um.YatarakVeDogum= ((Cocuk * ((int)PUrun.YatarakVeDogum) + (Cocuk * ((int)PUrun.YatarakVeDogum) * ((int)Yas.Cocuk) / 100))) + ((Genc * ((int)PUrun.YatarakVeDogum) + (Genc * ((int)PUrun.YatarakVeDogum) * ((int)Yas.Genc) / 100))) + ((Yaslı * ((int)PUrun.YatarakVeDogum) + (Yaslı * ((int)PUrun.YatarakVeDogum) * ((int)Yas.Yaslı) / 100)));
            return um;



        }
        public bool Update(Prim pm)
        {
            string SpName = "PrimCrud";
            string SType = "Update";

            try
            {

                SqlParameter[] p = {
                    new SqlParameter("@PFiyat", pm.PFiyat),
                    new SqlParameter("@PTaksit", pm.PTaksit),
                    new SqlParameter("@SEId", pm.SEId),
                    new SqlParameter("@PId", pm.PId),


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

