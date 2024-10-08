using System;
using System.Data.SqlClient;
using System.Web;

namespace JobPortal
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        private string connectionString = "uid=sa; password=manager@123; database=JobPortal; server=DK27QV3\\SQLEXPRESS";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Retrieve aid and aname from the session
            string adminId = Session["UserID"] as string;
            string adminName = Session["UserName"] as string;

            if (string.IsNullOrEmpty(adminId) || string.IsNullOrEmpty(adminName))
            {
                // Redirect to JobPortalLogin if session variables are missing
                Response.Redirect("../JobPortalLogin.aspx");
            }
            else
            {
                // Set the admin name in the label for profile display
                lblAdminName.Text = adminName;
            }

            if (!IsPostBack)
            {
                LoadStatistics();
            }
        }

        private void LoadStatistics()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    // Fetch number of companies
                    using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM company", conn))
                    {
                        int companyCount = (int)cmd.ExecuteScalar();
                        lblCompanies.Text = companyCount.ToString();
                    }

                    // Fetch number of applicants
                    using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM student", conn))
                    {
                        int studentCount = (int)cmd.ExecuteScalar();
                        lblApplicants.Text = studentCount.ToString();
                    }

                    // Fetch number of job postings
                    using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM joblist", conn))
                    {
                        int jobCount = (int)cmd.ExecuteScalar();
                        lblJobsPosted.Text = jobCount.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions (optional)
                Console.WriteLine(ex.Message);
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
