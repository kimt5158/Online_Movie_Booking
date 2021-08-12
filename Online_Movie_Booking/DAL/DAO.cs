using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Lab3_Template.DAL
{
    class DAO
    {
        static string strConn = ConfigurationManager.ConnectionStrings["CinemaConnectionString"].ConnectionString;
        
        static public DataTable GetDataTable(string sqlSelect)
        {
            try
              {
                    SqlConnection conn = new SqlConnection(strConn);
                    SqlDataAdapter da = new SqlDataAdapter(sqlSelect, conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
              }
            catch (Exception ex)
              {
                throw new Exception(ex.Message);
            }
        }

        static public DataTable GetDataTable(SqlCommand cmd)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strConn);
                cmd.Connection = conn;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        static public bool UpdateTable(SqlCommand cmd)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strConn);
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                return true;
                
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);

            }

        }

        static public DataSet GetDataSet(string sql)
        {
            SqlCommand cmd = new SqlCommand(sql);
            using (SqlConnection con = new SqlConnection(strConn))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataSet ds = new DataSet())
                    {
                        sda.Fill(ds);
                        return ds;
                    }
                }
            }

        }
        static public int UpdateTable1(SqlCommand cmd) //Tra ve id cuoi cung cua ban ghi khi co cau 
                                                       //query chua SELECT SCOPE_IDENTITY();
        {
            try
            {
                SqlConnection conn = new SqlConnection(strConn);
                cmd.Connection = conn;
                conn.Open();
                int key = Convert.ToInt32(cmd.ExecuteScalar());
                conn.Close();
                return key;

            }
            catch (Exception ex)
            {
                return -1;

            }

        }

        public static bool loginCheck(String username, String password)
        {
            SqlConnection con = new SqlConnection(strConn);
            con.Open();
            String sql = "select count (*) from account where username=@user and password=@pass";
            SqlCommand sqlCommand = new SqlCommand(sql, con);
            sqlCommand.Parameters.Add("@user", SqlDbType.NChar).Value = username;
            sqlCommand.Parameters.Add("@pass", SqlDbType.NChar).Value = password;
            int result = Convert.ToInt32(sqlCommand.ExecuteScalar());
            con.Close();
            return result > 0 ? true : false;


        }
    }
}
