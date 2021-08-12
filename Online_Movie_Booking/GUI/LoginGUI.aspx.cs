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
    public partial class LoginGUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ac"] != null)
            {
                int ac = int.Parse(Request.QueryString["ac"]);
                if(ac == 1)
                {
                    lbText.Text = "Your account created successfully! Now you can login to our website";
                    lbText.Visible = true;
                }
                else
                {
                    lbText.Text = "You need to login to book ticket. If you don't have accout, create one then!";
                    lbText.Visible = true;
                }
            }
                
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            string sql = "select * from account where username=@user and password=@pass ";
            SqlCommand cmd = new SqlCommand(sql);
            cmd.Parameters.AddWithValue("@user", txtUser.Text);
            cmd.Parameters.AddWithValue("@pass", txtPass.Text);
            DataTable dt = DAO.GetDataTable(cmd);
            if(dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                Session["user"] = dr["Username"].ToString();
                Session["role"] = dr["Type"];
                Response.Redirect("FilmGUI.aspx");
            }
            else
            {
                lbError.Text = "Wrong username or password! Please enter again";
                lbError.Visible = true;
            }
        }
    }
}