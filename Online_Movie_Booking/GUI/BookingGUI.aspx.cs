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
    public partial class BookingGUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int filmID = int.Parse(Request.QueryString[0]);
                Film f = FilmDAO.Search(filmID);
                lblTitle.Text = f.Title;

                Calendar1.SelectedDate = DateTime.Now;
                
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            DataTable dtSlot = ShowDAO.GetAllData(int.Parse(Request.QueryString[0]), Calendar1.SelectedDate);
            if (dtSlot.Rows.Count > 0)
            {
                DropDownList1.DataSource = dtSlot;
                DropDownList1.DataTextField = "Room_Slot";
                DropDownList1.DataValueField = "ShowID";
                DropDownList1.DataBind();
                lbSlot.Visible = false;
            }
            else
            {
                DropDownList1.Items.Clear();
                lbSlot.Text = "No Show Available.";
                lbSlot.Visible = true;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilmGUI.aspx");
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            if (DropDownList1.Items.Count > 0)
            {
                Response.Redirect("BookSeatGUI.aspx?showid=" + DropDownList1.SelectedValue);
            }
        }
    }
}