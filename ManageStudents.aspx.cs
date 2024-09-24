using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobPortal
{
    public partial class ManageStudents : System.Web.UI.Page
    {
        private string connectionString = "uid=sa; password=manager@123; database=JobPortal; server=C927QV3\\SQLEXPRESS";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if aid and aname are available in the query string
                string adminId = Request.QueryString["aid"];
                string adminName = Request.QueryString["aname"];

                if (string.IsNullOrEmpty(adminId) || string.IsNullOrEmpty(adminName))
                {
                    // Redirect to JobPortalLogin if query string parameters are missing
                    Response.Redirect(ResolveUrl("~/JobPortalLogin.aspx"));

                }
                else
                {
                    // Set the admin name in the label for profile display
                    lblAdminName.Text = adminName;
                }

                if (!IsPostBack)
                {
                    LoadStudents();
                }
            }
        }

        private void LoadStudents(string searchQuery = "", string searchColumn = "")
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string query = "SELECT * FROM student";
                if (!string.IsNullOrEmpty(searchQuery) && !string.IsNullOrEmpty(searchColumn))
                {
                    query += $" WHERE {searchColumn} LIKE '%' + @SearchQuery + '%'";
                }

                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                if (!string.IsNullOrEmpty(searchQuery) && !string.IsNullOrEmpty(searchColumn))
                {
                    adapter.SelectCommand.Parameters.AddWithValue("@SearchQuery", searchQuery);
                }

                DataTable dt = new DataTable();
                adapter.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchQuery = txtSearch.Text.Trim();
            string searchColumn = ddlSearchColumn.SelectedValue;

            LoadStudents(searchQuery, searchColumn);
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadStudents(); // Reload the grid to reflect the correct page
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int studentId = Convert.ToInt32(e.CommandArgument);
                DeleteStudent(studentId);
                LoadStudents(); // Reload the grid
            }
        }

        private void DeleteStudent(int studentId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand($"DELETE FROM student WHERE studentId = @StudentId", conn);
                cmd.Parameters.AddWithValue("@StudentId", studentId);
                cmd.ExecuteNonQuery();
            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            // Clear session and redirect to login page
            Session.Clear();
            Response.Redirect("LandingPage.aspx");
        }
    }
}
