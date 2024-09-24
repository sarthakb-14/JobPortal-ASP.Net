using System;
using System.Data;
using System.Data.SqlClient;

namespace JobPortal
{
    public partial class AppliedJobReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAppliedJobs();
            }
        }

        private void BindAppliedJobs()
        {
            string cid = Request.QueryString["cid"];
            string connString = "uid=sa; password=manager@123; database=JobPortal; server=DK27QV3\\SQLEXPRESS";
            using (SqlConnection conn = new SqlConnection(connString))
            {
                // Updated SQL query to include student name (sname)
                string query = @"
                    SELECT a.applyid, a.sid, a.jobid, 
                           j.jobtitle, 
                           c.cname,
                           s.sname
                    FROM applyjob a
                    JOIN joblist j ON a.jobid = j.jobid
                    JOIN company c ON j.cid = c.cid
                    JOIN student s ON a.sid = s.sid where c.cid = '"+cid+"'"; // Join with student table to get student name

                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptAppliedJobs.DataSource = dt;
                rptAppliedJobs.DataBind();
            }
        }
    }
}
