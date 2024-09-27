using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace JobPortal
{
    public partial class AppliedJobReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAppliedJobs();
                BindShortlistedJobs();
            }
        }

        // Binds the Applied Jobs to the Repeater
        private void BindAppliedJobs()
        {
            string cid = Session["UserID"].ToString();

            if (string.IsNullOrEmpty(cid))
                return;

            string connString = "uid=sa; password=manager@123; database=JobPortal; server=7Y27QV3\\SQLEXPRESS";
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = @"
                    SELECT a.applyid, a.sid, a.jobid, 
                           j.jobtitle, 
                           c.cname,
                           s.sname
                    FROM applyjob a
                    JOIN joblist j ON a.jobid = j.jobid
                    JOIN company c ON j.cid = c.cid
                    JOIN student s ON a.sid = s.sid
                    WHERE c.cid = @cid";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@cid", cid);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptAppliedJobs.DataSource = dt;
                rptAppliedJobs.DataBind();
            }
        }

       
        private void BindShortlistedJobs()
        {
            string cid = Session["UserID"].ToString();

            if (string.IsNullOrEmpty(cid))
                return;

            string connString = "uid=sa; password=manager@123; database=JobPortal; server=7Y27QV3\\SQLEXPRESS";
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = @"
            SELECT s.sid, s.jobid, 
                   j.jobtitle, 
                   c.cname,
                   stu.sname
            FROM shortlistedcandidates s
            JOIN joblist j ON s.jobid = j.jobid
            JOIN company c ON j.cid = c.cid
            JOIN student stu ON s.sid = stu.sid
            WHERE c.cid = @cid";  // Filter by company ID

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@cid", cid);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptShortlistedJobs.DataSource = dt;
                rptShortlistedJobs.DataBind();
            }
        }


        // Accept Button Click Handler
        protected void btnAccept_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int applyId = int.Parse(btn.CommandArgument);

            string connString = "uid=sa; password=manager@123; database=JobPortal; server=7Y27QV3\\SQLEXPRESS";
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                // Get the details from applyjob table
                string selectQuery = "SELECT sid, jobid FROM applyjob WHERE applyid = @applyid";
                SqlCommand selectCmd = new SqlCommand(selectQuery, conn);
                selectCmd.Parameters.AddWithValue("@applyid", applyId);

                SqlDataReader reader = selectCmd.ExecuteReader();
                if (reader.Read())
                {
                    int sid = (int)reader["sid"];
                    int jobid = (int)reader["jobid"];
                    reader.Close();

                    // Insert into shortlistedcandidates
                    string insertQuery = "INSERT INTO shortlistedcandidates (sid, jobid) VALUES (@sid, @jobid)";
                    SqlCommand insertCmd = new SqlCommand(insertQuery, conn);
                    insertCmd.Parameters.AddWithValue("@sid", sid);
                    insertCmd.Parameters.AddWithValue("@jobid", jobid);
                    insertCmd.ExecuteNonQuery();

                    // Delete from applyjob
                    string deleteQuery = "DELETE FROM applyjob WHERE applyid = @applyid";
                    SqlCommand deleteCmd = new SqlCommand(deleteQuery, conn);
                    deleteCmd.Parameters.AddWithValue("@applyid", applyId);
                    deleteCmd.ExecuteNonQuery();
                }

                conn.Close();
            }

            // Rebind both sections to reflect changes
            BindAppliedJobs();
            BindShortlistedJobs();
        }

        // Deny Button Click Handler
        protected void btnDeny_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int applyId = int.Parse(btn.CommandArgument);

            string connString = "uid=sa; password=manager@123; database=JobPortal; server=7Y27QV3\\SQLEXPRESS";
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                // Delete from applyjob
                string deleteQuery = "DELETE FROM applyjob WHERE applyid = @applyid";
                SqlCommand deleteCmd = new SqlCommand(deleteQuery, conn);
                deleteCmd.Parameters.AddWithValue("@applyid", applyId);
                deleteCmd.ExecuteNonQuery();

                conn.Close();
            }

            // Rebind applied jobs to remove the denied job
            BindAppliedJobs();
        }
    }
}
