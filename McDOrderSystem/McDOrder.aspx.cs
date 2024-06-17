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
    public partial class McDOrder : System.Web.UI.Page
    {
        static double totalAmount;

        protected void Page_Load(object sender, EventArgs e)
        {

            //pervent those without the proper credentials to access a particular page
            if (Session["Role"] == null)
                Response.Redirect("Login.aspx");

            if (!IsPostBack)
            {

                GenerateSalesId();
            }

        }




        void GenerateSalesId()
        {
            string hexTicks = DateTime.Now.Ticks.ToString("X");
            lblSalesId.Text = hexTicks.Substring(hexTicks.Length - 15, 9);
            lblDateTime.Text = DateTime.Now.ToString();
        }

        protected void GridViewItems_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblItemId.Text = GridViewItems.SelectedRow.Cells[1].Text;
            lblItemTitle.Text = GridViewItems.SelectedRow.Cells[2].Text;
            lblItemPrice.Text = GridViewItems.SelectedRow.Cells[3].Text;
        }

        void SalesAddItem()
        {
            // Create connection
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connMcD"].ConnectionString);

            // Create command object with Stored Procedure name
            SqlCommand cmd = new SqlCommand("spSalesAddItem", conn);

            //Set command object for stored procedure execution
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@salesid", lblSalesId.Text);
            cmd.Parameters.AddWithValue("@itemid", lblItemId.Text);
            cmd.Parameters.AddWithValue("@quantity", txtQuantity.Text);

            try
            {
                // Open connection
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                lblMessage1.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }

            txtQuantity.Text = "1";
        }

        void SalesGetTotalAmount()
        {
            // Create connection
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connMcD"].ConnectionString);

            // Create command object with Stored Procedure name
            SqlCommand cmd = new SqlCommand("spSalesGetTotalAmount", conn);

            // Set command object for stored procedure execution
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@salesid", lblSalesId.Text);

            try
            {
                // Open connection
                conn.Open();
                totalAmount = (double)cmd.ExecuteScalar();
                lblTotalAmountCart.Text = totalAmount.ToString("c2");
            }
            catch (SqlException ex)
            {
                lblMessage2.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }


        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            SalesAddItem();
            GridViewCart.DataBind();
            SalesGetTotalAmount();
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewItems.PageIndex = 0;
        }

        void SalesConfirm()
        {
            // Create connection
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connMcD"].ConnectionString);

            // Create command object with Stored Procedure name
            SqlCommand cmd = new SqlCommand("spSalesConfirm", conn);

            // Set command object for stored procedure execution
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@salesid", lblSalesId.Text);

            try
            {
                // Open connection
                conn.Open();
                cmd.ExecuteNonQuery();
                lblMessage2.Text = "Sales confirmed!";
            }
            catch (SqlException ex)
            {
                lblMessage2.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }

            txtQuantity.Text = "1";

        }

        /*void DisplayInvoice()
        {
            double serviceTax, amountAfterTax, amountRounded, rounding;
            serviceTax = totalAmount * 0.06;
            amountAfterTax = totalAmount + serviceTax;
            amountRounded = Math.Round((amountAfterTax) / 0.05) * 0.05;
            rounding = amountRounded - amountAfterTax;

            lblTotalAmount.Text = "Total amount: " + totalAmount.ToString("c2");
            lblServiceTax.Text = "Service tax (6%): " + serviceTax.ToString("c2");
            lblAmountAfterTax.Text = "Amount after tax: " + amountAfterTax.ToString("c2");
            lblRounding.Text = "Rounding: " + rounding.ToString("c2");
            lblAmountRounded.Text = "Amount to pay: " + amountRounded.ToString("c2");
        }*/

        void DisplayInvoice()
        {
            // Calculate tax and rounding
            double serviceTax, amountAfterTax, amountRounded, rounding;
            serviceTax = totalAmount * 0.06;
            amountAfterTax = totalAmount + serviceTax;
            amountRounded = Math.Round((amountAfterTax) / 0.05) * 0.05;
            rounding = amountRounded - amountAfterTax;

            // Display calculated amounts
            lblTotalAmount.Text = "Total amount: " + totalAmount.ToString("c2");
            lblServiceTax.Text = "Service tax (6%): " + serviceTax.ToString("c2");
            lblAmountAfterTax.Text = "Amount after tax: " + amountAfterTax.ToString("c2");
            lblRounding.Text = "Rounding: " + rounding.ToString("c2");
            lblAmountRounded.Text = "Amount to pay: " + amountRounded.ToString("c2");

            // Fetch and display item details in receipt
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connMcD"].ConnectionString);
            SqlCommand cmd = new SqlCommand("spSalesGetItems", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@salesid", lblSalesId.Text);

            try
            {
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    GridViewReceipt.DataSource = reader;
                    GridViewReceipt.DataBind();
                }
                reader.Close();
            }
            catch (SqlException ex)
            {
                lblMessage2.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }


        void ClearAll()
        {
            lblItemId.Text = "";
            lblItemTitle.Text = "";
            lblItemPrice.Text = "";
            lblTotalAmountCart.Text = "RM0.00";
            lblTotalAmount.Text = "";
            lblServiceTax.Text = "";
            lblAmountAfterTax.Text = "";
            lblRounding.Text = "";
            lblAmountRounded.Text = "";
            lblMessage1.Text = "";
            lblMessage2.Text = "";
        }

        void SalesRemoveNotComfirmed()
        {
            // Create connection
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connMcD"].ConnectionString);

            // Create command object with Stored Procedure name
            SqlCommand cmd = new SqlCommand("spSalesRemoveNotConfirmed", conn);

            // Set command object for stored procedure execution
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@salesid", lblSalesId.Text);

            try
            {
                // Open connection
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                lblMessage2.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }

        protected void btnComfirm_Click(object sender, EventArgs e)
        {
            SalesConfirm();
            lblReceiptSalesId.Text = lblSalesId.Text;
            lblReceiptDateTime.Text = lblDateTime.Text;
            DisplayInvoice();
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            ClearAll();
            GenerateSalesId();
            ddlCategory.DataBind();
            GridViewItems.PageIndex = 0;
            GridViewItems.DataBind();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            SalesRemoveNotComfirmed();
            ClearAll();
            GenerateSalesId();
            ddlCategory.DataBind();
            GridViewItems.PageIndex = 0;
            GridViewItems.DataBind();

        }

    }
}