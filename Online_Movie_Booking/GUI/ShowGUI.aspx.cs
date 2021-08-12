using Lab3_Template.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE1438_Group2_Project.GUI
{
    public partial class ShowGUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            DateTime date = Calendar1.SelectedDate.Date;
            string sql = "Select s.ShowID, f.Title, f.ImageUrl, r.Name, sl.SlotName, s.Price " +
                "From Shows s, Rooms r, Slot sl, Films f " +
                "Where s.RoomID = r.RoomID and sl.SlotID = s.SlotID and s.FilmID = f.FilmID " +
                "and s.ShowDate = @date";
            SqlCommand cmd = new SqlCommand(sql);
            cmd.Parameters.AddWithValue("@date", date);
            DataTable dt = DAO.GetDataTable(cmd);
            if(dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
                lblNoi.Visible = false;
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
                lblNoi.Text = "No Show Available";
                lblNoi.Visible = true;
            }
            
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            DateTime date = Calendar1.SelectedDate.Date;

            GridView1.PageIndex = e.NewPageIndex;
            string sql = "select s.ShowId, f.Title,f.ImageUrl , r.Name, sl.SlotName, s.Price  " +
                         "from Shows as s, Rooms as r, Slot as sl, Films as f  " +
                         "where s.RoomID = r.RoomID and sl.SlotID = s.SlotID and s.FilmID = f.FilmID  " +
                         "and s.ShowDate = @date";
            SqlCommand cmd = new SqlCommand(sql);
            cmd.Parameters.AddWithValue("@date", date);
            DataTable dt = DAO.GetDataTable(cmd);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShowManageGUI.aspx");
        }
    }
}