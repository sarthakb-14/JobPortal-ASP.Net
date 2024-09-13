using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobPortal
{
    public partial class JobListings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "120";
        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("LandingPage.aspx");
        }
        protected void btnJobs_Click(object sender, EventArgs e)
        {

        }
    }
}