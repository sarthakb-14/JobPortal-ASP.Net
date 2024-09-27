using System;
using System.ComponentModel.Design;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace JobPortal
{
    public partial class ManageCompanies : System.Web.UI.Page
    {
        private string connectionString = "uid=sa; password=manager@123; database=JobPortal; server=C927QV3\\SQLEXPRESS";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Retrieve admin ID and name from the session instead of query string
            string adminId = Session["UserID"] as string;
            string adminName = Session["UserName"] as string;

            // Redirect to JobPortalLogin if session variables are missing
            if (string.IsNullOrEmpty(adminId) || string.IsNullOrEmpty(adminName))
            {
                Response.Redirect(ResolveUrl("~/JobPortalLogin.aspx"));
            }
            else
            {
                // Display admin name in the label for profile display
                lblAdminName.Text = adminName;
            }

            if (!IsPostBack)
            {
                // Initially, clear search columns dropdown
                //ddlSearchColumn.Items.Clear();
            }
        }

        private void BindGridView(string searchQuery = null)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT * FROM Company";
                if (!string.IsNullOrEmpty(searchQuery))
                {
                    query += " WHERE cname LIKE @search OR cemail LIKE @search OR cusername LIKE @search OR ccity LIKE @search OR ccontactno LIKE @search";
                }
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (!string.IsNullOrEmpty(searchQuery))
                    {
                        cmd.Parameters.AddWithValue("@search", "%" + searchQuery + "%");
                    }

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchColumn = ddlSearchColumn.SelectedValue;
            string searchValue = txtSearch.Text.Trim();
            string searchQuery = string.Empty;

            switch (searchColumn)
            {
                case "cname":
                    searchQuery = $"cname LIKE '%{searchValue}%'";
                    break;
                case "cemail":
                    searchQuery = $"cemail LIKE '%{searchValue}%'";
                    break;
                case "cusername":
                    searchQuery = $"cusername LIKE '%{searchValue}%'";
                    break;
                case "ccity":
                    searchQuery = $"ccity LIKE '%{searchValue}%'";
                    break;
                case "ccontactno":
                    searchQuery = $"ccontactno LIKE '%{searchValue}%'";
                    break;
            }

            BindGridView(searchValue);
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGridView();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int companyId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            DeleteCompany(companyId);
            BindGridView();
        }

        private void DeleteCompany(int companyId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("DELETE FROM Company WHERE cid = @cid", conn))
                {
                    cmd.Parameters.AddWithValue("@cid", companyId);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            // Clear the session to log the user out
            Session.Clear();
            Session.Abandon(); // End the session

            // Redirect to the LandingPage after logout
            Response.Redirect("~/LandingPage.aspx");
        }
    }
}
