using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobPortal
{
    public partial class ViewJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ViewJobButton_Click(object sender, EventArgs e)
        {
            string jobId = JobIDInput.Text;

            // Simple validation: Check if the Job ID is not empty
            if (!string.IsNullOrEmpty(jobId))
            {
                // If the Job ID is valid, trigger JavaScript to show the job details container
                string script = @"
                    <script type='text/javascript'>
                        document.getElementById('job-details-container').style.display = 'block';
                    </script>";

                // Register the script on the page to run after the button click event
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showJobDetails", script, false);
            }
            else
            {
                // Optionally, display an error message if Job ID is missing (can be implemented with a label)
                string errorMessageScript = @"
                    <script type='text/javascript'>
                        alert('Please enter a valid Job ID.');
                    </script>";

                ScriptManager.RegisterStartupScript(this, this.GetType(), "error", errorMessageScript, false);
            }




            int jobid = int.Parse(JobIDInput.Text);
            string sarthak = "uid=sa; password=manager@123; database = JobPortal; server = DK27QV3\\SQLEXPRESS";
            SqlConnection con = new SqlConnection(sarthak);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from joblist where jobid = " + jobid + "", con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                JobTitleTextBox.Text = dr["jobtitle"].ToString();
                CompanyIDTextBox.Text = dr["cid"].ToString();
                ExperienceTextBox.Text = dr["jobexperience"].ToString();
                SalaryTextBox.Text = dr["jobsalary"].ToString();
                // Convert jobdeadline to DateTime and extract only the Date, then format it as yyyy-MM-dd
                if (dr["jobdeadline"] != DBNull.Value)
                {
                    DateTime jobDeadline = Convert.ToDateTime(dr["jobdeadline"]).Date;
                    DeadlineTextBox.Text = jobDeadline.ToString("yyyy-MM-dd");
                }

                // Convert jobpublishdate to DateTime and extract only the Date, then format it as yyyy-MM-dd
                if (dr["jobpublishdate"] != DBNull.Value)
                {
                    DateTime jobPublishDate = Convert.ToDateTime(dr["jobpublishdate"]).Date;
                    PublishDateTextBox.Text = jobPublishDate.ToString("yyyy-MM-dd");
                }

                VacancyTextBox.Text = dr["jobvacancy"].ToString();
                EmploymentStatusDropDown.SelectedValue = dr["jobemployeementstatus"].ToString();
                JobDescriptionTextBox.Text = dr["jobJD"].ToString();
            }
            con.Close();
        }
    }
}