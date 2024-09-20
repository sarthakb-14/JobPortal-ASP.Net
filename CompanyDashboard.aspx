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
            color: #ffffff4a;
            text-align: center;
            margin-bottom: 40px;
            text-transform: uppercase;
            letter-spacing: 2px;
            background: linear-gradient(90deg, rgb(255 87 0 / 0%) 0%, rgb(40 40 40 / 0%) 100%);
            -webkit-text-fill-color: #fff;
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
        #post-job-form {
            display: none;
            width: 50%; /* Takes up 70% of the screen width */
            margin: 0 auto; /* Centers the form horizontally */
            background-color: rgba(255, 255, 255, 0.15); /* Semi-transparent white background */
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
            backdrop-filter: blur(10px);
            position: relative; /* Ensures the form stays in its section */
            margin-top : 90px;
        }

        #post-job-form h2 {
            color: #fff; /* Makes the text color white */
        }
        .post-job-form label {
            color: white;
            font-weight: bold;
        }

        .post-job-form .form-control {
            background-color: rgba(255, 255, 255, 0.2);
            border-color: #007bff;
            color: #ffffff;
        }

        .post-job-form .btn-primary {
            width: 20%; /* Button spans the entire width */
            border-radius : 10px;
        }
        /* General form card styling */
        .form-card {
            display: none;
            width: 70%;
            margin: 0 auto;
            background-color: rgba(255, 255, 255, 0.15);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
            backdrop-filter: blur(10px);
            position: relative;
        }

        /* Update Profile Form */
        #update-profile-form {
            width: 50%;
            margin: 20px auto;
            background-color: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
        }

        /* Change Password Form */
        #change-password-form {
            width: 50%;
            margin: 20px auto;
            background-color: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
        }

        /* Form Heading */
        #update-profile-form h2, 
        #change-password-form h2 {
            text-align: center;
            color: white;
            margin-bottom: 20px;
        }

        /* Labels inside the forms */
        #update-profile-form label, 
        #change-password-form label {
            color: white;
            font-weight: bold;
            margin-top: 10px;
        }

        /* Input Fields for both forms */
        #update-profile-form .form-control,
        #change-password-form .form-control {
            background-color: rgba(255, 255, 255, 0.2);
            border: 1px solid #007bff;
            color: white;
            margin-bottom: 15px;
            border-radius: 5px;
        }

        /* Form buttons for both forms */
        #update-profile-form .btn-primary,
        #change-password-form .btn-primary {
            width: 100%;
            background-color: #007bff;
            border: none;
            padding: 10px;
            font-size: 16px;
            color: white;
            cursor: pointer;
            margin-top: 20px;
        }

        /* Form button hover effects */
        #update-profile-form .btn-primary:hover,
        #change-password-form .btn-primary:hover {
            background-color: #0056b3;
        }

        /* Update Profile Card Styling */
        #update-profile-card {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 15px;
            text-align: center;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            transition: all 0.3s ease;
        }

        /* Change Password Card Styling */
        #change-password-card {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 15px;
            text-align: center;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            transition: all 0.3s ease;
        }

        /* Hover Effect for Cards */
        #update-profile-card:hover, 
        #change-password-card:hover {
            background-color: rgba(0, 123, 255, 0.2);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.4);
        }

        /* Icons inside the cards */
        #update-profile-card i, 
        #change-password-card i {
            color: white;
            margin-bottom: 15px;
        }

        /* Card Headings */
        #update-profile-card h3, 
        #change-password-card h3 {
            color: white;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 0;
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

                <!-- Profile Picture and Label -->
                <li class="nav-item">
                    <a class="nav-link">
                        <i class="fas fa-user-circle fa-2x"></i> <!-- Profile Picture Icon -->
                        <asp:Label runat="server" ID="companyLabel">Company</asp:Label><!-- Label Text -->
                    </a>
                </li>
            </ul>
        </div>
    </nav>


    <!-- Page Title -->
    <h1>Company Dashboard</h1>

    <!-- Sections -->

    <!-- Post Job Section -->
    <div id="post-job-section" class="section">
        
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
                <asp:ListItem Text="Full-Time" Value="Full-Time"></asp:ListItem>
                <asp:ListItem Text="Part-Time" Value="Part-Time"></asp:ListItem>
                <asp:ListItem Text="Contract" Value="Contract"></asp:ListItem>
                <asp:ListItem Text="Internship" Value="Internship"></asp:ListItem>
                
            </asp:DropDownList>

            <!-- Job Description -->
            <label for="JobDescriptionTextBox">Job Description</label>
            <asp:TextBox ID="JobDescriptionTextBox" runat="server" CssClass="form-control" TextMode="MultiLine" Placeholder="Job Description"></asp:TextBox>

            <!-- Post Job Button -->
            <asp:Button ID="PostJobButton" runat="server" CssClass="btn btn-primary" Text="Post Job" OnClick="postJob_Click" />

        </div>
    </div>

    <!-- Manage Job Section -->
    <div id="manage-job-section" class="section">
    
    <div class="dashboard-card" id="manage-job-card" onclick="toggleManageJob()">
        <i class="fas fa-tasks fa-3x"></i>
        <h3>Manage Job</h3>
    </div>

    <!-- Manage Job Options (Initially Hidden) -->
    <div id="manage-job-options" style="display: none; margin-top: 20px;">
        <div class="row">
            <!-- View Job Card -->
            <div class="col-md-4" >
                <a href="ViewJob.aspx" style="text-decoration : none"><div class="dashboard-card" runat="server">
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
        
        <div class="dashboard-card">
            <i class="fas fa-file-alt fa-3x"></i>
            <h3>Applied Job Report</h3>
        </div>
    </div>

    <!-- Manage Account Section -->
        <div id="manage-account-section" class="section">
            <h2>Manage Account</h2>
            <div class="row">
                <!-- Update Profile Card and Form -->
                <div class="col-md-6">
                    <div class="dashboard-card" id="update-profile-card">
                        <i class="fas fa-user-edit fa-3x"></i>
                        <h3>Update Profile</h3>
                    </div>
                    <div id="update-profile-form" class="form-card">
                        <h2>Update Profile</h2>
                        <label for="CompanyNameTextBox">Company Name</label>
                        <asp:TextBox ID="CompanyNameTextBox" runat="server" CssClass="form-control" Placeholder="Company Name"></asp:TextBox>
                        <label for="AddressTextBox">Address</label>
                        <asp:TextBox ID="AddressTextBox" runat="server" CssClass="form-control" Placeholder="Address"></asp:TextBox>
                        <label for="CityTextBox">City</label>
                        <asp:TextBox ID="CityTextBox" runat="server" CssClass="form-control" Placeholder="City"></asp:TextBox>
                        <label for="EmailTextBox">Email</label>
                        <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control" Placeholder="Email"></asp:TextBox>
                        <asp:Button ID="UpdateProfileButton" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="UpdateProfile_Click"/>
                    </div>
                </div>

                <!-- Change Password Card and Form -->
                <div class="col-md-6">
                    <div class="dashboard-card" id="change-password-card">
                        <i class="fas fa-key fa-3x"></i>
                        <h3>Change Password</h3>
                    </div>
                    <div id="change-password-form" class="form-card">
                        <h2>Change Password</h2>
                        <label for="OldPasswordTextBox">Old Password</label>
                        <asp:TextBox ID="OldPasswordTextBox" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Old Password"></asp:TextBox>
                        <label for="NewPasswordTextBox">New Password</label>
                        <asp:TextBox ID="NewPasswordTextBox" runat="server" CssClass="form-control" TextMode="Password" Placeholder="New Password"></asp:TextBox>
                        <label for="ConfirmPasswordTextBox">Confirm Password</label>
                        <asp:TextBox ID="ConfirmPasswordTextBox" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Confirm Password">"Confirm Password"</asp:TextBox>
                        <asp:Button ID="ChangePasswordButton" runat="server" CssClass="btn btn-primary" Text="Change Password" OnClick="ChangePassword_Click"/>
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
            if (postJobForm.style.display === 'block') {
                postJobForm.style.display = 'none'; // Hide the form if it's visible
            } else {
                postJobForm.style.display = 'block'; // Show the form as a card
            }
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
        // Toggle Update Profile form
        document.getElementById('update-profile-card').onclick = function () {
            const form = document.getElementById('update-profile-form');
            form.style.display = form.style.display === 'block' ? 'none' : 'block';
        };

        // Toggle the Change Password form
        document.getElementById('change-password-card').onclick = function () {
            const form = document.getElementById('change-password-form');
            form.style.display = form.style.display === 'block' ? 'none' : 'block';
        };

       
       
    </script>
</body>
</html>

