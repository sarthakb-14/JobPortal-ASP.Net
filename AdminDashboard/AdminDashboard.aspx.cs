﻿using System;
using System.Data.SqlClient;
using System.Web;

namespace JobPortal
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        private string connectionString = "uid=sa; password=manager@123; database=JobPortal; server=C927QV3\\SQLEXPRESS";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if aid and aname are available in the query string
            string adminId = Request.QueryString["aid"];
            string adminName = Request.QueryString["aname"];

            if (string.IsNullOrEmpty(adminId) || string.IsNullOrEmpty(adminName))
            {
                // Redirect to JobPortalLogin if query string parameters are missing
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
            // Clear session and redirect to login page
            Session.Clear();
            Response.Redirect("../LandingPage.aspx");
        }
    }
}
