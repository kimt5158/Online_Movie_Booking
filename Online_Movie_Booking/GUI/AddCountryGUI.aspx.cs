using Lab3_Template.DAL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE1438_Group2_Project.GUI
{
    public partial class AddCountryGUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int add = int.Parse(Request.QueryString["add"]);
            SqlCommand cmdAddGenre = new SqlCommand("Insert into Countries( CountryName ) " +
                "Values ( @countryName )");
            cmdAddGenre.Parameters.AddWithValue("@countryName", txtCountry.Text);
            DAO.UpdateTable(cmdAddGenre);
            if(add == 0)
            {
                string edid = Request.QueryString["edid"];
                Response.Redirect("MovieManageGUI.aspx?add=0&edid=" + edid);
            }
            else
            {
                Response.Redirect("MovieManageGUI.aspx?add=1");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            int add = int.Parse(Request.QueryString["add"]);
            if (add == 0)
            {
                string edid = Request.QueryString["edid"];
                Response.Redirect("MovieManageGUI.aspx?add=0&edid=" + edid);
            }
            else
            {
                Response.Redirect("MovieManageGUI.aspx?add=1");
            }
        }
    }
}