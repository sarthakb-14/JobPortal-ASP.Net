
using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace JobPortal
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if it is a postback
            if (!IsPostBack)
            {
                // Initialization logic if needed
            }
        }

        protected void UserTypeDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedValue = UserTypeDropDown.SelectedValue;

            // Show or hide panels based on selected user type
            if (selectedValue == "Student")
            {
                StudentPanel.Visible = true;
                CompanyPanel.Visible = false;
            }
            else if (selectedValue == "Company")
            {
                StudentPanel.Visible = false;
                CompanyPanel.Visible = true;
            }
            else
            {
                StudentPanel.Visible = false;
                CompanyPanel.Visible = false;
            }
        }

		protected void StudentRegisterButton_Click(object sender, EventArgs e)
		{
			if (Page.IsValid)
			{
				string connectionString = "uid=sa; password=manager@123; database=JobPortal; server=7Y27QV3\\SQLEXPRESS";
				using (SqlConnection con = new SqlConnection(connectionString))
				{
					con.Open();

					// Check if the email already exists
					string checkEmailQuery = "SELECT COUNT(*) FROM student WHERE semail = @Email";
					SqlCommand checkEmailCmd = new SqlCommand(checkEmailQuery, con);
					checkEmailCmd.Parameters.AddWithValue("@Email", EmailTextBox.Text);
					int emailCount = (int)checkEmailCmd.ExecuteScalar();

					if (emailCount > 0)
					{
						Label2.Text = "Email address is already in use.";
						Label2.ForeColor = System.Drawing.Color.Red; // Set label color to red
						return;
					}

					// Check if the username already exists
					string checkUserQuery = "SELECT COUNT(*) FROM student WHERE susername = @Username";
					SqlCommand checkUserCmd = new SqlCommand(checkUserQuery, con);
					checkUserCmd.Parameters.AddWithValue("@Username", UsernameTextBox.Text);
					int userCount = (int)checkUserCmd.ExecuteScalar();

					if (userCount > 0)
					{
						Label2.Text = "Username is already in use.";
						Label2.ForeColor = System.Drawing.Color.Red; // Set label color to red
						return;
					}

					// Proceed with inserting new record
					string insertQuery = "INSERT INTO student (sname, semail, susername, spassword, sdob, sgender, saddress, sskills) " +
										 "VALUES (@Name, @Email, @Username, @Password, @DOB, @Gender, @Address, @Skills)";
					SqlCommand insertCmd = new SqlCommand(insertQuery, con);
					insertCmd.Parameters.AddWithValue("@Name", StudentNameTextBox.Text);
					insertCmd.Parameters.AddWithValue("@Email", EmailTextBox.Text);
					insertCmd.Parameters.AddWithValue("@Username", UsernameTextBox.Text);
					insertCmd.Parameters.AddWithValue("@Password", PasswordTextBox.Text);
					insertCmd.Parameters.AddWithValue("@DOB", DOBTextBox.Text);
					insertCmd.Parameters.AddWithValue("@Gender", GenderDropDown.SelectedValue);
					insertCmd.Parameters.AddWithValue("@Address", AddressTextBox.Text);
					insertCmd.Parameters.AddWithValue("@Skills", SkillTextBox.Text);

					int rowsAffected = insertCmd.ExecuteNonQuery();
					Label2.Text = "New student account created!";
					Label2.ForeColor = System.Drawing.Color.Green; // Set label color to green for success
					Response.Redirect("JobPortalLogin.aspx");
				}
			}
		}

		protected void CompanyRegisterButton_Click(object sender, EventArgs e)
		{
			if (Page.IsValid)
			{
				string connectionString = "uid=sa; password=manager@123; database=JobPortal; server=7Y27QV3\\SQLEXPRESS";
				using (SqlConnection con = new SqlConnection(connectionString))
				{
					con.Open();

					// Check if the email already exists
					string checkEmailQuery = "SELECT COUNT(*) FROM company WHERE cemail = @Email";
					SqlCommand checkEmailCmd = new SqlCommand(checkEmailQuery, con);
					checkEmailCmd.Parameters.AddWithValue("@Email", CompanyEmailTextBox.Text);
					int emailCount = (int)checkEmailCmd.ExecuteScalar();

					if (emailCount > 0)
					{
						Label1.Text = "Email address is already in use.";
						Label1.ForeColor = System.Drawing.Color.Red; // Set label color to red
						return;
					}

					// Check if the username already exists
					string checkUserQuery = "SELECT COUNT(*) FROM company WHERE cusername = @Username";
					SqlCommand checkUserCmd = new SqlCommand(checkUserQuery, con);
					checkUserCmd.Parameters.AddWithValue("@Username", CompanyUsernameTextBox.Text);
					int userCount = (int)checkUserCmd.ExecuteScalar();

					if (userCount > 0)
					{
						Label1.Text = "Username is already in use.";
						Label1.ForeColor = System.Drawing.Color.Red; // Set label color to red
						return;
					}

					// Proceed with inserting new record
					string insertQuery = "INSERT INTO company (cname, cemail, cusername, cpassword, caddress, ccity, cwebsiteurl, ccontactno) " +
										 "VALUES (@Name, @Email, @Username, @Password, @Address, @City, @Website, @Contact)";
					SqlCommand insertCmd = new SqlCommand(insertQuery, con);
					insertCmd.Parameters.AddWithValue("@Name", CompanyNameTextBox.Text);
					insertCmd.Parameters.AddWithValue("@Email", CompanyEmailTextBox.Text);
					insertCmd.Parameters.AddWithValue("@Username", CompanyUsernameTextBox.Text);
					insertCmd.Parameters.AddWithValue("@Password", CompanyPasswordTextBox.Text);
					insertCmd.Parameters.AddWithValue("@Address", CompanyAddressTextBox.Text);
					insertCmd.Parameters.AddWithValue("@City", CityTextBox.Text);
					insertCmd.Parameters.AddWithValue("@Website", WebsiteTextBox.Text);
					insertCmd.Parameters.AddWithValue("@Contact", ContactNumberTextBox.Text);

					int rowsAffected = insertCmd.ExecuteNonQuery();
					Label1.Text = "New company account created!";
					Label1.ForeColor = System.Drawing.Color.Green; // Set label color to green for success
					Response.Redirect("JobPortalLogin.aspx");
				}
			}
		}
	}
}
