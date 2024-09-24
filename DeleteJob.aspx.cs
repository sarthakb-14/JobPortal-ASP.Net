using System;
using System.Data;
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
                    LoadJobs(cid); // Pass the cid to load jobs for that specific category
                }
                else
                {
                    // Handle case when cid is not provided, like showing an error or a message
                }
            }
        }

        private void LoadJobs(string cid)
        {
            string connectionString = "uid=sa; password=manager@123; database=JobPortal; server=DK27QV3\\SQLEXPRESS";

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

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {
            //int jobId = Convert.ToInt32(e.CommandArgument);
            //Response.Write($"{jobId}<br/>");
            if (e.CommandName == "Delete")
            {
                try
                {
                    int jobId = Convert.ToInt32(e.CommandArgument);

                    // Add a debug statement or label to display jobId for verification
                    Response.Write($"Deleting jobId: {jobId}<br/>");

                    string connectionString = "uid=sa; password=manager@123; database=JobPortal; server=DK27QV3\\SQLEXPRESS";

                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        con.Open();
                        string deleteQuery = "DELETE FROM joblist WHERE jobId = @jobId";
                        SqlCommand deleteCommand = new SqlCommand(deleteQuery, con);
                        deleteCommand.Parameters.AddWithValue("@jobId", jobId);

                        int rowsAffected = deleteCommand.ExecuteNonQuery();

                        // Debug how many rows were affected (should be 1 if successful)
                        Response.Write($"Rows deleted: {rowsAffected}<br/>");
                    }

                    // Reload jobs after deletion
                    string cid = Request.QueryString["cid"];
                    if (!string.IsNullOrEmpty(cid))
                    {
                        LoadJobs(cid); // Reload jobs for the same cid after deletion
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

