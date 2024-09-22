
using System;
using System.Data.SqlClient;

namespace JobPortal
{
    public partial class JobPortalLogin : System.Web.UI.Page
    {
        protected string userRole;
        // Connection string
        string connectionString = "uid=sa; password=manager@123; database=JobPortal; server=7Y27QV3\\SQLEXPRESS";

        // This variable will store the role (Student, Company, Admin)
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Any initial setup can go here
            }
        }

        // This is triggered when the user clicks the Login button
        protected void LoginButton_Click(object sender, EventArgs e)
        {

            userRole = roleHiddenField.Value;

            
            
            // Get the username and password input
            string username = UsernameTextBox.Text.Trim();
            string password = PasswordTextBox.Text.Trim();

            // Validate input fields
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                // Handle error - display message, etc.
                Response.Write("<script>alert('Please enter both username and password.');</script>");
                return;
            }

            // Based on the selected role, validate login
            bool isValidUser = ValidateUser(username, password, userRole);

            if (isValidUser)
            {

                string cid = null;
                string cname = null; // Variable to store company name

                // Fetch the cid and cname if the user is a company
                if (userRole == "Company")
                {
                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        con.Open();
                        string query = "SELECT cid, cname FROM company WHERE (cemail = @Username OR cusername = @Username) AND cpassword = @Password";
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            // Use parameters to avoid SQL injection
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
                }

                // Redirect user to respective dashboard or homepage
                if (userRole == "Student")
                {
                    Response.Redirect("StudentDashboard.aspx");
                }
                else if (userRole == "Company" && cid!=null)
                {
                    
                    Response.Redirect("CompanyDashboard.aspx?cid="+cid+"&cname="+cname);
                }
                else if (userRole == "Admin")
                {
                    Response.Redirect("AdminPage.aspx");
                }
            }
            else
            {
                // Invalid login - display error message
                Response.Write("<script>alert('Invalid login credentials. Please try again.');</script>");
            }

            
        }

        // Method to validate user credentials based on the role
        private bool ValidateUser(string username, string password, string role)
        {
            bool isValid = false;

            // Define the query and table based on the role
            string query = "";
            if (role == "Student")
            {
                query = $"SELECT COUNT(*) FROM student WHERE semail = '{username}' OR susername = '{username}' AND spassword = '{password}'";
            }
            else if (role == "Company")
            {
                query = $"SELECT COUNT(*) FROM company WHERE cemail = '{username}' OR cusername = '{username}' AND cpassword = '{password}'";
            }
            else if (role == "Admin")
            {
                query = $"SELECT COUNT(*) FROM admin WHERE aemail = '{username}' OR ausername = '{username}' AND apassword = '{password}'";
            }

            // Establish SQL connection
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Execute the query and check if a match is found
                        int userCount = (int)cmd.ExecuteScalar();

                        if (userCount > 0)
                        {
                            isValid = true;
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Log or handle the exception
                    Response.Write($"<script>alert('Error: {ex.Message}');</script>");
                }
            }

            return isValid;
        }
    }
}