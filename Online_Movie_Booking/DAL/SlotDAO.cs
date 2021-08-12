using Lab3_Template.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Lab4_template.DAL
{
    public class SlotDAO
    {


        public static DataTable GetSlotByDateAndFilmID(DateTime showDate, int filmID)
        {
            SqlCommand cmd = new SqlCommand("SELECT [Slot].SlotID, [Slot].SlotName\n " +
                                            "FROM [Shows] inner join [Slot] on [Shows].SlotID = [Slot].SLotID\n " +
                                            "WHERE [ShowDate] = @ShowDate AND [FilmID] = @FilmID");
            cmd.Parameters.AddWithValue("@ShowDate", showDate);
            cmd.Parameters.AddWithValue("@FilmID", filmID);

            return DAO.GetDataTable(cmd);

        }
    }
}