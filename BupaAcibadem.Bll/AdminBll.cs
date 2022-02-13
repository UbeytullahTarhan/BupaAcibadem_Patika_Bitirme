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
    public class AdminBll
    {
        public List<Admin> Select(string  a, string  t,string  s)
        {

            string SpName = "AdminSelect";
            string SType = "Select";

            List<Admin> lst = new List<Admin>();
            

            try
            {

                SqlParameter[] p = {
                    new SqlParameter("@SEAdi",a),
                    new SqlParameter("@SETc",t),
                    new SqlParameter("@SESoyadi",s),
                    new SqlParameter("@StatementType",SType),
                };

                DbContext db = DbContext.dbContext;

                SqlDataReader dr = db.ExecuteReader(SpName, p);

                while (dr.Read())
                {
                    Admin am = new Admin
                    {

                        SETc = dr["SETc"].ToString(),
                        SEAdi = dr["SEAdi"].ToString(),
                        SESoyadi = dr["SESoyadi"].ToString(),
                        SECinsiyet = Convert.ToChar(dr["SECinsiyet"]),
                        SEDogumTarihi = (DateTime)dr["SEDogumTarihi"],
                        SETelefon = dr["SETelefon"].ToString(),
                        SEEposta = dr["SEEposta"].ToString(),
                        SEUlke = dr["SEUlke"].ToString(),
                        SEAdres = dr["SEAdres"].ToString(),
                        PFiyat =Convert.ToDecimal( dr["PFiyat"]),
                        PTaksit =(int)dr["PTaksit"],
                        SatınAlındı = (int)dr["FId"]== 0 ? false : true,

                    };
                    lst.Add(am);

                }
                dr.Close();
                return lst;


            }
            catch (SqlException ex)
            {
                throw ex;
            }

        }
    }
}
