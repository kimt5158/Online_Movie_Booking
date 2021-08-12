using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Lab4_template.DTL
{
    public class Room
    {
        private int roomID;
        private string name;
        private int numberRows;
        private int numberCols;

        public int RoomID { get => roomID; set => roomID = value; }
        public string Name { get => name; set => name = value; }
        public int NumberRows { get => numberRows; set => numberRows = value; }
        public int NumberCols { get => numberCols; set => numberCols = value; }
    }
}