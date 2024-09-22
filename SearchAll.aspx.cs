using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobPortal
{
    public partial class SearchAll : System.Web.UI.Page
    {
        private string connectionString = "uid=sa; password=manager@123; database=JobPortal; server=C927QV3\\SQLEXPRESS";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initially, clear search columns dropdown
                ddlSearchColumn.Items.Clear();
            }
        }

        protected void ddlEntity_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedEntity = ddlEntity.SelectedValue;

            // Populate the search column dropdown based on selected entity
            ddlSearchColumn.Items.Clear();

            switch (selectedEntity)
            {
                case "student":
                    ddlSearchColumn.Items.Add(new ListItem("Student Name", "sname"));
                    ddlSearchColumn.Items.Add(new ListItem("Email", "semail"));
                    ddlSearchColumn.Items.Add(new ListItem("Username", "susername"));
                    ddlSearchColumn.Items.Add(new ListItem("Gender", "sgender"));
                    ddlSearchColumn.Items.Add(new ListItem("Contact Number", "scontactno"));
                    break;
                case "joblist":
                    ddlSearchColumn.Items.Add(new ListItem("Job Title", "jobtitle"));
                    ddlSearchColumn.Items.Add(new ListItem("Experience", "jobexperience"));
                    ddlSearchColumn.Items.Add(new ListItem("Employment Status", "jobemployeementstatus"));
                    break;
                case "company":
                    ddlSearchColumn.Items.Add(new ListItem("Company Name", "cname"));
                    ddlSearchColumn.Items.Add(new ListItem("Email", "cemail"));
                    ddlSearchColumn.Items.Add(new ListItem("Username", "cusername"));
                    break;
                case "admin":
                    ddlSearchColumn.Items.Add(new ListItem("Admin Name", "aname"));
                    ddlSearchColumn.Items.Add(new ListItem("Email", "aemail"));
                    ddlSearchColumn.Items.Add(new ListItem("Username", "ausername"));
                    break;
                case "applyjob":
                    ddlSearchColumn.Items.Add(new ListItem("Student Name", "sname"));
                    ddlSearchColumn.Items.Add(new ListItem("Company Name", "cname"));
                    break;
                default:
                    break;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchQuery = txtSearch.Text.Trim();
            string selectedEntity = ddlEntity.SelectedValue;
            string selectedColumn = ddlSearchColumn.SelectedValue;

            if (!string.IsNullOrEmpty(selectedEntity) && !string.IsNullOrEmpty(selectedColumn))
            {
                LoadData(selectedEntity, searchQuery, selectedColumn);
            }
        }

        private void LoadData(string entity, string searchQuery, string searchColumn)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string query = "";
                if (entity == "student")
                {
                    query = $@"SELECT sname as 'Student Name', semail as 'Email Id', susername as 'Username', sgender as 'Gender', scontactno as 'Contact Number'
                               FROM student WHERE {searchColumn} LIKE '%' + @SearchQuery + '%'";
                }
                else if (entity == "joblist")
                {
                    query = $@"SELECT jobtitle as 'Job Title', jobexperience as 'Experience Required', jobsalary as 'Salary Offer', jobemployeementstatus as 'Type of Employeement'
                               FROM joblist WHERE {searchColumn} LIKE '%' + @SearchQuery + '%'";
                }
                else if (entity == "company")
                {
                    query = $@"SELECT cname as 'Company Name', cemail as 'Email Id', cusername as 'Username', ccity as 'City', ccontactno as 'Contact Number'
                               FROM company WHERE {searchColumn} LIKE '%' + @SearchQuery + '%'";
                }
                else if (entity == "admin")
                {
                    query = $@"SELECT aname as 'Admin Name', aemail as 'Email ID', ausername as 'Username'
                               FROM admin WHERE {searchColumn} LIKE '%' + @SearchQuery + '%'";
                }
                else if (entity == "applyjob")
                {
                    query = @"SELECT s.sname as 'Applicants', c.cname as 'Companies'
                              FROM applyjob aj
                              JOIN student s ON aj.sid = s.sid
                              JOIN company c ON aj.cid = c.cid
                              WHERE " + searchColumn + " LIKE '%' + @SearchQuery + '%'";
                }

                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                adapter.SelectCommand.Parameters.AddWithValue("@SearchQuery", searchQuery);

                DataTable dt = new DataTable();
                adapter.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            btnSearch_Click(sender, e); // Retain search query when changing pages
        }
    }
}
