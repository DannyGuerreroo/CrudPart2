using CrudPart2.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrudPart2
{
    public partial class Confirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["ConfirmationMessage"] != null) // Reads confirmation message from last page
                {
                    string msg = Session["ConfirmationMessage"].ToString();
                    ConfirmationLabel.Text = msg;
                    Session.Remove("ConfirmationMessage");
                }
                else
                {
                    ConfirmationLabel.Text = "Confirmation Error";
                }
                LoadRecentOrders();
            }
        }

        private void LoadRecentOrders()
        { // Shows the 10 most recent orders
            using (SqlConnection conn = new SqlConnection(db.getConnection()))
            {
                using (SqlCommand cmd = new SqlCommand("NewCustomerSummary_Lastname", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        RecentOrderRepeater.DataSource = dt;
                        RecentOrderRepeater.DataBind();
                    }
                    conn.Close();
                }
            }
        }
    }
}