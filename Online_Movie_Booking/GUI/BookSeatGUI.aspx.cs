using Lab3_Template.DAL;
using Lab4_template.DAL;
using Lab4_template.DTL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace SE1438_Group2_Project.GUI
{
    public partial class BookSeatGUI : System.Web.UI.Page
    {
        private float price = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            string showid = (string)Request.QueryString[0];
            string sql = "select * from shows s, rooms r where s.roomid = r.roomid and showid = " + showid;
            SqlCommand cmd = new SqlCommand(sql);
            DataTable dt = DAO.GetDataTable(cmd);
            DataRow dr = dt.Rows[0];
            int numberrows = int.Parse(dr["NumberRows"].ToString());
            int numbercols = int.Parse(dr["NumberCols"].ToString());
            int totalSeat = numbercols * numberrows;
            int bookedSeat = 0;
            int avaiSeat;
            string status = dr["RoomStatus"].ToString().Trim();
            price = float.Parse(dr["Price"].ToString());
            TableRow row = new TableRow();
            Table1.Rows.Clear();
            for (int i = 0; i < status.Length; i++)
            {
                TableCell cell = new TableCell();
                System.Web.UI.WebControls.CheckBox cb = new System.Web.UI.WebControls.CheckBox();
                if (status[i] == '1')
                {
                    cb.Checked = true;
                    cb.BackColor = Color.Red;
                    cb.Enabled = false;
                    bookedSeat++;
                }
                cell.Controls.Add(cb);
                row.Controls.Add(cell);
                if((i+1) % numbercols == 0)
                {
                    Table1.Controls.Add(row);
                    row = new TableRow();
                }  
            }
            avaiSeat = totalSeat - bookedSeat;
            lblBooked.Text = bookedSeat.ToString();
            lblAvai.Text = avaiSeat.ToString();
            lblPrice.Text = price.ToString();
            if(avaiSeat == 0)
            {
                lbNoi.Text = "Sorry! This show is full. Please get back and choose another show";
                btnBook.Enabled = false;
            }
            if (!IsPostBack)
            {
                ViewState["RefUrl"] = Request.UrlReferrer.ToString();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            object refUrl = ViewState["RefUrl"];
            if (refUrl != null)
                Response.Redirect((string)refUrl);
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            string showid = (string)Request.QueryString[0];
            string seatStatus = "";
            string roomStatus = "";
            float amount = 0;
            foreach (TableRow tr in Table1.Rows)
            {
                foreach (TableCell cell in tr.Cells)
                {
                    amount += 1;
                    System.Web.UI.WebControls.CheckBox cb = (System.Web.UI.WebControls.CheckBox)cell.Controls[0];
                    if (cb.Checked == true && cb.Enabled == true)
                    {
                        seatStatus += "1";
                    }
                    else
                    {
                        seatStatus += "0";
                    }

                    if (cb.Checked == true)
                    {
                        roomStatus += "1";
                    }
                    else
                    {
                        roomStatus += "0";
                    }
                }
            }

                int count = 0;
                for(int i = 0; i< seatStatus.Length; i++)
                {
                    if (seatStatus[i] == '1')
                    {
                        count++;
                    }
                }
            if(count == 0)
            {
                lbNoi.Text = "Please choose a seat!";
            }
            else
            {
                string msg = "Confirm booking " + count + " seat(s) with total " + count * price + "$?";
                DialogResult dr = MessageBox.Show(msg, "Confirm", MessageBoxButtons.YesNo);
                if (dr == DialogResult.Yes)
                {
                    Booking booking = new Booking();
                    booking.Username = Session["user"].ToString();
                    booking.Amount = count * price;
                    booking.ShowID = int.Parse(showid);
                    booking.SeatStatus = seatStatus;
                    ShowDAO.UpdateShow(int.Parse(showid), roomStatus);
                    BookingDAO.Insert(booking);
                    Response.Redirect("NotifiGUI.aspx?ac=1");
                }
            }
        }
    }
}