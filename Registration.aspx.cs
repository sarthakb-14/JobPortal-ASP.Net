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
                string connectionString = "uid=sa; password=manager@123; database=JobPortal; server=C927QV3\\SQLEXPRESS";
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    // Check if the email already exists
                    string checkEmailQuery = "SELECT COUNT(*) FROM student WHERE semail = '" + EmailTextBox.Text + "'";
                    SqlCommand checkEmailCmd = new SqlCommand(checkEmailQuery, con);
                    int emailCount = (int)checkEmailCmd.ExecuteScalar();

                    if (emailCount > 0)
                    {
                        Label2.Text = "Email address is already in use.";
                        return;
                    }

                    // Proceed with inserting new record
                    string insertQuery = "INSERT INTO student (sname, semail, susername, spassword, sdob, sgender, saddress) " +
                                         "VALUES ('" + StudentNameTextBox.Text + "', '" +
                                         EmailTextBox.Text + "', '" +
                                         UsernameTextBox.Text + "', '" +
                                         PasswordTextBox.Text + "', '" +
                                         DOBTextBox.Text + "', '" +
                                         GenderDropDown.SelectedValue + "', '" +
                                         AddressTextBox.Text + "')";

                    SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                    int rowsAffected = insertCmd.ExecuteNonQuery();
                    Label2.Text = "New student account created!";
                    Response.Redirect("JobPortalLogin.aspx");
                }
            }
        }

        protected void CompanyRegisterButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string connectionString = "uid=sa; password=manager@123; database=JobPortal; server=C927QV3\\SQLEXPRESS";
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    // Check if the email already exists
                    string checkEmailQuery = "SELECT COUNT(*) FROM company WHERE cemail = '" + CompanyEmailTextBox.Text + "'";
                    SqlCommand checkEmailCmd = new SqlCommand(checkEmailQuery, con);
                    int emailCount = (int)checkEmailCmd.ExecuteScalar();

                    if (emailCount > 0)
                    {
                        Label1.Text = "Email address is already in use.";
                        return;
                    }

                    // Proceed with inserting new record
                    string insertQuery = "INSERT INTO company (cname, cemail, cusername, cpassword, caddress, ccity, cwebsiteurl, ccontactno) " +
                                         "VALUES ('" + CompanyNameTextBox.Text + "', '" +
                                         CompanyEmailTextBox.Text + "', '" +
                                         CompanyUsernameTextBox.Text + "', '" +
                                         CompanyPasswordTextBox.Text + "', '" +
                                         CompanyAddressTextBox.Text + "', '" +
                                         CityTextBox.Text + "', '" +
                                         WebsiteTextBox.Text + "', '" +
                                         ContactNumberTextBox.Text + "')";

                    SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                    int rowsAffected = insertCmd.ExecuteNonQuery();
                    Label1.Text = "New company account created!";
                    Response.Redirect("JobPortalLogin.aspx");
                }
            }
        }
    }
}
