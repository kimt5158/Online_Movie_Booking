using Lab4_template.DAL;
using Lab4_template.DTL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE1438_Group2_Project.GUI
{
    public partial class MovieDetailGUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int filmID = int.Parse(Request.QueryString[0]);
                Film f = FilmDAO.Search(filmID);
                Image2.ImageUrl = f.ImageUrl;
                lblTitle.Text = f.Title;
                lblDirector.Text = f.Director;
                lblActor.Text = f.Actor;
                lblCountry.Text = f.Country.CountryName;
                string result_genre = "";
                DataTable dtGenre = GenreDAO.SearchByFilmID(filmID);
                for(int i = 0; i < dtGenre.Rows.Count; i++)
                {
                    result_genre += dtGenre.Rows[i][1].ToString() + ", ";
                }
                lblGenre.Text = result_genre;
                lblPremiere.Text = f.Date.Date.ToString();
                lblTime.Text = f.Time.ToString() + " minutes";
                txtDes.Text = f.Description;
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilmGUI.aspx");
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            if (Session["user"].ToString() == "" || Session["user"] == null)
            {
                Response.Redirect("LoginGUI.aspx?ac=2");
            }
            else
            {
                Response.Redirect("BookingGUI.aspx?ID=" + Request.QueryString[0]);
            }   
        }
    }
}