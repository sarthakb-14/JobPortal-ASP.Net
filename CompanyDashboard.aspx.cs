using System;
using System.Configuration;
using System.Data.SqlClient;

namespace JobPortal
{

    public partial class CompanyDashboard : System.Web.UI.Page
    {
        

        private readonly string conStr = "uid=sa; password=manager@123; database = JobPortal; server = DK27QV3\\SQLEXPRESS";

        


        protected void Page_Load(object sender, EventArgs e)
        {
            
            string cname = Session["UserName"].ToString();

            if (!IsPostBack && !string.IsNullOrEmpty(cname))
            {
                
                Label1.Text = cname;
                LoadCompanyDetails();
            }
        }

        private void LoadCompanyDetails()
        {
            string connectionString = conStr;
            string query = "SELECT cname, cemail, caddress, ccity FROM company WHERE cid = @CompanyID"; // Assuming you have a CompanyID

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CompanyID", Session["UserID"].ToString()); // Get the logged-in company ID from the session
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        CompanyNameTextBox.Text = reader["cname"].ToString();
                        CompanyEmailTextBox.Text = reader["cemail"].ToString();
                        CompanyAddressTextBox.Text = reader["caddress"].ToString();
                        CompanyCityTextBox.Text = reader["ccity"].ToString();
                    }
                }

                con.Close();
            }
        }

        // Update the company details in the database
        protected void UpdateProfileButton_Click(object sender, EventArgs e)
        {
            string connectionString = conStr;
            string updateQuery = "UPDATE Company SET cname = @CompanyName, cemail = @CompanyEmail, caddress = @CompanyAddress, ccity = @CompanyCity WHERE cid = @CompanyID";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(updateQuery, con);
                cmd.Parameters.AddWithValue("@CompanyID", Session["UserID"].ToString());
                cmd.Parameters.AddWithValue("@CompanyName", CompanyNameTextBox.Text);
                cmd.Parameters.AddWithValue("@CompanyEmail", CompanyEmailTextBox.Text);
                cmd.Parameters.AddWithValue("@CompanyAddress", CompanyAddressTextBox.Text);
                cmd.Parameters.AddWithValue("@CompanyCity", CompanyCityTextBox.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            // Optionally, add a success message or redirect the user
            ClientScript.RegisterStartupScript(this.GetType(), "alert",
            "alert('Profile updated successfully! You have to login again for security purposes'); window.location='JobPortalLogin.aspx';", true);
        }
    


    protected void ChangePassword_Click(object sender, EventArgs e)
        {
            string cid = Session["UserID"].ToString();
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
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('Password changed successfully! You have to login again for security purposes'); window.location='JobPortalLogin.aspx';", true);
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
                string cid = Session["UserID"].ToString();
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
            
            Response.Redirect("ViewJob.aspx");
        }


        protected void UpdateJobLink_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("UpdateJob.aspx");
        }


        protected void DeleteJobButton_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("DeleteJob.aspx");
        }

        protected void RedirectToAppliedJobReport_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("AppliedJobReport.aspx");
        }
    }
}