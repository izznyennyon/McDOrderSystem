using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace McDOrderSystem
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "admin")
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                BindSummary();
                BindDetails();
            }
        }

        private void BindSummary()
        {
            string query = @"
                SELECT 
                    SUM(s.Quantity * i.ItemPrice) AS TotalRevenue, 
                    COUNT(DISTINCT s.SalesId) AS TotalSales, 
                    SUM(s.Quantity) AS TotalItemsSold
                FROM Sales s
                JOIN Items i ON s.ItemId = i.ItemId
                WHERE s.Confirmed = 1";

            DataTable dt = GetData(query);
            gvSummary.DataSource = dt;
            gvSummary.DataBind();
        }

        private void BindDetails()
        {
            string query = @"
                SELECT 
                    s.SalesId, 
                    i.ItemTitle, 
                    s.Quantity, 
                    s.SalesDate, 
                    i.ItemPrice
                FROM Sales s
                JOIN Items i ON s.ItemId = i.ItemId
                WHERE s.Confirmed = 1
                ORDER BY s.SalesDate DESC";

            DataTable dt = GetData(query);
            gvDetails.DataSource = dt;
            gvDetails.DataBind();
        }

        private DataTable GetData(string query)
        {
            string constr = ConfigurationManager.ConnectionStrings["connMcD"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }

    }
}