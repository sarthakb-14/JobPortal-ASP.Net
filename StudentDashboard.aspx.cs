using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobPortal
{
    public partial class StudentDashboard : System.Web.UI.Page
    {
        private string connectionString = "uid=sa; password=manager@123; database=JobPortal; server=GF27QV3\\SQLEXPRESS";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAppliedJobs();
            }
        }

        private void LoadAppliedJobs()
        {
            // Replace with actual logic to retrieve the logged-in student's ID
            string studentId = GetCurrentStudentId(); // Implement this method to get the actual student ID

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = @"
                    SELECT aj.appliedJobId, j.jobtitle AS 'Job Title', c.cname AS 'Company Name', aj.applicationDate 
                    FROM applyjob aj 
                    JOIN joblist j ON aj.jobId = j.jobId 
                    JOIN company c ON aj.companyId = c.companyId 
                    WHERE aj.studentId = @StudentId";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@StudentId", studentId);
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        JobGridView.DataSource = dt;
                        JobGridView.DataBind();
                    }
                }
            }
        }

        protected void DeleteButton_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int appliedJobId;
                if (int.TryParse(e.CommandArgument.ToString(), out appliedJobId))
                {
                    DeleteAppliedJob(appliedJobId);
                    LoadAppliedJobs(); // Reload the grid to reflect changes
                }
            }
        }

        private void DeleteAppliedJob(int appliedJobId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "DELETE FROM applyjob WHERE appliedJobId = @AppliedJobId";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@AppliedJobId", appliedJobId);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private string GetCurrentStudentId()
        {
            // Implement logic to retrieve the logged-in student's ID
            return "currentStudentId"; // Placeholder
        }

        protected void JobGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            JobGridView.PageIndex = e.NewPageIndex;
            LoadAppliedJobs(); // Rebind data on page index change
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("JobListings.aspx");
        }

        protected void JobRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            // Handle commands for the repeater if needed
        }

        protected void SearchTextBox_TextChanged(object sender, EventArgs e)
        {
            // Implement search functionality if needed
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            // Implement save functionality if needed
        }

        protected void SaveProfileButton_Click(object sender, EventArgs e)
        {
            // Implement profile save functionality if needed
        }

        protected void ChangePasswordButton_Click(object sender, EventArgs e)
        {
            // Implement change password functionality if needed
        }

        protected void JobGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Handle the event when a job is selected if needed
        }
    }
}
