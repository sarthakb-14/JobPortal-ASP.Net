using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobPortal
{
    public partial class CompanyDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UpdateProfile_Click(object sender, EventArgs e)
        {

        }

        protected void ChangePassword_Click(object sender, EventArgs e)
        {

        }
        protected void postJob_Click(object sender, EventArgs e)
        {
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
            SqlCommand cmd = new SqlCommand("insert into joblist values('"+jobtitle+"','"+experience+"','"+salary+"','"+deadline+"','"+publishdate+"',"+vacancy+",'"+empstatus+"','"+jd+"')", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}