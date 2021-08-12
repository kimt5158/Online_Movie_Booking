using Lab4_template.DTL;
using Lab3_Template.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Lab4_template.DAL
{
    public class FilmDAO
    {
        public static DataTable GetDataTable()
        {
            string sql = "SELECT * FROM [Films]";
            return DAO.GetDataTable(sql);
        }
        public static Film Search(int filmID)
        {
            DataTable dt = DAO.GetDataTable("SELECT [Films].* , [Countries].CountryName \n" +
                "FROM[Films] inner join[Countries] on[Films].CountryID = [Countries].CountryID\n" +
                "WHERE FilmID = " + filmID.ToString());
            DataRow row = dt.Rows[0];

            Film f = new Film();
            f.FilmID = (int)row["FilmID"];
            f.Title = row["Title"].ToString();
            f.Date = (DateTime)row["Date"];
            Country c = new Country();
            c.CountryID = (int)row["CountryID"];
            c.CountryName = row["CountryName"].ToString();
            f.Country = c;
            f.Time = (int)row["Time"];
            f.ImageUrl = row["ImageUrl"].ToString();
            f.Actor = row["Actor"].ToString();
            f.Director = row["Director"].ToString();
            f.Description = row["Description"].ToString();
            return f;
        }
    }
}