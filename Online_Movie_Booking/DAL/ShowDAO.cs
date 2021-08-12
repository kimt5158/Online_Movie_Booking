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
    public class ShowDAO
    {
        public static Show GetShowByShowID(int showID)
        {
            
            DataTable dt = DAO.GetDataTable("SELECT * FROM [Shows] WHERE [ShowID] = " + showID);

            DataRow row = dt.Rows[0];
            Show s = new Show();
            s.ShowID = (int)row["ShowID"];
            s.RoomID = (int)row["RoomID"];
            s.FilmID = (int)row["FilmID"];
            s.ShowDate = (DateTime)row["ShowDate"];
            s.SlotID = (int)row["SlotID"];
            s.Price = float.Parse(row["Price"].ToString());
            return s;
        }
      
        public static DataTable GetAllData(int filmID, DateTime showDate)
        {
            SqlCommand cmd = new SqlCommand("SELECT *, ([Name] + ' - ' + [SlotName]) as [Room_SLot]\n" +
                "FROM[Shows] inner join[Slot] on[Shows].SlotID = [Slot].SlotID\n" +
                "inner join[Rooms] on[Shows].RoomID = [Rooms].RoomID\n" +
                "WHERE[FilmID] = @FilmID AND[ShowDate] = @ShowDate");
            cmd.Parameters.AddWithValue("@FilmID", filmID);
            cmd.Parameters.AddWithValue("@ShowDate", showDate);
            return DAO.GetDataTable(cmd);
        }

        public static DataTable GetAllData2(DateTime showDate)
        {
            SqlCommand cmd = new SqlCommand("SELECT [Films].Title, [Films].ImageUrl,[Rooms].[Name],[Slot].SlotName, [Shows].Price\n" +
                "FROM[Shows] inner join[Slot] on[Shows].SlotID = [Slot].SlotID\n" +
                "inner join[Rooms] on[Shows].RoomID = [Rooms].RoomID\n" +
                "inner join[Films] on[Films].FilmID = [Shows].FilmID\n" +
                "WHERE[ShowDate] = @ShowDate");
            cmd.Parameters.AddWithValue("@ShowDate", showDate);
            return DAO.GetDataTable(cmd);
        }

        public static bool UpdateShow(int showID, string roomStatus)
        {
            SqlCommand cmd = new SqlCommand("UPDATE [Shows]\n" +
                "SET[RoomStatus] = @RoomStatus\n" +
                "WHERE[ShowID] = @ShowID");
            cmd.Parameters.AddWithValue("@ShowID", showID);
            cmd.Parameters.AddWithValue("@RoomStatus", roomStatus);
            return DAO.UpdateTable(cmd);
        }

    }
}