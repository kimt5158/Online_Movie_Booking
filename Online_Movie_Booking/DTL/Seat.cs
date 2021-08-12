using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Lab4_template.DTL
{
    public class Seat
    {
        private int seatID;
        private string seatName;
        private int roomID;

        public int SeatID { get => seatID; set => seatID = value; }
        public string SeatName { get => seatName; set => seatName = value; }
        public int RoomID { get => roomID; set => roomID = value; }
    }
}