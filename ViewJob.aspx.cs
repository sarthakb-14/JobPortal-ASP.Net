using System;
using System.Data;
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
                    // The EmptyDataTemplate will handle the case where no jobs are available
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
                SqlDataAdapter adapter = new SqlDataAdapter(jobCommand);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                // Bind the data directly to the Repeater
                jobRepeater.DataSource = dt;
                jobRepeater.DataBind();
            }
        }
    }
}
