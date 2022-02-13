
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using System.Configuration;
using System.Data.SqlClient;
using Microsoft.EntityFrameworkCore;



//using Oracle.DataAccess.Client;


namespace BupaAcibadem.Dal.Context
{
   public class DbContext
    {
        /// <summary>
        /// sorun bak
        /// </summary>
        

        static readonly DbContext context=new DbContext();
        string cstr = "Server=DESKTOP-7JGSSPE;Database=BupaAcibadem;Trusted_Connection=True;";

        SqlConnection cn = null;
        SqlCommand cmd = null;
        private DbContext()
        {

        }
        public static DbContext dbContext { get { return context; } }
        public int ExecuteNonQuery(string cmdtext, SqlParameter[] p)
        {
            try
            {
                using (cn = new SqlConnection(cstr))
                {
                    using (cmd = new SqlCommand(cmdtext, cn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        if (p != null)
                        {
                            List<SqlParameter> SqlParam = new List<SqlParameter>();
                            foreach (var item in p)
                            {
                                SqlParameter parameter = new SqlParameter();
                                parameter.ParameterName = item.ParameterName;
                                parameter.Value = item.Value;
                                SqlParam.Add(parameter);

                            }
                            cmd.Parameters.AddRange(SqlParam.ToArray());
                            SqlParam.Clear();


                        }
                        cn.Open();
                        return cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public SqlDataReader ExecuteReader(string cmdtext, SqlParameter[] p)
        {
            cn = new SqlConnection(cstr);
            using (cmd = new SqlCommand(cmdtext, cn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                if (p != null)

                {
                    List<SqlParameter> SqlParam = new List<SqlParameter>();
                    foreach (var item in p)
                    {
                        SqlParameter parameter = new SqlParameter();
                        parameter.ParameterName = item.ParameterName;
                        parameter.Value = item.Value;
                        SqlParam.Add(parameter);

                    }
                    cmd.Parameters.AddRange(SqlParam.ToArray());
                    SqlParam.Clear();
                }
                cn.Open();
                return cmd.ExecuteReader(CommandBehavior.CloseConnection);
            }
        }
        public DataTable MyDataTable(string cmdtext, SqlParameter[] p)
        {
            using (cn = new SqlConnection(cstr))
            {
                SqlDataAdapter da = new SqlDataAdapter(cmdtext, cn);
                if (p != null)
                {

                    da.SelectCommand.Parameters.AddRange(p);
                }
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

       
    }

    }

