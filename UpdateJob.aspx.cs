using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobPortal
{
    public partial class UpdateJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
        }

        int jobid;

        protected void SubmitButton_Click(object sender, EventArgs e)
        {

            
            // Validate if JobIDTextBox has a valid number
            if (int.TryParse(JobIDTextBox.Text, out jobid))
            {
                string sarthak = "uid=sa; password=manager@123; database = JobPortal; server = DK27QV3\\SQLEXPRESS";
                SqlConnection con = new SqlConnection(sarthak);
                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM joblist WHERE jobid = @jobid", con);
                cmd.Parameters.AddWithValue("@jobid", jobid); // Use parameters to avoid SQL injection

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    // Populate fields with data from the database
                    JobTitleTextBox.Text = dr["jobtitle"].ToString();
                    ExperienceTextBox.Text = dr["jobexperience"].ToString();
                    SalaryTextBox.Text = dr["jobsalary"].ToString();

                    if (dr["jobdeadline"] != DBNull.Value)
                    {
                        DateTime jobDeadline = Convert.ToDateTime(dr["jobdeadline"]).Date;
                        DeadlineTextBox.Text = jobDeadline.ToString("yyyy-MM-dd");
                    }

                    VacancyTextBox.Text = dr["jobvacancy"].ToString();
                    EmploymentStatusDropDown.SelectedValue = dr["jobemployeementstatus"].ToString();
                    JobDescriptionTextBox.Text = dr["jobJD"].ToString();

                    // Show the update form by triggering JavaScript
                    ClientScript.RegisterStartupScript(this.GetType(), "ShowUpdateForm", "document.getElementById('updateForm').style.display = 'block';", true);
                }
                else
                {
                    // If Job ID is not found, display an alert
                    ClientScript.RegisterStartupScript(this.GetType(), "NoJobFound", "alert('No job found with the provided Job ID.');", true);
                }

                con.Close();
            }
            else
            {
                // If the input is not a valid integer
                ClientScript.RegisterStartupScript(this.GetType(), "InvalidJobID", "alert('Please enter a valid Job ID.');", true);
            }


        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            string sarthak = "uid=sa; password=manager@123; database = JobPortal; server = DK27QV3\\SQLEXPRESS";
            SqlConnection con = new SqlConnection(sarthak);
            con.Open();
            try
            {
                jobid = int.Parse(JobIDTextBox.Text);
                
                string jtitle = JobTitleTextBox.Text;
                string exp = ExperienceTextBox.Text;
                string salary = SalaryTextBox.Text;
                DateTime deadline = DateTime.Parse(DeadlineTextBox.Text).Date;
                int vacancy = int.Parse(VacancyTextBox.Text);
                string empstatus = EmploymentStatusDropDown.SelectedValue;
                string jd = JobDescriptionTextBox.Text;
                SqlCommand cmd = new SqlCommand("update joblist set jobtitle='" + jtitle + "',jobexperience='" + exp + "',jobsalary='" + salary + "',jobdeadline='" + deadline + "',jobvacancy=" + vacancy + ",jobemployeementstatus='" + empstatus + "',jobJD='" + jd + "' where jobid = " + jobid + "", con);
                cmd.ExecuteNonQuery();
            }
            catch(Exception ex) {
                Response.Write("<script>alert(" + ex.Message + ");</script>");
            }
            
            con.Close() ;
        }
    }
}