using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Lab4_template.DTL
{
    public class Film
    {
        private int filmID;
        private string title;
        private DateTime date;
        private Country country;
        private int time;
        private string imageUrl;
        private string actor;
        private string director;
        private string description;

        public int FilmID { get => filmID; set => filmID = value; }
        public string Title { get => title; set => title = value; }
        public DateTime Date { get => date; set => date = value; }
        public int Time { get => time; set => time = value; }
        public string ImageUrl { get => imageUrl; set => imageUrl = value; }
        public string Actor { get => actor; set => actor = value; }
        public string Director { get => director; set => director = value; }
        public string Description { get => description; set => description = value; }
        public Country Country { get => country; set => country = value; }
    }
}