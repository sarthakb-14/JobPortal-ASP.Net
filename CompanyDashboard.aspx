<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyDashboard.aspx.cs" Inherits="JobPortal.CompanyDashboard" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COMPANY DASHBOARD</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('images/bg_dashboard.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #ffffff;
        }

        .navbar {
            margin-bottom: 20px;
        }

        h1 {
            font-size: 3rem;
            font-weight: bold;
            color: #ffffff;
            text-align: center;
            margin-bottom: 40px;
            text-transform: uppercase;
            letter-spacing: 2px;
            background: linear-gradient(90deg, rgba(0,123,255,1) 0%, rgba(0,212,255,1) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            padding: 20px 0;
        }

        .section {
            padding: 50px;
            text-align: center;
        }

        .dashboard-card {
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .dashboard-card:hover {
            background-color: rgba(0, 123, 255, 0.1);
        }

        .post-job-form {
            display: none;
            margin-top: 20px;
        }

        .form-control {
            margin-bottom: 15px;
            background-color: rgba(255, 255, 255, 0.1);
            border: 1px solid #007bff;
            color: white;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Dashboard</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#post-job-section">Post Job</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#manage-job-section">Manage Job</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#applied-job-report-section">Applied Job Report</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#manage-account-section">Manage Account</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Page Title -->
    <h1>Company Dashboard</h1>

    <!-- Sections -->

    <!-- Post Job Section -->
    <div id="post-job-section" class="section">
        <h2>Post Job</h2>
        <div class="dashboard-card" id="post-job-card" onclick="loadCard()">
            <i class="fas fa-briefcase fa-3x"></i>
            <h3>Post Job</h3>
        </div>

        <div id="post-job-form" class="post-job-form">
            <!-- Job Title -->
            <label for="JobTitleTextBox">Job Title</label>
            <asp:TextBox ID="JobTitleTextBox" runat="server" CssClass="form-control" Placeholder="Job Title"></asp:TextBox>

            <!-- Experience Required -->
            <label for="ExperienceTextBox">Experience Required</label>
            <asp:TextBox ID="ExperienceTextBox" runat="server" CssClass="form-control" Placeholder="Experience Required"></asp:TextBox>

            <!-- Salary (Range) -->
            <label for="SalaryTextBox">Salary</label>
            <asp:TextBox ID="SalaryTextBox" runat="server" CssClass="form-control" Placeholder="Salary (Range)"></asp:TextBox>

            <!-- Deadline -->
            <label for="DeadlineTextBox">Deadline</label>
            <asp:TextBox ID="DeadlineTextBox" runat="server" CssClass="form-control" TextMode="Date" Placeholder="Deadline"></asp:TextBox>

            <!-- Publish Date -->
            <label for="PublishDateTextBox">Publish Date</label>
            <asp:TextBox ID="PublishDateTextBox" runat="server" CssClass="form-control" TextMode="Date" Placeholder="Publish Date"></asp:TextBox>

            <!-- Vacancy -->
            <label for="VacancyTextBox">Vacancy</label>
            <asp:TextBox ID="VacancyTextBox" runat="server" CssClass="form-control" TextMode="Number" Placeholder="Vacancy"></asp:TextBox>

            <!-- Employment Status -->
            <label for="EmploymentStatusDropDown">Employment Status</label>
            <asp:DropDownList ID="EmploymentStatusDropDown" runat="server" CssClass="form-control">
                <asp:ListItem Text="Fulltime" Value="fulltime"></asp:ListItem>
                <asp:ListItem Text="Part-time" Value="parttime"></asp:ListItem>
                <asp:ListItem Text="Internship" Value="internship"></asp:ListItem>
                <asp:ListItem Text="Freelancer" Value="freelancer"></asp:ListItem>
            </asp:DropDownList>

            <!-- Job Description -->
            <label for="JobDescriptionTextBox">Job Description</label>
            <asp:TextBox ID="JobDescriptionTextBox" runat="server" CssClass="form-control" TextMode="MultiLine" Placeholder="Job Description"></asp:TextBox>

            <!-- Post Job Button -->
            <asp:Button ID="PostJobButton" runat="server" CssClass="btn btn-primary" Text="Post Job" />

        </div>
    </div>

    <!-- Manage Job Section -->
    <div id="manage-job-section" class="section">
    <h2>Manage Job</h2>
    <div class="dashboard-card" id="manage-job-card" onclick="toggleManageJob()">
        <i class="fas fa-tasks fa-3x"></i>
        <h3>Manage Job</h3>
    </div>

    <!-- Manage Job Options (Initially Hidden) -->
    <div id="manage-job-options" style="display: none; margin-top: 20px;">
        <div class="row">
            <!-- View Job Card -->
            <div class="col-md-4" >
                <a href="ViewJob.aspx" style="text-decoration : none"><div class="dashboard-card" onserverclick="ViewJobCard_Click" runat="server">
    <i class="fas fa-eye fa-3x"></i>
    <h3>View Job</h3>
    
</div></a>
                
            </div>

            <!-- Update Job Card -->
            
            <div class="col-md-4">
                <a style="text-decoration : none" href="UpdateJob.aspx">
                    <div class="dashboard-card">
                    <i class="fas fa-edit fa-3x"></i>
                    <h3>Update Job</h3>
    
                </div>
                </a>
                
            </div>

            <!-- Delete Job Card -->
            <div class="col-md-4">
                <a style ="text-decoration : none" href="DeleteJob.aspx">
                    <div class="dashboard-card">
    <i class="fas fa-trash fa-3x"></i>
    <h3>Delete Job</h3>
    
</div>
                </a>
                
            </div>
        </div>
    </div>
</div>

    <!-- Applied Job Report Section -->
    <div id="applied-job-report-section" class="section">
        <h2>Applied Job Report</h2>
        <div class="dashboard-card">
            <i class="fas fa-file-alt fa-3x"></i>
            <h3>Applied Job Report</h3>
        </div>
    </div>

    <!-- Manage Account Section -->
    <div id="manage-account-section" class="section">
    <h2>Manage Account</h2>
    <div class="dashboard-card" id="manage-account-card" onclick="toggleManageAccount()">
        <i class="fas fa-user-cog fa-3x"></i>
        <h3>Manage Account</h3>
    </div>

    <!-- Manage Account Options (Initially Hidden) -->
    <div id="manage-account-options" style="display: none; margin-top: 20px;">
        <div class="row">
            <!-- Update Profile Card -->
            <div class="col-md-6">
                <div class="dashboard-card" onclick="toggleForm('update-profile-form')">
                    <i class="fas fa-user-edit fa-3x"></i>
                    <h3>Update Profile</h3>
                </div>

                <!-- Update Profile Form (Hidden initially) -->
                <div id="update-profile-form" class="form-section" style="display: none;">
                    <label for="CompanyNameTextBox">Company Name</label>
                    <asp:TextBox ID="CompanyNameTextBox" runat="server" CssClass="form-control" Placeholder="Company Name"></asp:TextBox>

                    <label for="AddressTextBox">Address</label>
                    <asp:TextBox ID="AddressTextBox" runat="server" CssClass="form-control" Placeholder="Address"></asp:TextBox>

                    <label for="CityTextBox">City</label>
                    <asp:TextBox ID="CityTextBox" runat="server" CssClass="form-control" Placeholder="City"></asp:TextBox>

                    <label for="EmailTextBox">Email</label>
                    <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control" Placeholder="Email"></asp:TextBox>

                    <label for="WebsiteTextBox">Website</label>
                    <asp:TextBox ID="WebsiteTextBox" runat="server" CssClass="form-control" Placeholder="Website"></asp:TextBox>

                    <label for="ContactNumberTextBox">Contact Number</label>
                    <asp:TextBox ID="ContactNumberTextBox" runat="server" CssClass="form-control" Placeholder="Contact Number"></asp:TextBox>

                    <!-- Update Button -->
                    <asp:Button ID="UpdateProfileButton" runat="server" CssClass="btn btn-primary" Text="Update" />
                </div>
            </div>

            <!-- Change Password Card -->
            <div class="col-md-6">
                <div class="dashboard-card" onclick="toggleForm('change-password-form')">
                    <i class="fas fa-key fa-3x"></i>
                    <h3>Change Password</h3>
                </div>

                <!-- Change Password Form (Hidden initially) -->
                <div id="change-password-form" class="form-section" style="display: none;">
                    <label for="OldPasswordTextBox">Old Password</label>
                    <asp:TextBox ID="OldPasswordTextBox" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Old Password"></asp:TextBox>

                    <label for="NewPasswordTextBox">New Password</label>
                    <asp:TextBox ID="NewPasswordTextBox" runat="server" CssClass="form-control" TextMode="Password" Placeholder="New Password"></asp:TextBox>

                    <label for="ConfirmPasswordTextBox">Confirm Password</label>
                    <asp:TextBox ID="ConfirmPasswordTextBox" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Confirm Password"></asp:TextBox>

                    <!-- Change Password Button -->
                    <asp:Button ID="ChangePasswordButton" runat="server" CssClass="btn btn-primary" Text="Change Password" />
                </div>
            </div>
        </div>
    </div>
</div>
    </form>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Toggle the Post Job form
        function loadCard() {
            const postJobForm = document.getElementById('post-job-form');
            postJobForm.style.display = postJobForm.style.display === 'block' ? 'none' : 'block';
        }

        // Toggle Manage Job options
        function toggleManageJob() {
            const manageJobOptions = document.getElementById('manage-job-options');
            manageJobOptions.style.display = manageJobOptions.style.display === 'block' ? 'none' : 'block';
        }

        function toggleManageAccount() {
            const manageAccountOptions = document.getElementById('manage-account-options');
            manageAccountOptions.style.display = manageAccountOptions.style.display === 'block' ? 'none' : 'block';
        }
        function toggleForm(formId) {
            const form = document.getElementById(formId);
            form.style.display = form.style.display === 'block' ? 'none' : 'block';
        }
       
       
    </script>
</body>
</html>

