using Lab4_template.DTL;
using Lab3_Template.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Lab4_template.DAL
{
    public class GenreDAO
    {
        public static DataTable GetDataTable()
        {
            string sql = "SELECT * FROM [Genre]";
            return DAO.GetDataTable(sql);

        }
        public static DataTable SearchByFilmID(int filmID)
        {
            DataTable dt = DAO.GetDataTable("SELECT [Genres].GenreID, [Genres].[Name]\n" +
                "FROM[Film_Genre] inner join[Genres] on[Film_Genre].GenreID = [Genres].GenreID\n" +
                "WHERE[FilmID]= " + filmID.ToString());           
            return dt;
        }
    }
}