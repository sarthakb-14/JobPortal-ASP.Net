<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyDashboard.aspx.cs" Inherits="JobPortal.CompanyDashboard" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COMPANY DASHBOARD</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="StyleSheet/CompanyDashboard.css" />
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #0B1C32; 
            color: #EAEFF2; 
            overflow-x: hidden;
            animation: slideInFromLeft 1s ease-out;
        }

        @keyframes slideInFromLeft {
            0% { transform: translateX(-100%); opacity: 0; }
            100% { transform: translateX(0); opacity: 1; }
        }

        .navbar {
            margin-bottom: 20px;
            background-color: #0F2A48; 
            border-radius: 10px;
            animation: fadeIn 1s ease-in-out;
        }

        h1 {
            font-size: 2.5rem;
            font-weight: 700;
            color: #FFFFFF;
            text-align: center;
            margin-bottom: 40px;
            text-transform: uppercase;
            letter-spacing: 2px;
            animation: fadeIn 1.5s ease-in-out;
        }

        .dashboard-card {
            background-color: #1D3557;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.25);
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            animation: fadeInUp 0.7s ease-in-out;
        }

        .dashboard-card:hover {
            background-color: #457B9D;
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        }

        .dashboard-card i {
            transition: transform 0.3s ease;
            color: #A8DADC;
        }

        .dashboard-card:hover i {
            transform: rotate(360deg);
        }

        .dashboard-card h3 {
            color: #F1FAEE;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 0;
        }

        .form-card {
            display: none;
            margin-top: 20px;
            max-width: 600px;
            margin: 20px auto;
            background-color: #1D3557;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
            animation: fadeInUp 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        option { color: black; }
        .text-danger { display: block; margin-top: 5px; }

        .form-card {
            max-height: 0;
            overflow: hidden;
            opacity: 0;
            transition: max-height 0.5s ease-out, opacity 0.5s ease-out;
        }

        #post-job-form {
            max-height: 0;
            opacity: 0;
            overflow: hidden;
            transition: max-height 0.5s ease, opacity 0.5s ease;
        }

        #post-job-form[style*="block"] {
            max-height: 1000px;
            opacity: 1;
        }

        .form-card:target, .form-card[style*="block"] {
            max-height: 1000px;
            opacity: 1;
        }

        @media (max-width: 768px) {
            h1 { font-size: 2rem; }
            .dashboard-card { padding: 20px; }
            .dashboard-card h3 { font-size: 1.2rem; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="nav-link">
                <i class="fas fa-user-circle fa-2x"></i>
                <asp:Label runat="server" ID="Label1">Company</asp:Label>
            </a>
            <div class="collapse navbar-collapse justify-content-center">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="#post-job-section">Post Job</a></li>
                    <li class="nav-item"><a class="nav-link" href="#manage-job-section">Manage Job</a></li>
                    <li class="nav-item"><a class="nav-link" href="#applied-job-report-section">Applied Job Report</a></li>
                    <li class="nav-item"><a class="nav-link" href="#manage-account-section">Manage Account</a></li>
                </ul>
            </div>
            <asp:Button ID="LogoutButton" runat="server" CssClass="btn btn-danger" Text="Logout" OnClick="Logout_Click" CausesValidation="false" />
        </nav>

        <h1>Company Dashboard</h1>

        <!-- Post Job Section -->
        <div id="post-job-section" class="section">
            <div class="dashboard-card" id="post-job-card" onclick="loadCard()">
                <i class="fas fa-briefcase fa-3x"></i>
                <h3>Post Job</h3>
            </div>
            <div id="post-job-form" class="post-job-form">
                <label for="JobTitleTextBox">Job Title</label>
                <asp:TextBox ID="JobTitleTextBox" runat="server" CssClass="form-control" Placeholder="Job Title"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvJobTitle" runat="server" ControlToValidate="JobTitleTextBox" ErrorMessage="Job Title is required" CssClass="text-danger" Display="Dynamic" />
                <br />
                <label for="ExperienceTextBox">Experience Required</label>
                <asp:TextBox ID="ExperienceTextBox" runat="server" CssClass="form-control" Placeholder="Experience Required"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvExperience" runat="server" ControlToValidate="ExperienceTextBox" ErrorMessage="Experience is required" CssClass="text-danger" Display="Dynamic" />
                <br />
                <label for="SalaryTextBox">Salary</label>
                <asp:TextBox ID="SalaryTextBox" runat="server" CssClass="form-control" Placeholder="Salary (Range)"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvSalary" runat="server" ControlToValidate="SalaryTextBox" ErrorMessage="Salary is required" CssClass="text-danger" Display="Dynamic" />
                <br />
                <label for="DeadlineTextBox">Deadline</label>
                <asp:TextBox ID="DeadlineTextBox" runat="server" CssClass="form-control" TextMode="Date" Placeholder="Deadline"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDeadline" runat="server" ControlToValidate="DeadlineTextBox" ErrorMessage="Deadline is required" CssClass="text-danger" Display="Dynamic" />
                <br />
                <label for="PublishDateTextBox">Publish Date</label>
                <asp:TextBox ID="PublishDateTextBox" runat="server" CssClass="form-control" TextMode="Date" Placeholder="Publish Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPublishDate" runat="server" ControlToValidate="PublishDateTextBox" ErrorMessage="Publish Date is required" CssClass="text-danger" Display="Dynamic" />
                <br />
                <label for="VacancyTextBox">Vacancy</label>
                <asp:TextBox ID="VacancyTextBox" runat="server" CssClass="form-control" TextMode="Number" Placeholder="Vacancy"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvVacancy" runat="server" ControlToValidate="VacancyTextBox" ErrorMessage="Vacancy is required" CssClass="text-danger" Display="Dynamic" />
                <br />
                <asp:Button ID="PostJobButton" runat="server" CssClass="btn btn-primary" Text="Post Job" OnClick="PostJob_Click" />
            </div>
        </div>

        <!-- Manage Job Section -->
        <div id="manage-job-section" class="section">
            <asp:LinkButton ID="ViewJobLinkButton" runat="server" OnClick="ViewJobLinkButton_Click" CssClass="dashboard-card" CausesValidation="false">
                <i class="fas fa-eye fa-3x"></i>
                <h3>View Job</h3>
            </asp:LinkButton>
            <asp:LinkButton ID="UpdateJobLinkButton" runat="server" OnClick="UpdateJobLinkButton_Click" CssClass="dashboard-card" CausesValidation="false">
                <i class="fas fa-pen fa-3x"></i>
                <h3>Update Job</h3>
            </asp:LinkButton>
            <asp:LinkButton ID="DeleteJobLinkButton" runat="server" OnClick="DeleteJobLinkButton_Click" CssClass="dashboard-card" CausesValidation="false">
                <i class="fas fa-trash fa-3x"></i>
                <h3>Delete Job</h3>
            </asp:LinkButton>
        </div>

        <!-- Applied Job Report Section -->
        <div id="applied-job-report-section" class="section">
            <asp:Button ID="ViewAppliedJobReportButton" runat="server" CssClass="dashboard-card" Text="View Applied Job Report" CausesValidation="false" OnClick="ViewAppliedJobReportButton_Click" />
        </div>

        <!-- Manage Account Section -->
        <div id="manage-account-section" class="section">
            <asp:Button ID="UpdateProfileButton" runat="server" CssClass="btn btn-primary" Text="Update Profile" CausesValidation="false" OnClick="UpdateProfileButton_Click" />
        </div>
    </form>

    <script>
        function loadCard() {
            const form = document.getElementById('post-job-form');
            form.style.display = (form.style.display === 'block') ? 'none' : 'block';
        }
    </script>
</body>
</html>
