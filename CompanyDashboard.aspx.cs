using System;
using System.Data.SqlClient;

namespace JobPortal
{

    public partial class CompanyDashboard : System.Web.UI.Page
    {

        private readonly string conStr = "uid=sa; password=manager@123; database = JobPortal; server = DK27QV3\\SQLEXPRESS";

        


        protected void Page_Load(object sender, EventArgs e)
        {
            // Retrieve the company name from the query string
            string cname = Request.QueryString["cname"];

            if (!IsPostBack && !string.IsNullOrEmpty(cname))
            {
                // Update the label with the company name if available
                Label1.Text = cname;
            }
        }

        // Event handler for opening the update profile form
        protected void Openclick_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conStr);
            try
            {
                con.Open();
                // Select all company information (assuming only one row for the current company)
                SqlCommand cmd = new SqlCommand("SELECT * FROM company WHERE cid = @cid", con);

                // Get the company ID from the query string and add it as a parameter
                string cidStr = Request.QueryString["cid"];
                int cid;

                if (!int.TryParse(cidStr, out cid))
                {
                    // If cid is not valid, throw an error or show a user-friendly message
                    Label1.Text = "Invalid company ID.";
                    return;
                }

                cmd.Parameters.AddWithValue("@cid", cid);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    // Populate the text boxes with the company details
                    CompanyNameTextBox.Text = dr["cname"].ToString();
                    AddressTextBox.Text = dr["caddress"].ToString();
                    CityTextBox.Text = dr["ccity"].ToString();
                    EmailTextBox.Text = dr["cemail"].ToString();
                }
                else
                {
                    // Handle case where no company data is found for the given ID
                    Label1.Text = "Company not found.";
                }
            }
            catch (Exception ex)
            {
                // Handle any database or query errors
                Label1.Text = "Error retrieving company information: " + ex.Message;
            }
            finally
            {
                con.Close();
            }
        }

        // Event handler for updating the company profile
        protected void UpdateProfile_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                try
                {
                    con.Open();

                    // Retrieve the company ID from query string
                    string cidStr = Request.QueryString["cid"];
                    int cid;

                    if (!int.TryParse(cidStr, out cid))
                    {
                        // Show an error if the company ID is invalid
                        Label1.Text = "Invalid company ID.";
                        return;
                    }

                    // Update the company profile based on the form inputs
                    SqlCommand cmd = new SqlCommand("UPDATE company SET cname = @cname, caddress = @caddress, ccity = @ccity, cemail = @cemail WHERE cid = @cid", con);
                    cmd.Parameters.AddWithValue("@cid", cid);
                    cmd.Parameters.AddWithValue("@cname", CompanyNameTextBox.Text);
                    cmd.Parameters.AddWithValue("@caddress", AddressTextBox.Text);
                    cmd.Parameters.AddWithValue("@ccity", CityTextBox.Text);
                    cmd.Parameters.AddWithValue("@cemail", EmailTextBox.Text);

                    // Execute the update command
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        // Show success message
                        Label1.Text = "Profile updated successfully.";
                    }
                    else
                    {
                        // Show error if the update fails
                        Label1.Text = "Profile update failed.";
                    }
                }
                catch (Exception ex)
                {
                    // Handle any database or update errors
                    Label1.Text = "Error updating profile: " + ex.Message;
                }
            }
        }


    protected void ChangePassword_Click(object sender, EventArgs e)
        {
            string cid = Request.QueryString["cid"];
            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();
                try
                {
                    string oldpass = OldPasswordTextBox.Text;
                    string newpass = NewPasswordTextBox.Text;
                    string cnfmpass = ConfirmPasswordTextBox.Text;
                    // Validate passwords
                    if (newpass != cnfmpass)
                    {
                        Response.Write("<script>alert('New Password and Confirm Password fields should match!');</script>");
                        return;
                    }
                    // Fetch old password
                    string opass = null;
                    using (SqlCommand cmd0 = new SqlCommand("SELECT cpassword FROM company WHERE cid = @cid", con))
                    {
                        cmd0.Parameters.AddWithValue("@cid", cid);
                        using (SqlDataReader dr = cmd0.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                opass = dr["cpassword"].ToString();
                            }
                        }
                    }
                    // Check if the old password matches
                    if (oldpass != opass)
                    {
                        Response.Write("<script>alert('Old Password is not correct!');</script>");
                        return;
                    }
                    // Update new password using a parameterized query
                    using (SqlCommand cmd = new SqlCommand("UPDATE company SET cpassword = @newpass WHERE cid = @cid", con))
                    {
                        cmd.Parameters.AddWithValue("@newpass", newpass);
                        cmd.Parameters.AddWithValue("@cid", cid);
                        cmd.ExecuteNonQuery();
                    }
                    Response.Write("<script>alert('Password Changed Successfully!');</script>");
                }
                catch (Exception ex)
                {
                    // Proper escaping for JavaScript
                    Response.Write($"<script>alert('Error: {ex.Message.Replace("'", "\\'")}');</script>");
                }
            }
        }


        protected void PostJob_Click(object sender, EventArgs e)
        {

            try
            {
                string cid = Request.QueryString["cid"];
                string jobtitle = JobTitleTextBox.Text;
                string experience = ExperienceTextBox.Text;
                string salary = SalaryTextBox.Text;
                DateTime deadline = DateTime.Parse(DeadlineTextBox.Text).Date;
                DateTime publishdate = DateTime.Parse(PublishDateTextBox.Text).Date;
                int vacancy = int.Parse(VacancyTextBox.Text);
                string empstatus = EmploymentStatusDropDown.SelectedValue;
                string jd = JobDescriptionTextBox.Text;
                SqlConnection con = new SqlConnection(conStr);
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into joblist values('" + cid + "','" + jobtitle + "'," + vacancy + ",'" + experience + "','" + salary + "','" + publishdate + "','" + deadline + "','" + empstatus + "','" + jd + "')", con);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Job Posted Successfully!');</script>");
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ");</script>");
            }

        }


        protected void Logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("LandingPage.aspx");
        }


        protected void ViewJobLinkButton_Click(object sender, EventArgs e)
        {
            string cid = Request.QueryString["cid"];
            Response.Redirect($"ViewJob.aspx?cid={cid}");
        }


        protected void UpdateJobLink_Click(object sender, EventArgs e)
        {
            string cid = Request.QueryString["cid"];
            Response.Redirect($"UpdateJob.aspx?cid={cid}");
        }


        protected void DeleteJobButton_Click(object sender, EventArgs e)
        {
            string cid = Request.QueryString["cid"];
            Response.Redirect($"DeleteJob.aspx?cid={cid}");
        }
    }
}