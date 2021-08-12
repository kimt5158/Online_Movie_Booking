using Lab3_Template.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Lab4_template.DAL
{
    public class SeatDAO
    {
        public static DataTable GetSeatEmpty(int showID)
        {
            SqlCommand cmd = new SqlCommand("WITH r AS(\n" +
                "SELECT s.RoomID, b.SeatID, b.Username\n" +
                "FROM [Bookings] as b, [Shows] as s\n" +
                "WHERE b.ShowID = s.ShowID and s.ShowID = @ShowID1)\n" +
                "SELECT [Seat].SeatID,[SeatName] FROM r right join [Seat] on r.SeatID = [Seat].SeatID\n" +
                "WHERE [Username] is null AND [Seat].RoomID = (SELECT [RoomID] FROM [Shows] WHERE [ShowID] = @ShowID2)");
            cmd.Parameters.AddWithValue("@ShowID1", showID);
            cmd.Parameters.AddWithValue("@ShowID2", showID);
            return DAO.GetDataTable(cmd);

        }
        public static DataSet GetSeatEmpty2(int showID)
        {
            string sql = "WITH r AS(\n" +
                "SELECT s.RoomID, b.SeatID, b.Username\n" +
                "FROM [Bookings] as b, [Shows] as s\n" +
                "WHERE b.ShowID = s.ShowID and s.ShowID = " + showID + " )\n" +
                "SELECT [Seat].SeatID,[SeatName] FROM r right join [Seat] on r.SeatID = [Seat].SeatID\n" +
                "WHERE [Username] is null AND [Seat].RoomID = (SELECT [RoomID] FROM [Shows] WHERE [ShowID] = " + showID + ")";

            return DAO.GetDataSet(sql);
        }
    }
}