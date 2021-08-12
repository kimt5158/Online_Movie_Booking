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
    public class RoomDAO
    {
        public static DataTable GetDataTable()
        {
            string sql = "SELECT * FROM [Rooms]";
            return DAO.GetDataTable(sql);

        }
       
        public static Room GetRoomByShowID(int showID)
        {
            SqlCommand cmd = new SqlCommand("SELECT [Rooms].*\n" +
                "FROM[Shows] inner join[Rooms] on[Shows].RoomID = [Rooms].RoomID\n" +
                "WHERE[Shows].ShowID = @ShowID");
            cmd.Parameters.AddWithValue("@ShowID", showID);
            DataTable dt = DAO.GetDataTable(cmd);
            DataRow row = dt.Rows[0];
            Room r = new Room();
            r.RoomID = (int)row["RoomID"];
            r.Name = row["Name"].ToString();
            r.NumberCols = (int)row["NumberCols"];
            r.NumberRows = (int)row["NumberRows"];
            return r;
        }
        public static string GetRoomByRoomID2(int roomID)
        {
            SqlCommand cmd = new SqlCommand("SELECT [Rooms].*\n" +
                "FROM [Rooms]\n" +
                "WHERE[RoomID] = @roomID");
            cmd.Parameters.AddWithValue("@roomID", roomID);
            DataTable dt = DAO.GetDataTable(cmd);
            DataRow row = dt.Rows[0];
            Room r = new Room();
            r.RoomID = (int)row["RoomID"];
            r.Name = row["Name"].ToString();
            r.NumberCols = (int)row["NumberCols"];
            r.NumberRows = (int)row["NumberRows"];
            string result = "";
            for(int i=0; i<(r.NumberCols * r.NumberRows); i++)
            {
                result += "0";
            }
            return result;
        }
    }
}