using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace JobPortal
{
	public partial class JobListings : System.Web.UI.Page
	{
		private readonly string connStr = "uid=sa; password=manager@123; database=JobPortal; server=7Y27QV3\\SQLEXPRESS";
		private int PageSize = 8; // Number of jobs per page
		private int PageIndex = 1; // Current page index

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				// Get current page number from query string, default is 1
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
				// SQL query with OFFSET and FETCH to implement pagination
				string jobQuery = @"
                    SELECT j.jobtitle, j.jobexperience, j.jobemployeementstatus, j.jobJD, j.jobsalary, j.jobvacancy, c.cname, c.ccity 
                    FROM joblist j 
                    INNER JOIN company c ON j.cid = c.cid
                    ORDER BY j.jobid 
                    OFFSET (@PageIndex - 1) * @PageSize ROWS 
                    FETCH NEXT @PageSize ROWS ONLY";

				SqlCommand jobCommand = new SqlCommand(jobQuery, con);
				jobCommand.Parameters.AddWithValue("@PageIndex", PageIndex);
				jobCommand.Parameters.AddWithValue("@PageSize", PageSize);

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
						JobLink = "" // Add link as per your logic
					});
				}

				JobCardRepeater.DataSource = jobs;
				JobCardRepeater.DataBind();
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
					pagination.Add(new { Value = PageIndex - 1, Text = "Previous", CssClass = "prev" });
				}

				// Add page numbers
				for (int i = 1; i <= totalPages; i++)
				{
					pagination.Add(new { Value = i, Text = i.ToString(), CssClass = i == PageIndex ? "active" : "" });
				}

				// Add next button
				if (PageIndex < totalPages)
				{
					pagination.Add(new { Value = PageIndex + 1, Text = "Next", CssClass = "next" });
				}

				// Bind the pagination
				PaginationRepeater.DataSource = pagination;
				PaginationRepeater.DataBind();
			}
		}


		protected void ApplyJob(object sender, EventArgs e) { }
	}
}
