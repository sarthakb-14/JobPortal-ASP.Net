using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;

namespace JobPortal
{
	public partial class StudentDashboard : System.Web.UI.Page
    {
        string connectionString = "uid=sa; password=manager@123; database=JobPortal; server=7Y27QV3\\SQLEXPRESS";



        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["UserID"]?.ToString()) || string.IsNullOrEmpty(Session["UserName"]?.ToString()))
            {
                Response.Redirect("JobPortalLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadStudentProfile();
                string studentName = Session["UserName"].ToString();
                if (!string.IsNullOrEmpty(studentName))
                {
                    lblStudentName.Text = studentName;
                }
                string sid = Session["UserID"].ToString();
                LoadJobApplications(sid);
            }
        }



        private void LoadJobApplications(string sid)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT c.cname AS CompanyName, j.jobtitle AS JobTitle
                    FROM applyjob a
                    INNER JOIN joblist j ON a.jobid = j.jobid
                    INNER JOIN company c ON j.cid = c.cid
                    WHERE a.sid = @sid
                    ORDER BY c.cname";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@sid", sid);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind();
            }
        }



        private void LoadStudentProfile()
        {
            string sid = Session["UserID"].ToString();
            

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT sname, semail, sdob, sgender, saddress, scontactno FROM student WHERE sId = @studentId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@studentId", sid);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    NameTextBox.Text = reader["sname"].ToString();
                    EmailTextBox.Text = reader["semail"].ToString();
                    DOBTextBox.Text = Convert.ToDateTime(reader["sdob"]).ToString("yyyy-MM-dd");
                    GenderDropDown.SelectedValue = reader["sgender"].ToString();
                    AddressTextBox.Text = reader["saddress"].ToString();
                    PhoneTextBox.Text = reader["scontactno"].ToString();
                }
            }
        }



        protected void SaveProfileButton_Click(object sender, EventArgs e)
        {
			string sid = Session["UserID"].ToString();
			using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE student SET sname = @sname, semail = @semail, sdob = @sdob, sgender = @sgender, saddress = @saddress, scontactno = @scontactno WHERE sId = @studentId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@sname", NameTextBox.Text);
                cmd.Parameters.AddWithValue("@semail", EmailTextBox.Text);
                cmd.Parameters.AddWithValue("@sdob", DateTime.Parse(DOBTextBox.Text));
                cmd.Parameters.AddWithValue("@sgender", GenderDropDown.SelectedValue);
                cmd.Parameters.AddWithValue("@saddress", AddressTextBox.Text);
                cmd.Parameters.AddWithValue("@scontactno", PhoneTextBox.Text);
                cmd.Parameters.AddWithValue("@studentId", sid);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }



        protected void ChangePasswordButton_Click(object sender, EventArgs e)
        {
            string sid = Session["UserID"].ToString();
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string query = "SELECT spassword FROM student WHERE sId = @studentId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@studentId", sid);
                string currentPasswordHash = cmd.ExecuteScalar()?.ToString();

                if (currentPasswordHash == CurrentPasswordTextBox.Text) 
                {
                    // Step 3: Update the password in the database
                    string updateQuery = "UPDATE student SET spassword = @newPassword WHERE sId = @studentId";
                    SqlCommand updateCmd = new SqlCommand(updateQuery, conn);
                    updateCmd.Parameters.AddWithValue("@newPassword", NewPasswordTextBox.Text);
                    updateCmd.Parameters.AddWithValue("@studentId", sid);
                    updateCmd.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Password changed successfully.');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('The current password is incorrect.');", true);
                }
            }
        }
    }
}
