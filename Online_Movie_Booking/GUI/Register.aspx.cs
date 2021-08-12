using Lab3_Template.DAL;
using Lab4_template.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE1438_Group2_Project.GUI
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtUserName.Text.Trim();
            string password = txtPass.Text.Trim();
            string repass = txtRePass.Text.Trim();
            if (Chreck(username) && Chreck(password))
            {
                string sql = "select * from account where username=@user";
                SqlCommand cmd = new SqlCommand(sql);
                cmd.Parameters.AddWithValue("@user", username);
                DataTable dt = DAO.GetDataTable(cmd);
                if (dt.Rows.Count > 0)
                {
                    lbError.Text = "Username already taken! Please try again";
                    lbError.Visible = true;
                }
                else
                {
                    if (password.Equals(repass))
                    {
                        if (AccountDAO.InsertAcc(username, password))
                        {
                            Response.Redirect("LoginGUI.aspx?ac=1");
                        }
                    }
                    else
                    {
                        lbError.Text = "Password does not match! Try again!";
                        lbError.Visible = true;
                    }
                }
            }
            else
            {
                lbError.Text = "NO SPECIAL CHARACTERS OR SPACE PLEASE!";
                lbError.Visible = true;
            }
        }

        protected bool Chreck(string text)
        {
            Regex rgx = new Regex("^[a-zA-Z0-9]*$");
            if (rgx.IsMatch(text))
            {  
                return true;
            }
            return false;
        }
    }
}