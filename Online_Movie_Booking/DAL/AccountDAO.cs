using Lab3_Template.DAL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Lab4_template.DAL
{
    public class AccountDAO
    {

        public static bool InsertAcc(string username, string password)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [Account] ([Username],[Password],[Type])" +
                "VALUES(@Username, @Password, 0)");
            cmd.Parameters.AddWithValue("@Username", username);
            cmd.Parameters.AddWithValue("@Password", password);
            return DAO.UpdateTable(cmd);

        }

    }
}