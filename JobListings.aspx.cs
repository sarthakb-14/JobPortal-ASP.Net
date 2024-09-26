using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace JobPortal
{
	public partial class JobListings : System.Web.UI.Page
	{
		private readonly string connStr = "uid=sa; password=manager@123; database=JobPortal; server=7Y27QV3\\SQLEXPRESS";
		string sname, sid;

		protected void Page_Load(object sender, EventArgs e)
		{
			try
			{
				sname = Request.QueryString["sname"];
				sid = Request.QueryString["sid"];
			}
			catch (Exception ex)
			{
				sname = null;
				sid = null;
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: sid or sname not found." +ex.Message+"');", true);
			}
			if (!IsPostBack)
			{
				bool isSidPresent = !string.IsNullOrEmpty(sid);
				logoutItem.Visible = isSidPresent;
				registerItem.Visible = !isSidPresent;
				loginItem.Visible = !isSidPresent;
				LoadJobData();
				Session.Remove("SearchKey");
				Session.Remove("SearchLocation");
				Session.Remove("SearchTiming");
			}
		}




		private void LoadJobData()
		{
			string key = Session["SearchKey"]?.ToString();
			string loc = Session["SearchLocation"]?.ToString();
			string time = Session["SearchTiming"]?.ToString();

			string jobQuery = string.IsNullOrEmpty(sid)
		   ? @"
				SELECT j.jobid, j.jobtitle, j.jobexperience, j.jobemployeementstatus, j.jobJD, j.jobsalary, j.jobvacancy, c.cname, c.ccity, c.cwebsiteurl
				FROM joblist j
				INNER JOIN company c ON j.cid = c.cid
				WHERE (@Key IS NULL OR j.jobtitle LIKE '%' + @Key + '%' OR c.cname LIKE '%' + @Key + '%' OR j.jobsalary LIKE '%' + @Key + '%')
				AND (@Loc IS NULL OR c.ccity LIKE '%' + @Loc + '%')
				AND (@Time IS NULL OR j.jobemployeementstatus = @Time)"
		   : @"
				SELECT j.jobid, j.jobtitle, j.jobexperience, j.jobemployeementstatus, j.jobJD, j.jobsalary, j.jobvacancy, c.cname, c.ccity, c.cwebsiteurl
				FROM joblist j
				INNER JOIN company c ON j.cid = c.cid
				LEFT JOIN applyjob a ON j.jobid = a.jobid AND a.sid = @StudentID
				WHERE a.applyid IS NULL
				AND (@Key IS NULL OR j.jobtitle LIKE '%' + @Key + '%' OR c.cname LIKE '%' + @Key + '%' OR j.jobsalary LIKE '%' + @Key + '%')
				AND (@Loc IS NULL OR c.ccity LIKE '%' + @Loc + '%')
				AND (@Time IS NULL OR j.jobemployeementstatus = @Time)";

			using (SqlConnection con = new SqlConnection(connStr))
			{
				con.Open();
				SqlCommand jobCommand = new SqlCommand(jobQuery, con);

				// Add parameter only if sid is not null
				if (!string.IsNullOrEmpty(sid))
				{
					jobCommand.Parameters.AddWithValue("@StudentID", sid); // Set parameter for StudentID
				}

				// Add additional parameters for filtering
				jobCommand.Parameters.AddWithValue("@Key", string.IsNullOrEmpty(key) ? (object)DBNull.Value : key);
				jobCommand.Parameters.AddWithValue("@Loc", string.IsNullOrEmpty(loc) ? (object)DBNull.Value : loc);
				jobCommand.Parameters.AddWithValue("@Time", string.IsNullOrEmpty(time) ? (object)DBNull.Value : time);

				CallingReader(jobCommand); // Call the method to process the results
			}
		}


		protected string GetBadgeClass(string jobType)
		{
			switch (jobType)
			{
				case "Full Time":
					return "bg-primary";
				case "Part Time":
					return "bg-warning";
				case "Freelancer":
					return "bg-success";
				case "Internship":
					return "bg-danger";
				default:
					return "bg-secondary"; // Default class if none match
			}
		}



		protected void FilterJob_Click(object sender, EventArgs e)
		{
			string key = keyword.Text;
			string loc = location.Text;
			string time = timing.SelectedValue;

			using (SqlConnection con = new SqlConnection(connStr))
			{
				con.Open();
				string jobQuery = @"
					SELECT j.jobid, j.jobtitle, j.jobexperience, j.jobemployeementstatus, j.jobJD, j.jobsalary, j.jobvacancy, c.cname, c.ccity, c.cwebsiteurl
					FROM joblist j
					INNER JOIN company c ON j.cid = c.cid
					LEFT JOIN applyjob a ON j.jobid = a.jobid AND a.sid = @StudentID
					WHERE a.applyid IS NULL
					AND (@Key IS NULL OR j.jobtitle LIKE '%' + @Key + '%' OR c.cname LIKE '%' + @Key + '%' OR j.jobsalary LIKE '%' + @Key + '%')
					AND (@Loc IS NULL OR c.ccity LIKE '%' + @Loc + '%')
					AND (@Time IS NULL OR j.jobemployeementstatus = @Time)
					ORDER BY j.jobid;";

				SqlCommand jobCommand = new SqlCommand(jobQuery, con);

				// Check if `sid` is present or not
				if (string.IsNullOrEmpty(sid))
				{
					// Show an alert and exit method if `sid` is missing
					ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please log in to view more jobs according to you.');", true);
					return;
				}

				jobCommand.Parameters.AddWithValue("@StudentID", sid);
				jobCommand.Parameters.AddWithValue("@Key", string.IsNullOrEmpty(key) ? (object)DBNull.Value : key);
				jobCommand.Parameters.AddWithValue("@Loc", string.IsNullOrEmpty(loc) ? (object)DBNull.Value : loc);
				jobCommand.Parameters.AddWithValue("@Time", string.IsNullOrEmpty(time) ? (object)DBNull.Value : time);
				CallingReader(jobCommand);
			}
		}



		protected void ApplyJob_Click(object sender, EventArgs e)
		{
			try
			{
				Button btn = (Button)sender;
				int jobId = Convert.ToInt32(btn.CommandArgument);

				if (string.IsNullOrEmpty(sid))
				{
					ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please log in to apply for this job.');", true);
					return;
				}

				using (SqlConnection con = new SqlConnection(connStr))
				{
					con.Open();
					SqlCommand command = new SqlCommand("INSERT INTO applyjob (sid, jobid) VALUES (@SID, @JOBID)", con);
					command.Parameters.AddWithValue("@SID", sid);
					command.Parameters.AddWithValue("@JOBID", jobId);
					command.ExecuteNonQuery();
				}

				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Job application successful!');", true);
			}
			catch (Exception)
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An error occurred while applying for the job.');", true);
			}
			finally
			{
				FilterJob_Click(sender, e);
			}
		}





		private void CallingReader(SqlCommand jobCommand)
		{
			SqlDataReader reader = jobCommand.ExecuteReader();
			var jobs = new List<dynamic>();
			int jobCount = 0;
			while (reader.Read())
			{
				jobs.Add(new
				{
					JobId = reader["jobid"].ToString(),
					JobTitle = reader["jobtitle"].ToString(),
					JobDescription = reader["jobJD"].ToString(),
					Publisher = reader["cname"].ToString(),
					SalaryRange = reader["jobsalary"].ToString(),
					VacancyCount = reader["jobvacancy"].ToString(),
					JobType = reader["jobemployeementstatus"].ToString(),
					JobExperience = reader["jobexperience"].ToString(),
					JobLocation = reader["ccity"].ToString(),
					JobLink = reader["cwebsiteurl"].ToString()
				});

				jobCount++;
			}
			JobNumberLabel.Text = $"{jobCount} Jobs Listed";
			JobCardRepeater.DataSource = jobs;
			JobCardRepeater.DataBind();
		}

	}
}
