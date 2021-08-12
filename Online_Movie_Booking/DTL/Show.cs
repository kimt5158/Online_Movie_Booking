using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Lab4_template.DTL
{
    public class Show
    {
        private int showID;
        private int roomID;
        private int filmID;
        private DateTime showDate;
        private float price;
        private int slotID;

        public int ShowID { get => showID; set => showID = value; }
        public int RoomID { get => roomID; set => roomID = value; }
        public int FilmID { get => filmID; set => filmID = value; }
        public DateTime ShowDate { get => showDate; set => showDate = value; }
        public int SlotID { get => slotID; set => slotID = value; }
        public float Price { get => price; set => price = value; }
    }
}