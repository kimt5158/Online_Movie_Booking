using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE1438_Group2_Project.GUI
{
    public partial class LogoutGUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int ac = int.Parse(Request.QueryString[0]);
                if(ac == 0)
                {
                    Session["user"] = "";
                    Session["role"] = -1;
                    Label1.Text = "THANK YOU FOR USING OUR WEBSITE! SEE YOU SOON :D";
                }
                else if(ac == 1)
                {
                    Label1.Text = "BOOKING SUCCESSFULLY! THANK YOU FOR USING OUR WEBSITE!:D";
                }
                else if(ac == 2)
                {
                    Label1.Text = "Movie Update successfully!";
                }
                else if(ac == 3)
                {
                    Label1.Text = "Movie Add successfully!";
                }
                else if(ac == 4)
                {
                    Label1.Text = "Show Update successfully!";
                }
                else if(ac == 5)
                {
                    Label1.Text = "Show Add successfully!";
                }
            }
        }
    }
}