using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrudPart2.Models;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace CrudPart2
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateProductsDropdown();
            }
        }

        private void PopulateProductsDropdown()
        { // Fills the drop-down of products
            using (SqlConnection conn = new SqlConnection(db.getConnection()))
            {
                using (SqlCommand cmd = new SqlCommand("ProductList_Lastname", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    ddlProducts.DataSource = reader;
                    ddlProducts.DataTextField = "ProductName";
                    ddlProducts.DataValueField = "Id";
                    ddlProducts.DataBind();
                    conn.Close();
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        { // on click: enters info into database and sends to confirmation screen
            string msg = "";

            using (SqlConnection conn = new SqlConnection(db.getConnection()))
            {
                using (SqlCommand cmd = new SqlCommand("InsertCustomerAndOrder_Lastname", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                    cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                    cmd.Parameters.AddWithValue("@City", txtCity.Text);
                    cmd.Parameters.AddWithValue("@Country", txtCountry.Text);
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@OrderDate", DateTime.Now);
                    cmd.Parameters.AddWithValue("@ProductId", ddlProducts.SelectedValue);
                    cmd.Parameters.AddWithValue("@Quantity", 1); // Since quantity is always one
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            msg = reader["ConfirmationMessage"].ToString();
                        }
                    }
                    conn.Close();
                }
            }
            Session["ConfirmationMessage"] = msg; // Sends confirmation message to next page
            Response.Redirect("Confirmation.aspx");
        }
    }
}