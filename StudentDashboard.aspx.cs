using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls;

namespace JobPortal
{
	public partial class StudentDashboard : System.Web.UI.Page
        protected void Page_Load(object sender, EventArgs e)
        protected void Page_Load(object sender, EventArgs e)

        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("JobListings.aspx");
        }

        protected void JobRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void SearchTextBox_TextChanged(object sender, EventArgs e)
        {

        }
        protected void SaveButton_Click(object sender, EventArgs e)
        {
        {

        protected void SaveProfileButton_Click(object sender, EventArgs e)
        {
            // Implement profile save functionality if needed
        }

        protected void ChangePasswordButton_Click(object sender, EventArgs e)
        {
            // Implement change password functionality if needed
        }

        protected void JobGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Handle the event when a job is selected if needed
        }
    }
}
