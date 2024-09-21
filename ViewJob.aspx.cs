using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace JobPortal
{
    public partial class ViewJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string cid = Request.QueryString["cid"];
                if (!string.IsNullOrEmpty(cid))
                {
                    LoadJobs(cid);
                }
                else
                {
                    jobList.Text = "<div class='col-12'><h5>Company ID is missing.</h5></div>";
                }
            }
        }

        private void LoadJobs(string cid)
        {
            string connectionString = "uid=sa; password=manager@123; database=JobPortal; server=DK27QV3\\SQLEXPRESS";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string countQuery = "SELECT COUNT(*) FROM joblist WHERE cid = @cid";
                SqlCommand countCommand = new SqlCommand(countQuery, con);
                countCommand.Parameters.AddWithValue("@cid", cid);

                int jobCount = (int)countCommand.ExecuteScalar();

                if (jobCount > 0)
                {
                    string jobQuery = "SELECT * FROM joblist WHERE cid = @cid";
                    SqlCommand jobCommand = new SqlCommand(jobQuery, con);
                    jobCommand.Parameters.AddWithValue("@cid", cid);
                    SqlDataReader reader = jobCommand.ExecuteReader();

                    while (reader.Read())
                    {
                        string jobTitle = reader["jobtitle"].ToString();
                        string jobDescription = reader["jobJD"].ToString();
                        string jobSalary = reader["jobsalary"].ToString();
                        string jobVacancy = reader["jobvacancy"].ToString();
                        string jobEmploymentStatus = reader["jobemployeementstatus"].ToString();
                        string jobExperience = reader["jobexperience"].ToString();

                        // Create a div for each job listing
                        string jobDiv = $@"
                            <div class='col-md-4 mb-4'>
                                <div class='card'>
                                    <div class='card-header'>
                                        {jobTitle}
                                    </div>
                                    <div class='card-body'>
                                        <p class='card-text'><strong>Job Description:</strong> {jobDescription}</p>
                                        <p class='card-text'><strong>Salary:</strong> {jobSalary}</p>
                                        <p class='card-text'><strong>Vacancy:</strong> {jobVacancy}</p>
                                        <p class='card-text'><strong>Employment Status:</strong> {jobEmploymentStatus}</p>
                                        <p class='card-text'><strong>Experience:</strong> {jobExperience}</p>
                                    </div>
                                </div>
                            </div>";

                        // Add the job div to the page
                        jobList.Text += jobDiv;
                    }
                }
                else
                {
                    jobList.Text = "<div class='col-12'><h5>No jobs available.</h5></div>";
                }
            }
        }
    }
}
