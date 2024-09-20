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
        
        protected void Page_Load(object sender, EventArgs e)
        {
            string sarthak = "uid=sa; password=manager@123; database = JobPortal; server = DK27QV3\\SQLEXPRESS";
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
            string cname = Request.QueryString["cname"];
            companyLabel.Text = cname;
        }

        protected void UpdateProfile_Click(object sender, EventArgs e)
        {
            string sarthak = "uid=sa; password=manager@123; database = JobPortal; server = DK27QV3\\SQLEXPRESS";
            SqlConnection con = new SqlConnection(sarthak);
            con.Open();
            try
            {
                string cid = Request.QueryString["cid"];
                string cname = CompanyNameTextBox.Text;
                string address = AddressTextBox.Text;
                string city = CityTextBox.Text;
                string email = EmailTextBox.Text;

                SqlCommand cmd = new SqlCommand("update company set cname = '" + cname + "', cemail = '" + email + "', caddress = '" + address + "', cemail = '" + email + "' where cid='" + cid + "'", con);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Profile Updated Successfully!');</script>");
            }
            catch(Exception ex) {
                Response.Write("<script>alert(" + ex.Message + ");</script>");
            }

            con.Close();
        }

        protected void ChangePassword_Click(object sender, EventArgs e)
        {
            string cid = Request.QueryString["cid"];
            string sarthak = "uid=sa; password=manager@123; database = JobPortal; server = DK27QV3\\SQLEXPRESS";
            SqlConnection con = new SqlConnection(sarthak);
            con.Open();
            try
            {
                string oldpass = OldPasswordTextBox.Text;
                string newpass = NewPasswordTextBox.Text;
                string cnfmpass = ConfirmPasswordTextBox.Text;
                SqlCommand cmd0 = new SqlCommand("select cpassword from company", con);
                SqlDataReader dr = cmd0.ExecuteReader();
                string opass=null;
                if (dr.Read()) {
                    opass = dr["cpassword"].ToString();

                }
                if (oldpass != opass)
                {
                    Response.Write("<script>alert('Old Password is not correct!');</script>");
                }
                if (newpass != cnfmpass)
                {
                    Response.Write("<script>alert('New Password and Confirm Password fields should match!');</script>");
                }
                SqlCommand cmd = new SqlCommand("update company set cpassword = '"+newpass+"' where cid = '"+cid+"'", con);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Password Changed Successfully!');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ");</script>");
            }
            con.Close();
        }
        protected void postJob_Click(object sender, EventArgs e)
        {

            try
            {
                string cid = Request.QueryString["cid"];
                
                string sarthak = "uid=sa; password=manager@123; database = JobPortal; server = DK27QV3\\SQLEXPRESS";
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
        
    }
}