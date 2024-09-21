using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobPortal
{
    public partial class DeleteJob : System.Web.UI.Page
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
                string jobQuery = "SELECT * FROM joblist WHERE cid = @cid";
                SqlCommand jobCommand = new SqlCommand(jobQuery, con);
                jobCommand.Parameters.AddWithValue("@cid", cid);
                SqlDataReader reader = jobCommand.ExecuteReader();

                while (reader.Read())
                {
                    string jobId = reader["jobid"].ToString();
                    string jobTitle = reader["jobtitle"].ToString();
                    string jobDescription = reader["jobJD"].ToString();
                    string jobSalary = reader["jobsalary"].ToString();
                    string jobVacancy = reader["jobvacancy"].ToString();
                    string jobEmploymentStatus = reader["jobemployeementstatus"].ToString();
                    string jobExperience = reader["jobexperience"].ToString();

                    // Create a div for each job listing with delete button
                    string jobDiv = $@"
                        <div class='col-md-4 mb-4'>
                            <div class='card'>
                                <div class='card-header'>
                                    <h5 class='card-title'>{jobTitle}</h5>
                                </div>
                                <div class='card-body'>
                                    <p class='card-text'><strong>Job Description:</strong> {jobDescription}</p>
                                    <p class='card-text'><strong>Salary:</strong> {jobSalary}</p>
                                    <p class='card-text'><strong>Vacancy:</strong> {jobVacancy}</p>
                                    <p class='card-text'><strong>Employment Status:</strong> {jobEmploymentStatus}</p>
                                    <p class='card-text'><strong>Experience:</strong> {jobExperience}</p>
                                    <asp:Button ID='DeleteButton{jobId}' runat='server' Text='Delete' CssClass='btn btn-danger' OnClick='DeleteJob_Click' CommandArgument='{jobId}' />
                                </div>
                            </div>
                        </div>";

                    // Add the job div to the page
                    jobList.Text += jobDiv;
                }
            }
        }

        protected void DeleteJob_Click(object sender, EventArgs e)
        {
            Button deleteButton = (Button)sender;
            string jobId = deleteButton.CommandArgument;

            // Delete job from the database
            string connectionString = "uid=sa; password=manager@123; database=JobPortal; server=DK27QV3\\SQLEXPRESS";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string deleteQuery = "DELETE FROM joblist WHERE jobid = @jobId";
                SqlCommand deleteCommand = new SqlCommand(deleteQuery, con);
                deleteCommand.Parameters.AddWithValue("@jobId", jobId);

                int rowsAffected = deleteCommand.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    Response.Write("<script>alert('Job deleted successfully!'); window.location.reload();</script>");
                }
                else
                {
                    Response.Write("<script>alert('Delete failed. Please try again.');</script>");
                }
            }
        }
    }
}
