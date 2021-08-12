using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Lab4_template.DTL
{
    public class Country
    {
        private int countryID;
        private string countryName;

        public int CountryID { get => countryID; set => countryID = value; }
        public string CountryName { get => countryName; set => countryName = value; }
    }
}