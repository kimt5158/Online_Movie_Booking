using Lab3_Template.DAL;
using Lab4_template.DAL;
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
    public partial class ShowManageGUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sql = "Select * from films";
                SqlCommand cmd = new SqlCommand(sql);
                DataTable dt = DAO.GetDataTable(cmd);
                ddlFilm.DataSource = dt;
                ddlFilm.DataTextField = "Title";
                ddlFilm.DataValueField = "FilmID";
                ddlFilm.DataBind();


                string showid = Request.QueryString["showid"];
                if (showid != null)
                {
                    sql = "select s.*, SlotName +'_' + [Name] as [Slot_Room], STR(s.[SlotID]) + '_' + STR(s.[RoomID]) as [ID] " +
                        "from shows s, Slot , Rooms r " +
                        "where s.SlotID = Slot.SlotID and s.RoomID = r.RoomID and s.ShowID = @showid";
                    cmd = new SqlCommand(sql);
                    cmd.Parameters.AddWithValue("@showid", showid);
                    dt = DAO.GetDataTable(cmd);
                    if(dt.Rows.Count > 0)
                    {
                        DataRow dr = dt.Rows[0];
                        txtPrice.Text = dr["Price"].ToString();
                        ddlFilm.SelectedValue = dr["FilmID"].ToString();
                        Calendar1.SelectedDate = (DateTime)dr["ShowDate"];
                        getAvaiSlot();
                        DataTable dt1 = (DataTable)ddlSlot.DataSource;
                        dt1.Rows.Add(dr["Slot_Room"].ToString(), dr["ID"].ToString());
                        ddlSlot.DataSource = dt1;
                        ddlSlot.DataTextField = "Slot_Room";
                        ddlSlot.DataValueField = "ID";
                        ddlSlot.DataBind();
                        ddlSlot.SelectedValue = dr["ID"].ToString();
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string showid = Request.QueryString["showid"];
            if(showid != null)
            {
                DateTime date = Calendar1.SelectedDate.Date;
                string sql = "Update [Shows] " +
                    "SET[RoomID] = @roomid, [FilmID] = @filmid, [ShowDate] = @date, [Price] = @price, [SlotID] = @slotid " +
                    "Where ShowID = @showid ";
                SqlCommand cmd = new SqlCommand(sql);
                string[] id = ddlSlot.SelectedValue.Split('_');
                cmd.Parameters.AddWithValue("@date", date);
                cmd.Parameters.AddWithValue("@roomid", id[1]);
                cmd.Parameters.AddWithValue("@filmid", ddlFilm.SelectedValue);
                cmd.Parameters.AddWithValue("@slotid", id[0]);
                cmd.Parameters.AddWithValue("@price", txtPrice.Text);
                cmd.Parameters.AddWithValue("@showid", showid);
                DAO.UpdateTable(cmd);
                //Chuyen den trang thong bao
                Response.Redirect("NotifiGUI.aspx?ac=4");
            }
            else
            {
                DateTime date = Calendar1.SelectedDate.Date;
                string sql = "Insert into [Shows]([RoomID], [FilmID], [ShowDate], [Price], [SlotID], [RoomStatus]) " +
                    "VALUES(@roomid, @filmid, @date, @price, @slotid, @roomStatus)";
                SqlCommand cmd = new SqlCommand(sql);
                string[] id = ddlSlot.SelectedValue.Split('_');
                cmd.Parameters.AddWithValue("@roomStatus", RoomDAO.GetRoomByRoomID2(int.Parse(id[1])));
                cmd.Parameters.AddWithValue("@date", date);
                cmd.Parameters.AddWithValue("@roomid", id[1]);
                cmd.Parameters.AddWithValue("@filmid", ddlFilm.SelectedValue);
                cmd.Parameters.AddWithValue("@slotid", id[0]);
                cmd.Parameters.AddWithValue("@price", txtPrice.Text);
                DAO.UpdateTable(cmd);
                //chuyen den trang thong bao
                Response.Redirect("NotifiGUI.aspx?ac=5");
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            getAvaiSlot();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShowGUI.aspx");
        }

        protected void getAvaiSlot()
        {
            DateTime date = Calendar1.SelectedDate.Date;
            string sql = "with r as (" +
            "select SlotID, SlotName, RoomID, Name " +
            "from Slot, Rooms )" +
            " select r.[SlotName] +'_' + r.[Name] as[Slot_Room], STR(r.[SlotID]) + '_' + STR(r.[RoomID]) as [ID] " +
            " from(select * from Shows where ShowDate = @date) as s right join r on  s.SlotID = r.SlotID and s.RoomID = r.RoomID " +
            " where s.ShowID is null";

            SqlCommand cmd = new SqlCommand(sql);
            cmd.Parameters.AddWithValue("@date", date);
            DataTable dt = DAO.GetDataTable(cmd);
            ddlSlot.DataSource = dt;
            ddlSlot.DataTextField = "Slot_Room";
            ddlSlot.DataValueField = "ID";
            ddlSlot.DataBind();
        }
    }
}