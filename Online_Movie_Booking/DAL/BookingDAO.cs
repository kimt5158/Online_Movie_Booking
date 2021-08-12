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
    public class BookingDAO
    {

        public static DataTable GetDataTable()
        {
            string sql = "SELECT * FROM [Booking]";
            return DAO.GetDataTable(sql);

        }       

        public static bool Insert(Booking b)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [Bookings]([Username],[ShowID],[Amount],[SeatStatus])\n" +
                "VALUES(@Username, @ShowID, @Amount, @SeatStatus)");
            cmd.Parameters.AddWithValue("@Username", b.Username);
            cmd.Parameters.AddWithValue("@ShowID", b.ShowID);
            cmd.Parameters.AddWithValue("@Amount", b.Amount);
            cmd.Parameters.AddWithValue("@SeatStatus", b.SeatStatus);

            return DAO.UpdateTable(cmd);

        }

    }
}