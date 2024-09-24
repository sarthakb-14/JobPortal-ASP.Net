using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace JobPortal
{
	public partial class JobListings : System.Web.UI.Page
	{
		private readonly string connStr = "uid=sa; password=manager@123; database=JobPortal; server=7Y27QV3\\SQLEXPRESS";
		private readonly int PageSize = 8; // Number of jobs per page
		private int PageIndex = 1; // Current page index
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
				if (!string.IsNullOrEmpty(Request.QueryString["page"]))
				{
					PageIndex = int.Parse(Request.QueryString["page"]);
				}
				JobNumber();
				LoadJobData();
				SetupPagination();
			}
		}

		private void LoadJobData()
		{
			using (SqlConnection con = new SqlConnection(connStr))
			{
				con.Open();
				string jobQuery = @"
                    SELECT j.jobtitle, j.jobexperience, j.jobemployeementstatus, j.jobJD, j.jobsalary, j.jobvacancy, c.cname, c.ccity, c.cwebsiteurl 
                    FROM joblist j 
                    INNER JOIN company c ON j.cid = c.cid
                    ORDER BY j.jobid 
                    OFFSET (@PageIndex - 1) * @PageSize ROWS 
                    FETCH NEXT @PageSize ROWS ONLY";

				SqlCommand jobCommand = new SqlCommand(jobQuery, con);
				jobCommand.Parameters.AddWithValue("@PageIndex", PageIndex);
				jobCommand.Parameters.AddWithValue("@PageSize", PageSize);
				CallingReader(jobCommand);
			}
		}



		private void SetupPagination()
		{
			using (SqlConnection con = new SqlConnection(connStr))
			{
				con.Open();
				SqlCommand countCommand = new SqlCommand("SELECT COUNT(*) as TotalCount FROM joblist", con);
				int totalJobs = (int)countCommand.ExecuteScalar();
				int totalPages = (int)Math.Ceiling((double)totalJobs / PageSize);
				var pagination = new List<dynamic>();
				// Add previous button
				if (PageIndex > 1)
				{
					string prevUrl = $"JobListings.aspx?page={PageIndex - 1}";
					if (!string.IsNullOrEmpty(sid) && !string.IsNullOrEmpty(sname))
					{
						prevUrl += $"&sid={sid}&sname={sname}";
					}
					pagination.Add(new { Value = PageIndex - 1, Text = "Previous", CssClass = "prev", Url = prevUrl });
				}
				// Add page numbers
				for (int i = 1; i <= totalPages; i++)
				{
					string pageUrl = $"JobListings.aspx?page={i}";
					if (!string.IsNullOrEmpty(sid) && !string.IsNullOrEmpty(sname))
					{
						pageUrl += $"&sid={sid}&sname={sname}";
					}
					pagination.Add(new { Value = i, Text = i.ToString(), CssClass = i == PageIndex ? "active" : "", Url = pageUrl });
				}
				// Add next button
				if (PageIndex < totalPages)
				{
					string nextUrl = $"JobListings.aspx?page={PageIndex + 1}";
					if (!string.IsNullOrEmpty(sid) && !string.IsNullOrEmpty(sname))
					{
						nextUrl += $"&sid={sid}&sname={sname}";
					}
					pagination.Add(new { Value = PageIndex + 1, Text = "Next", CssClass = "next", Url = nextUrl });
				}

				PaginationRepeater.DataSource = pagination;
				PaginationRepeater.DataBind();
			}
		}



		private void JobNumber()
		{
			using (SqlConnection con = new SqlConnection(connStr))
			{
				con.Open();
				SqlCommand jobCommand = new SqlCommand("SELECT COUNT(*) as JobCount FROM joblist j, company c WHERE j.cid = c.cid;", con);
				int jobCount = (int)jobCommand.ExecuteScalar();
				JobNumberLabel.Text = $"{jobCount} Jobs Listed";
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
			SELECT j.jobtitle, j.jobexperience, j.jobemployeementstatus, j.jobJD, j.jobsalary, j.jobvacancy, c.cname, c.ccity, c.cwebsiteurl
			FROM joblist j
			INNER JOIN company c ON j.cid = c.cid
			LEFT JOIN applyjob a ON j.jobid = a.jobid AND a.sid = @StudentID
			WHERE a.applyid IS NULL
			AND (@Key IS NULL OR j.jobtitle LIKE '%' + @Key + '%' OR c.cname LIKE '%' + @Key + '%' OR j.jobsalary LIKE '%' + @Key + '%')
			AND (@Loc IS NULL OR c.ccity LIKE '%' + @Loc + '%')
			AND (@Time IS NULL OR j.jobemployeementstatus = @Time)
			ORDER BY j.jobid
			OFFSET (@PageIndex - 1) * @PageSize ROWS
			FETCH NEXT @PageSize ROWS ONLY;";

				SqlCommand jobCommand = new SqlCommand(jobQuery, con);

				// Check if `sid` is present or not
				if (string.IsNullOrEmpty(sid))
				{
					// Show an alert and exit method if `sid` is missing
					ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: Student ID is missing. Please log in again.');", true);
					return;
				}

				jobCommand.Parameters.AddWithValue("@StudentID", sid);
				jobCommand.Parameters.AddWithValue("@Key", string.IsNullOrEmpty(key) ? (object)DBNull.Value : key);
				jobCommand.Parameters.AddWithValue("@Loc", string.IsNullOrEmpty(loc) ? (object)DBNull.Value : loc);
				jobCommand.Parameters.AddWithValue("@Time", string.IsNullOrEmpty(time) ? (object)DBNull.Value : time);
				jobCommand.Parameters.AddWithValue("@PageIndex", PageIndex);
				jobCommand.Parameters.AddWithValue("@PageSize", PageSize);

				CallingReader(jobCommand);
			}
		}




		protected void ApplyJob_Click(object sender, EventArgs e)
		{
			Button btn = (Button)sender;
			int cid = Convert.ToInt32(btn.CommandArgument);
			using (SqlConnection con = new SqlConnection(connStr)) // Get the Company ID from CommandArgument
			{
				con.Open();
				SqlCommand command = new SqlCommand("INSERT INTO applyjob (sid, cid) VALUES (@SID, @CID)", con);
				command.Parameters.AddWithValue("@SID", sid);
				command.Parameters.AddWithValue("@CID", cid);
				command.ExecuteNonQuery();
			}
		}



		private void CallingReader(SqlCommand jobCommand)
		{
			SqlDataReader reader = jobCommand.ExecuteReader();
			var jobs = new List<dynamic>();
			while (reader.Read())
			{
				jobs.Add(new
				{
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
			}
			JobCardRepeater.DataSource = jobs;
			JobCardRepeater.DataBind();
		}
	}
}
