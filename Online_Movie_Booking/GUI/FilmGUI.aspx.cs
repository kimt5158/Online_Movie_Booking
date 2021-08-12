using Lab3_Template.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE1438_Group2_Project.GUI
{
    public partial class FilmGUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = DAO.GetDataTable("SELECT f.FilmID, f.Title, f.ImageUrl, f.[Date],  " +
                                            "c.CountryName, f.[Time], f.[Description] " +
                                            "FROM dbo.Films AS f INNER JOIN dbo.Countries AS c " +
                                            "ON c.CountryID = f.CountryID");
                
            GridView1.DataSource = dt;
            GridView1.DataBind();
            if ((int)Session["role"] == 1)
            {
                btnAdd.Visible = true;
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("MovieManageGUI.aspx?add=1");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Detail")
            {
                int FilmID = int.Parse(GridView1.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text);
                if ((int)Session["role"] == 1)
                {
                    Response.Redirect("MovieManageGUI.aspx?add=0&edid=" + FilmID);
                }
                else
                {
                    Response.Redirect("MovieDetailGUI.aspx?ID=" + FilmID);
                }
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                e.Row.Cells[3].Text = DateTime.Parse(e.Row.Cells[3].Text).ToString("dd/MM/yyyy");
            }
            catch { }
        }
    }
}