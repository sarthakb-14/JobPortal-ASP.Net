using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobPortal
{
    public partial class DeleteJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            string sarthak = "uid=sa; password=manager@123; database = JobPortal; server = DK27QV3\\SQLEXPRESS";
            int jobid = int.Parse(JobIDTextBox.Text);
            string jobtitle = JobTitleTextBox.Text;
            SqlConnection con = new SqlConnection(sarthak);
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from joblist where jobid= "+jobid+" or jobtitle = '"+jobtitle+"'", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}