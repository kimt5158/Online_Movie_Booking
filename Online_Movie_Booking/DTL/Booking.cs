using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Lab4_template.DTL
{
    public class Booking
    {
        private int bookingID;
        private int showID;
        private string username;
        private float amount;
        private string seatStatus;

        public int BookingID { get => bookingID; set => bookingID = value; }
        public int ShowID { get => showID; set => showID = value; }
        public string Username { get => username; set => username = value; }
        public float Amount { get => amount; set => amount = value; }
        public string SeatStatus { get => seatStatus; set => seatStatus = value; }
    }
}