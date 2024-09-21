using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobPortal
{
    
    public partial class CompanyDashboard : System.Web.UI.Page
    {
        
        string sarthak = "uid=sa; password=manager@123; database = JobPortal; server = DK27QV3\\SQLEXPRESS";

        protected void Page_Load(object sender, EventArgs e)
        {
            string cname = Request.QueryString["cname"];
            Label1.Text = cname;
           
        }

        protected void Openclick_Click(object sender, EventArgs e)
        {
          
            SqlConnection con = new SqlConnection(sarthak);
            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT * FROM company", con);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                CompanyNameTextBox.Text = dr["cname"].ToString();
                AddressTextBox.Text = dr["caddress"].ToString();
                CityTextBox.Text = dr["ccity"].ToString();
                EmailTextBox.Text = dr["cemail"].ToString();
            }


            con.Close();
        }

        protected void UpdateProfile_Click(object sender, EventArgs e)
        {
          
            using (SqlConnection con = new SqlConnection(sarthak))
            {
                try
                {
                    con.Open();

                    // Fetch the Company ID from query string
                    int cid = int.Parse(Request.QueryString["cid"]);

                    // Fetch form values
                    string cname = CompanyNameTextBox.Text;
                    string address = AddressTextBox.Text;
                    string city = CityTextBox.Text;
                    string email = EmailTextBox.Text;

                    // Use parameterized queries to prevent SQL Injection
                    string query = "UPDATE company SET cname = @cname, cemail = @cemail, caddress = @caddress, ccity = @ccity WHERE cid = @cid";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@cname", cname);
                        cmd.Parameters.AddWithValue("@cemail", email);
                        cmd.Parameters.AddWithValue("@caddress", address);
                        cmd.Parameters.AddWithValue("@ccity", city);
                        cmd.Parameters.AddWithValue("@cid", cid);

                        cmd.ExecuteNonQuery();
                    }

                    // Success message
                    Response.Write("<script>alert('Profile Updated Successfully!"+cname+"');</script>");
                }
                catch (Exception ex)
                {
                    // Show error message
                    Response.Write("<script>alert('" + ex.Message.Replace("'", "\\'") + "');</script>");
                }
                finally
                {
                    con.Close();
                }
            }
        }


        protected void ChangePassword_Click(object sender, EventArgs e)
        {
            string cid = Request.QueryString["cid"];
      

            using (SqlConnection con = new SqlConnection(sarthak))
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

        protected void postJob_Click(object sender, EventArgs e)
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
                SqlConnection con = new SqlConnection(sarthak);
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into joblist values('" + cid + "','" + jobtitle + "'," + vacancy + ",'" + experience + "','" + salary + "','" + publishdate + "','" + deadline + "','" + empstatus + "','" + jd + "')", con);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Job Posted Successfully!');</script>");
                con.Close();
            }
            catch (Exception ex) {
                Response.Write("<script>alert("+ex.Message+");</script>");
            }
            
        }
        protected void Logout_Click(object sender, EventArgs e) {
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