using Lab3_Template.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE1438_Group2_Project.GUI
{
    public partial class MovieManageGUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (ViewState["IsUploaded"] == null)
            {
                ViewState["IsUploaded"] = (bool)false;
            }
            if (!IsPostBack)
            {
                if (Request.QueryString["add"] != null)
                {
                    int add = int.Parse(Request.QueryString["add"]);
                    if(add == 0)
                    {
                        Label1.Text = "Edit Movie";
                        string edid = Request.QueryString["edid"];
                        if(edid != null)
                        {
                            int filmID = int.Parse(edid);
                            SqlCommand cmd = new SqlCommand("Select f.FilmID, f.Title, f.ImageUrl, f.[Date], f.[Time], f.[Actor], " +
                                "f.[Description], c.CountryName, f.CountryID, f.Director " +
                                "From dbo.Films f join dbo.Countries c " +
                                "ON c.CountryID = f.CountryID Where f.FilmID = @id");
                            cmd.Parameters.AddWithValue("@id", filmID);
                            DataTable dt = DAO.GetDataTable(cmd);
                            DataRow row = dt.Rows[0];
                            txtTitle.Text = row["Title"].ToString();
                            txtActor.Text = row["Actor"].ToString();
                            txtRunTime.Text = row["Time"].ToString();
                            Calendar1.SelectedDate = DateTime.Parse(row["Date"].ToString());
                            txtDirector.Text = row["Director"].ToString();
                            txtDes.Text = row["Description"].ToString();
                            txtURL.Text = row["ImageUrl"].ToString();
                            Image2.ImageUrl = row["ImageUrl"].ToString();

                            //DDL Country
                            ddlCountry.DataSource = DAO.GetDataTable("Select * from dbo.Countries");
                            ddlCountry.DataTextField = "CountryName";
                            ddlCountry.DataValueField = "CountryID";
                            ddlCountry.SelectedValue = row["CountryID"].ToString();
                            ddlCountry.DataBind();

                            //Genre
                            DataTable dt1 = DAO.GetDataTable("Select * from Genres");
                            ListBox1.DataSource = dt1;
                            ListBox1.DataTextField = "Name";
                            ListBox1.DataValueField = "GenreID";
                            ListBox1.DataBind();
                            SqlCommand cmdGenre = new SqlCommand("Select g.* " +
                                "From Genres g join Film_Genre fg on fg.GenreID = g.GenreID " +
                                "Where fg.FilmID = @id");
                            cmdGenre.Parameters.AddWithValue("@id", filmID);
                            DataTable dtGenre = DAO.GetDataTable(cmdGenre);
                            foreach(ListItem item in ListBox1.Items)
                            {
                                foreach(DataRow rowGenre in dtGenre.Rows)
                                {
                                    if(rowGenre["GenreID"].ToString() == item.Value.ToString())
                                    {
                                        item.Selected = true;
                                    }
                                }
                            }
                        }
                    }
                    else
                    {
                        Label1.Text = "Add a movie";
                        txtTitle.Text = "";
                        txtActor.Text = "";
                        Calendar1.SelectedDate = DateTime.Today;
                        txtRunTime.Text = "";
                        ListBox1.ClearSelection();
                        txtDes.Text = "";
                        txtDirector.Text = "";

                        ddlCountry.DataSource = DAO.GetDataTable("Select * from Countries");
                        ddlCountry.DataTextField = "CountryName";
                        ddlCountry.DataValueField = "CountryID";
                        ddlCountry.SelectedIndex = 0;
                        ddlCountry.DataBind();

                        DataTable dt1 = DAO.GetDataTable("Select * from Genres");
                        ListBox1.DataSource = dt1;
                        ListBox1.DataTextField = "Name";
                        ListBox1.DataValueField = "GenreID";
                        ListBox1.DataBind();
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int add = int.Parse(Request.QueryString["add"]);
            if(add== 0)
            {
                string edid = Request.QueryString["edid"];
                int filmID = int.Parse(edid);

                //Update
                SqlCommand cmdUpdateFilm = new SqlCommand("Update Films Set Title = @title, " +
                    "[Date] = @date, CountryID = @countryid, [Time] = @runtime, ImageUrl = @url, " +
                    "Actor = @actor, Director = @director, [Description] = @description " +
                    "Where FilmID = @edid");
                cmdUpdateFilm.Parameters.AddWithValue("@edid", filmID);
                cmdUpdateFilm.Parameters.AddWithValue("@title", txtTitle.Text);
                cmdUpdateFilm.Parameters.AddWithValue("@date", Calendar1.SelectedDate);
                cmdUpdateFilm.Parameters.AddWithValue("@countryid", ddlCountry.SelectedValue);
                cmdUpdateFilm.Parameters.AddWithValue("@runtime", txtRunTime.Text);
                cmdUpdateFilm.Parameters.AddWithValue("@url", txtURL.Text);
                cmdUpdateFilm.Parameters.AddWithValue("@director", txtDirector.Text);
                cmdUpdateFilm.Parameters.AddWithValue("@description", txtDes.Text);
                cmdUpdateFilm.Parameters.AddWithValue("@actor", txtActor.Text);
                DAO.UpdateTable(cmdUpdateFilm);

                SqlCommand cmdDelete = new SqlCommand("Delete from Film_Genre Where FilmID = @id");
                cmdDelete.Parameters.AddWithValue("@id", filmID);
                DAO.UpdateTable(cmdDelete);
                foreach(ListItem item in ListBox1.Items)
                {
                    if(item.Selected == true)
                    {
                        SqlCommand cmdUpdateGenreOfFilm = new SqlCommand("Insert into Film_Genre(FilmID, GenreID) " +
                            "Values(@id, @genreid)");
                        cmdUpdateGenreOfFilm.Parameters.AddWithValue("@id", filmID);
                        cmdUpdateGenreOfFilm.Parameters.AddWithValue("@genreid", item.Value);
                        DAO.UpdateTable(cmdUpdateGenreOfFilm);
                    }
                }
                Response.Redirect("NotifiGUI.aspx?ac=2");
            }
            else //Add
            {
                if ((bool)ViewState["IsUploaded"])
                {
                    lblUpload.Text = "";
                    SqlCommand cmdAddNewFilm = new SqlCommand("Insert into Films " +
                        "(Title, [Date], CountryID, [Time], ImageUrl, Actor, Director, [Description] )" +
                        "Values (@title, @date, @countryid, @runtime, @url, @actor, @director, @description) " +
                        "SELECT SCOPE_IDENTITY();");
                    cmdAddNewFilm.Parameters.AddWithValue("@title", txtTitle.Text);
                    cmdAddNewFilm.Parameters.AddWithValue("@date", Calendar1.SelectedDate);
                    cmdAddNewFilm.Parameters.AddWithValue("@countryid", ddlCountry.SelectedValue);
                    cmdAddNewFilm.Parameters.AddWithValue("@runtime", txtRunTime.Text);
                    cmdAddNewFilm.Parameters.AddWithValue("@url", txtURL.Text);
                    cmdAddNewFilm.Parameters.AddWithValue("@director", txtDirector.Text);
                    cmdAddNewFilm.Parameters.AddWithValue("@description", txtDes.Text);
                    cmdAddNewFilm.Parameters.AddWithValue("@actor", txtActor.Text);
                    int filmID = DAO.UpdateTable1(cmdAddNewFilm);
                    foreach(ListItem item in ListBox1.Items)
                    {
                        if (item.Selected)
                        {
                            SqlCommand cmdUpdateGenreOfFilm = new SqlCommand("Insert into Film_Genre(FilmID, GenreID) " +
                            "Values(@id, @genreid)");
                            cmdUpdateGenreOfFilm.Parameters.AddWithValue("@id", filmID);
                            cmdUpdateGenreOfFilm.Parameters.AddWithValue("@genreid", item.Value);
                            DAO.UpdateTable(cmdUpdateGenreOfFilm);
                        }
                    }
                    Response.Redirect("NotifiGUI.aspx?ac=3");
                }
                else
                {
                    lblUpload.Text = "Upload Fail!";
                }
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string filename = Path.GetFileName(FileUpload1.FileName);
                FileUpload1.SaveAs(Server.MapPath("~/Images/") + filename);
                Image2.ImageUrl = "~/Images/" + filename;
                txtURL.Text = "~/Images/" + filename;
                lblUpload.Text = "";
                if (!string.IsNullOrEmpty(txtURL.Text))
                {
                    ViewState["IsUploaded"] = (bool)true;
                    lblUpload.Text = "Is Uploaded";
                }
            }
            else
            {
                lblUpload.Text = "Choose your file!";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilmGUI.aspx");
        }

        protected void btnCountry_Click(object sender, EventArgs e)
        {
            int add = int.Parse(Request.QueryString["add"]);
            if(add == 0)
            {
                string edid = Request.QueryString["edid"];
                Response.Redirect("AddCoutryGUI.aspx?add=0&edid=" + edid);
            }
            else
            {
                Response.Redirect("AddCountryGUI.aspx?add=1");
            }
        }

        protected void btnGenre_Click(object sender, EventArgs e)
        {
            int add = int.Parse(Request.QueryString["add"]);
            if(add == 0)
            {
                string edid = Request.QueryString["edid"];
                Response.Redirect("AddGenreGUI.aspx?add=0&edid=" + edid);
            }
            else
            {
                Response.Redirect("AddGenreGUI.aspx?add=1");
            }
        }
    }
}