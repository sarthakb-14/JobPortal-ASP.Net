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
                // Retrieve adminId and adminName from the session
                string adminId = Session["UserID"] as string;
                string adminName = Session["UserName"] as string;

                // Redirect to JobPortalLogin if session variables are missing
                if (string.IsNullOrEmpty(adminId) || string.IsNullOrEmpty(adminName))
                {
                    Response.Redirect(ResolveUrl("~/JobPortalLogin.aspx"));
                }
                else
                {
                    // Set the admin name in the label for profile display
                    lblAdminName.Text = adminName;
                }

                // Load students on initial page load
                LoadStudents();
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

                DataSet ds = new DataSet();
                adapter.Fill(ds);

                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchColumn = ddlSearchColumn.SelectedValue;
            string searchQuery = txtSearch.Text.Trim();
            LoadStudents(searchQuery, searchColumn);
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int sid = Convert.ToInt32(e.CommandArgument);
                DeleteStudent(sid);
                LoadStudents(); // Refresh the GridView after deletion
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int sid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            DeleteStudent(sid);
            LoadStudents(); // Refresh the GridView after deletion
        }

        private void DeleteStudent(int sid)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "DELETE FROM student WHERE sid = @Sid";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Sid", sid);
                    cmd.ExecuteNonQuery();
                }
            }
        }


        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadStudents(); // Rebind the data on page index change
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
