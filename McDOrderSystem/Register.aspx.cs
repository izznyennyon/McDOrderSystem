using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace McDOrderSystem
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtUserName.Text;
            string password = txtPassword.Text;

            if (string.IsNullOrEmpty(username))
            {
                lblMessage.Text = "Username cannot be empty.";
                return;
            }

            if (string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Password cannot be empty.";
                return;
            }

            PBKDF2Hash hash = new PBKDF2Hash(password);
            string passwordHash = hash.HashedPassword;
            bool enabled = true;

            SqlConnection conn = new SqlConnection(ConfigurationManager.
                ConnectionStrings["connMcd"].ConnectionString);
            string sql = @"INSERT INTO UserAccounts (Username, PasswordHash, Role, Enabled) VALUES (@username, @passwordHash, @role, @enabled)";

            SqlCommand cmd = new SqlCommand(sql, conn);

            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@passwordHash", passwordHash);
            cmd.Parameters.AddWithValue("@role", "user");
            cmd.Parameters.AddWithValue("@enabled", enabled);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                lblMessage.Text = "Registration successful";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }
    }
}
