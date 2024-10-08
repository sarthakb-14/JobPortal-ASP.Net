using System;
using System.Data;
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
                string cid = Session["UserID"]?.ToString();
                if (!string.IsNullOrEmpty(cid))
                {
                    LoadJobs(cid); // Pass the cid to load jobs for that specific category
                }
                else
                {
                    // Handle case when cid is not provided, like showing an error or a message
                    Response.Write($"Error: cid not provided");
                }
            }
        }

        private void LoadJobs(string cid)
        {
            string connectionString = "uid=sa; password=manager@123; database=JobPortal; server=C927QV3\\SQLEXPRESS";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string jobQuery = "SELECT * FROM joblist WHERE cid = @cid"; // Filter by cid from query string
                SqlCommand jobCommand = new SqlCommand(jobQuery, con);
                jobCommand.Parameters.AddWithValue("@cid", cid); // Pass the cid parameter to SQL query
                SqlDataAdapter adapter = new SqlDataAdapter(jobCommand);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                jobRepeater.DataSource = dt;
                jobRepeater.DataBind();
            }
        }

        protected void btnUpdate_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Update")
            {
                try
                {
                    // Get the repeater item that contains the button clicked
                    RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;

                    int jobId = Convert.ToInt32(e.CommandArgument);
                    string jobTitle = (item.FindControl("txtJobTitle") as TextBox).Text;
                    string jobJD = (item.FindControl("txtJobJD") as TextBox).Text;
                    string jobSalary = (item.FindControl("txtJobSalary") as TextBox).Text;
                    string jobVacancy = (item.FindControl("txtJobVacancy") as TextBox).Text;
                    string jobStatus = (item.FindControl("ddlJobStatus") as DropDownList).SelectedValue;
                    string jobExperience = (item.FindControl("txtJobExperience") as TextBox).Text;

                    string connectionString = "uid=sa; password=manager@123; database=JobPortal; server=C927QV3\\SQLEXPRESS";

                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        con.Open();
                        string updateQuery = "UPDATE joblist SET jobtitle = @jobTitle, jobJD = @jobJD, jobsalary = @jobSalary, " +
                                             "jobvacancy = @jobVacancy, jobemployeementstatus = @jobStatus, jobexperience = @jobExperience " +
                                             "WHERE jobId = @jobId";
                        SqlCommand updateCommand = new SqlCommand(updateQuery, con);
                        updateCommand.Parameters.AddWithValue("@jobTitle", jobTitle);
                        updateCommand.Parameters.AddWithValue("@jobJD", jobJD);
                        updateCommand.Parameters.AddWithValue("@jobSalary", jobSalary);
                        updateCommand.Parameters.AddWithValue("@jobVacancy", jobVacancy);
                        updateCommand.Parameters.AddWithValue("@jobStatus", jobStatus);
                        updateCommand.Parameters.AddWithValue("@jobExperience", jobExperience);
                        updateCommand.Parameters.AddWithValue("@jobId", jobId);

                        int rowsAffected = updateCommand.ExecuteNonQuery();

                        // Optional: Display a message showing whether the update was successful
                        Response.Write($"Rows updated: {rowsAffected}<br/>");
                    }

                    // Reload jobs after update
                    string cid = Session["UserID"].ToString();
                    if (!string.IsNullOrEmpty(cid))
                    {
                        LoadJobs(cid); // Reload jobs for the same cid after update
                    }
                }
                catch (Exception ex)
                {
                    // Log the error to see if there's any issue
                    Response.Write($"Error: {ex.Message}");
                }
            }
        }
    }
}
