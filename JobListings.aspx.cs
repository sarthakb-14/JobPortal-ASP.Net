using System;
using System.Collections.Generic;

namespace JobPortal
{
    public partial class JobListings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindJobData();
            }
        }

        private void BindJobData()
        {
            var jobs = new List<dynamic> {
                new {
                    JobTitle = "Dropbox Product Designer", JobLink = "#",
                    Publisher = "John Stewart",
                    Location = "Melbourne, Australia", VacancyCount = "4-5",
                    SalaryRange = "$60k — $100k",
                    JobDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                },
                new {
                    JobTitle = "Amazon UX Researcher", JobLink = "#",
                    Publisher = "Jane Doe", Location = "New York, USA",
                    VacancyCount = "2", SalaryRange = "$70k — $120k",
                    JobDescription = "Vivamus id elit nec turpis sollicitudin pellentesque.Vivamus id elit nec turpis sollicitudin pellentesque.Vivamus id elit nec turpis sollicitudin pellentesque."
                },
                new {
                    JobTitle = "Google Frontend Engineer", JobLink = "#",
                    Publisher = "Mark Smith", Location = "San Francisco, USA",
                    VacancyCount = "8-10", SalaryRange = "$90k — $150k",
                    JobDescription = "Aliquam in risus a felis viverra faucibus.Aliquam in risus a felis viverra faucibus.Aliquam in risus a felis viverra faucibus."
                }
            };

            JobCardRepeater.DataSource = jobs;
            JobCardRepeater.DataBind();
        }

        protected void ApplyJob(object sender, EventArgs e) { }
    }
}