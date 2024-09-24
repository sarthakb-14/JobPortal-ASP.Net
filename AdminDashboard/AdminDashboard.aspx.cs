using System;
using System.Data.SqlClient;

namespace JobPortal
{
	public partial class AdminDashboard : System.Web.UI.Page
    {
        private string connectionString = "uid=sa; password=manager@123; database=JobPortal; server=7Y27QV3\\SQLEXPRESS";

        protected void Page_Load(object sender, EventArgs e)
        {
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
    }
}