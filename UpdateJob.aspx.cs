using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobPortal
{
    public partial class UpdateJob : System.Web.UI.Page
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

                    // Create a div for each job listing with editable fields
                    // Create a div for each job listing with editable fields
                    // Create a div for each job listing with editable fields
                    string jobDiv = $@"
                        <div class='col-md-4 mb-4'>
                            <div class='card'>
                                <div class='card-header'>
                                    <h5 class='card-title'>{jobTitle}</h5>
                                </div>
                                <div class='card-body'>
                                    <p class='card-text'><strong>Job Description:</strong></p>
                                    <textarea class='form-control' rows='3' id='desc{jobId}'>{jobDescription}</textarea>
                                    <p class='card-text'><strong>Salary:</strong></p>
                                    <input type='text' class='form-control' value='{jobSalary}' id='salary{jobId}' />
                                    <p class='card-text'><strong>Vacancy:</strong></p>
                                    <input type='text' class='form-control' value='{jobVacancy}' id='vacancy{jobId}' />
                                    <p class='card-text'><strong>Employment Status:</strong></p>
                                    <select class='form-control' id='employment{jobId}'>
                                        <option value='Full-Time' {(jobEmploymentStatus == "Full-Time" ? "selected" : "")}>Full-Time</option>
                                        <option value='Part-Time' {(jobEmploymentStatus == "Part-Time" ? "selected" : "")}>Part-Time</option>
                                        <option value='Contract' {(jobEmploymentStatus == "Contract" ? "selected" : "")}>Contract</option>
                                        <option value='Internship' {(jobEmploymentStatus == "Internship" ? "selected" : "")}>Internship</option>
                                    </select>
                                    <p class='card-text'><strong>Experience:</strong></p>
                                    <input type='text' class='form-control' value='{jobExperience}' id='experience{jobId}' />
                                    <div class='text-center mt-3'> <!-- Centering the button -->
                                        <asp:Button ID='UpdateButton{jobId}' runat='server' Text='Update' CssClass='btn btn-primary' OnClick='UpdateJob_Click' CommandArgument='{jobId}' />
                                    </div>
                                </div>
                            </div>
                        </div>";



                    // Add the job div to the page
                    jobList.Text += jobDiv;
                }
            }
        }

        protected void UpdateJob_Click(object sender, EventArgs e)
        {
            Button updateButton = (Button)sender;
            string jobId = updateButton.CommandArgument;

            // Retrieve updated values from textboxes
            string jobDescription = Request.Form["desc" + jobId];
            string jobSalary = Request.Form["salary" + jobId];
            string jobVacancy = Request.Form["vacancy" + jobId];
            string jobEmploymentStatus = Request.Form["employment" + jobId];
            string jobExperience = Request.Form["experience" + jobId];

            // Update job in the database
            string connectionString = "uid=sa; password=manager@123; database=JobPortal; server=DK27QV3\\SQLEXPRESS";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string updateQuery = "UPDATE joblist SET jobJD = @jobDescription, jobsalary = @jobSalary, jobvacancy = @jobVacancy, jobemployeementstatus = @jobEmploymentStatus, jobexperience = @jobExperience WHERE jobid = @jobId";
                SqlCommand updateCommand = new SqlCommand(updateQuery, con);
                updateCommand.Parameters.AddWithValue("@jobDescription", jobDescription);
                updateCommand.Parameters.AddWithValue("@jobSalary", jobSalary);
                updateCommand.Parameters.AddWithValue("@jobVacancy", jobVacancy);
                updateCommand.Parameters.AddWithValue("@jobEmploymentStatus", jobEmploymentStatus);
                updateCommand.Parameters.AddWithValue("@jobExperience", jobExperience);
                updateCommand.Parameters.AddWithValue("@jobId", jobId);

                int rowsAffected = updateCommand.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    Response.Write("<script>alert('Job updated successfully!');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Update failed. Please try again.');</script>");
                }
            }
        }
    }
}
