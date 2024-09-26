using System;
using System.Data.SqlClient;

namespace JobPortal
{
    public partial class JobPortalLogin : System.Web.UI.Page
    {
        protected string userRole;
        string connectionString = "uid=sa; password=manager@123; database=JobPortal; server=7Y27QV3\\SQLEXPRESS";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Any initial setup can go here
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            userRole = roleHiddenField.Value;

            string username = UsernameTextBox.Text.Trim();
            string password = PasswordTextBox.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                Response.Write("<script>alert('Please enter both username and password.');</script>");
                return;
            }

            bool isValidUser = ValidateUser(username, password, userRole);
            if (isValidUser)
            {
                string cid = null;
                string cname = null;
                string aid = null;
                string aname = null;
                string sid = null;
                string sname = null;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    // Fetch cid and cname for Company users
                    if (userRole == "Company")
                    {
                        string query = "SELECT cid, cname FROM company WHERE (cemail = @Username OR cusername = @Username) AND cpassword = @Password";
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@Username", username);
                            cmd.Parameters.AddWithValue("@Password", password);

                            SqlDataReader dr = cmd.ExecuteReader();
                            if (dr.Read())
                            {
                                cid = dr["cid"].ToString();
                                cname = dr["cname"].ToString();
                            }
                        }
                    }

                    // Fetch aid and aname for Admin users
                    if (userRole == "Admin")
                    {
                        string aquery = "SELECT aid, aname FROM admin WHERE (aemail = @Username OR ausername = @Username) AND apassword = @Password";
                        using (SqlCommand cmd = new SqlCommand(aquery, con))
                        {
                            cmd.Parameters.AddWithValue("@Username", username);
                            cmd.Parameters.AddWithValue("@Password", password);

                            SqlDataReader dr = cmd.ExecuteReader();
                            if (dr.Read())
                            {
                                aid = dr["aid"].ToString();
                                aname = dr["aname"].ToString();
                            }
                        }
                    }

                    // Fetch sid and sname for Student users
                    if (userRole == "Student")
                    {
                        string squery = "SELECT sid, sname FROM student WHERE (semail = @Username OR susername = @Username) AND spassword = @Password";
                        using (SqlCommand cmd = new SqlCommand(squery, con))
                        {
                            cmd.Parameters.AddWithValue("@Username", username);
                            cmd.Parameters.AddWithValue("@Password", password);

                            SqlDataReader dr = cmd.ExecuteReader();
                            if (dr.Read())
                            {
                                sid = dr["sid"].ToString();
                                sname = dr["sname"].ToString();
                            }
                        }
                    }
                }

                // Redirect user to respective dashboard or homepage
                if (userRole == "Student" && sid != null)
                {
                    Response.Redirect("StudentDashboard.aspx?sid=" + sid + "&sname=" + sname);
                }
                else if (userRole == "Company" && cid != null)
                {
                    Response.Redirect("CompanyDashboard.aspx?cid=" + cid + "&cname=" + cname);
                }
                else if (userRole == "Admin" && aid != null)
                {
                    Response.Redirect("AdminDashboard/AdminDashboard.aspx?aid=" + aid + "&aname=" + aname);
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid login credentials. Please try again.');</script>");
            }
        }

        private bool ValidateUser(string username, string password, string role)
        {
            bool isValid = false;
            string query = "";

            // Prepare the query based on the user role
            if (role == "Student")
            {
                query = "SELECT COUNT(*) FROM student WHERE (semail = @Username OR susername = @Username) AND spassword = @Password";
            }
            else if (role == "Company")
            {
                query = "SELECT COUNT(*) FROM company WHERE (cemail = @Username OR cusername = @Username) AND cpassword = @Password";
            }
            else if (role == "Admin")
            {
                query = "SELECT COUNT(*) FROM admin WHERE (aemail = @Username OR ausername = @Username) AND apassword = @Password";
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);
                        cmd.Parameters.AddWithValue("@Password", password);

                        int userCount = (int)cmd.ExecuteScalar();
                        if (userCount > 0)
                        {
                            isValid = true;
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error: {ex.Message}');</script>");
                }
            }

            return isValid;
        }
    }
}
