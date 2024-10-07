using System;
using System.Data.SqlClient;

namespace JobPortal
{
    public partial class JobPortalLogin : System.Web.UI.Page
    {
        protected string userRole;
        string connectionString = "uid=sa; password=manager@123; database=JobPortal; server=DK27QV3\\SQLEXPRESS";

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
                                Session["UserID"] = dr["cid"].ToString();
                                Session["UserName"] = dr["cname"].ToString();
                                Session["UserRole"] = "Company";
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
                                Session["UserID"] = dr["aid"].ToString();
                                Session["UserName"] = dr["aname"].ToString();
                                Session["UserRole"] = "Admin";
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
                                Session["UserID"] = dr["sid"].ToString();
                                Session["UserName"] = dr["sname"].ToString();
                                Session["UserRole"] = "Student";
                            }
                        }
                    }
                }

                // Redirect user to the respective dashboard or homepage
                if (Session["UserRole"].ToString() == "Student")
                {
                    Response.Redirect("StudentDashboard.aspx");
                }
                else if (Session["UserRole"].ToString() == "Company")
                {
                    Response.Redirect("CompanyDashboard.aspx");
                }
                else if (Session["UserRole"].ToString() == "Admin")
                {
                    Response.Redirect("AdminDashboard/AdminDashboard.aspx");
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
