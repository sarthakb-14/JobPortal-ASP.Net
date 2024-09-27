<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyDashboard.aspx.cs" Inherits="JobPortal.CompanyDashboard" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COMPANY DASHBOARD</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
   
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
            0% {
                transform: translateX(-100%);
                opacity: 0;
            }
            100% {
                transform: translateX(0);
                opacity: 1;
            }
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
            position: relative;
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

        .form-card label {
            color: #F1FAEE;
            font-weight: bold;
        }

        .form-card .form-control {
            background-color: rgba(255, 255, 255, 0.1);
            border-color: #A8DADC;
            color: white;
            margin-bottom: 15px;
            border-radius: 5px;
        }

        .form-card .btn-primary {
            width: 100%;
            background-color: #E63946; 
            border: none;
            padding: 10px;
            font-size: 16px;
            color: white;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }

        .form-card .btn-primary:hover {
            background-color: #B22130;
        }

       
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 768px) {
            h1 {
                font-size: 2rem;
            }
            
            .dashboard-card {
                padding: 20px;
            }

            .dashboard-card h3 {
                font-size: 1.2rem;
            }
        }
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

        option {
            color: black;
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
            <asp:Button ID="LogoutButton" runat="server" CssClass="btn btn-danger" Text="Logout" OnClick="Logout_Click" />
        </nav>

        <h1>Company Dashboard</h1>
        <div id="post-job-section" class="section">
            <div class="dashboard-card" id="post-job-card" onclick="loadCard()">
                <i class="fas fa-briefcase fa-3x"></i>
                <h3>Post Job</h3>
            </div>
            <div id="post-job-form" class="post-job-form">
                <label for="JobTitleTextBox">Job Title</label>
                <asp:TextBox ID="JobTitleTextBox" runat="server" CssClass="form-control" Placeholder="Job Title"></asp:TextBox>
                <label for="ExperienceTextBox">Experience Required</label>
                <asp:TextBox ID="ExperienceTextBox" runat="server" CssClass="form-control" Placeholder="Experience Required"></asp:TextBox>
                <label for="SalaryTextBox">Salary</label>
                <asp:TextBox ID="SalaryTextBox" runat="server" CssClass="form-control" Placeholder="Salary (Range)"></asp:TextBox>
                <label for="DeadlineTextBox">Deadline</label>
                <asp:TextBox ID="DeadlineTextBox" runat="server" CssClass="form-control" TextMode="Date" Placeholder="Deadline"></asp:TextBox>
                <label for="PublishDateTextBox">Publish Date</label>
                <asp:TextBox ID="PublishDateTextBox" runat="server" CssClass="form-control" TextMode="Date" Placeholder="Publish Date"></asp:TextBox>
                <label for="VacancyTextBox">Vacancy</label>
                <asp:TextBox ID="VacancyTextBox" runat="server" CssClass="form-control" TextMode="Number" Placeholder="Vacancy"></asp:TextBox>
                <label for="EmploymentStatusDropDown">Employment Status</label>
                <asp:DropDownList ID="EmploymentStatusDropDown" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Full Time" Value="Full Time"></asp:ListItem>
                    <asp:ListItem Text="Part Time" Value="Part Time"></asp:ListItem>
                    <asp:ListItem Text="Freelancer" Value="Freelancer"></asp:ListItem>
                    <asp:ListItem Text="Internship" Value="Internship"></asp:ListItem>
                </asp:DropDownList>
                <label for="JobDescriptionTextBox">Job Description</label>
                <asp:TextBox ID="JobDescriptionTextBox" runat="server" CssClass="form-control" TextMode="MultiLine" Placeholder="Job Description"></asp:TextBox>
                <asp:Button ID="PostJobButton" runat="server" CssClass="btn btn-primary" Text="Post Job" OnClick="PostJob_Click" />
            </div>
        </div>

        <!-- Manage Job Section -->
        <div id="manage-job-section" class="section">
            <div class="dashboard-card" id="manage-job-card" onclick="toggleManageJob()">
                <i class="fas fa-tasks fa-3x"></i>
                <h3>Manage Job</h3>
            </div>
            <div id="manage-job-options" style="display: none; margin-top: 20px;">
                <div class="row">
                    <div class="col-md-4">
                        <asp:LinkButton ID="ViewJobLinkButton" runat="server" OnClick="ViewJobLinkButton_Click" CssClass="dashboard-card" style="cursor: pointer; text-decoration:none">
                            <i class="fas fa-eye fa-3x"></i>
                            <h3>View Job</h3>
                        </asp:LinkButton>
                    </div>
                    <div class="col-md-4">
                        <asp:LinkButton ID="UpdateJobLink" runat="server" OnClick="UpdateJobLink_Click" CssClass="dashboard-card" style="cursor: pointer; text-decoration:none">
                            <i class="fas fa-edit fa-3x"></i>
                            <h3>Update Job</h3>
                        </asp:LinkButton>
                    </div>
                    <div class="col-md-4">
                        <asp:LinkButton ID="DeleteJobButton" runat="server" CssClass="dashboard-card" OnClick="DeleteJobButton_Click" style="cursor: pointer; text-decoration:none">
                            <i class="fas fa-trash fa-3x"></i>
                            <h3>Delete Job</h3>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>

        <div id="applied-job-report-section" class="section">
            <asp:LinkButton ID="btnRedirectToAppliedJobReport" runat="server" CssClass="dashboard-card" OnClick="RedirectToAppliedJobReport_Click" style="text-decoration:none">
                <i class="fas fa-file-alt fa-3x"></i>
                <h3>Applied Job Report</h3>
            </asp:LinkButton>
        </div>



        <div id="manage-account-section" class="section">
            <h2>Manage Account</h2>
            <div class="row">
                
                <div class="col-md-6">
                    <div class="dashboard-card" id="update-profile-card">
                        <i class="fas fa-user-edit fa-3x"></i>
                        <h3>Update Profile</h3>
                    </div>
                    <div id="update-profile-form" class="form-card">
                        <h2>Update Profile</h2>
                        <label for="CompanyNameTextBox">Company Name</label>
                        <asp:TextBox ID="CompanyNameTextBox" runat="server" CssClass="form-control" Placeholder="Company Name"></asp:TextBox>
        
                        <label for="CompanyEmailTextBox">Company Email</label>
                        <asp:TextBox ID="CompanyEmailTextBox" runat="server" CssClass="form-control" Placeholder="Company Email"></asp:TextBox>
        
                        <label for="CompanyAddressTextBox">Company Address</label>
                        <asp:TextBox ID="CompanyAddressTextBox" runat="server" CssClass="form-control" Placeholder="Company Address"></asp:TextBox>
        
                        <label for="CompanyCityTextBox">Company City</label>
                        <asp:TextBox ID="CompanyCityTextBox" runat="server" CssClass="form-control" Placeholder="Company City"></asp:TextBox>
        
                        <asp:Button ID="UpdateProfileButton" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="UpdateProfileButton_Click" />
                    </div>
                </div>

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
                        <asp:TextBox ID="ConfirmPasswordTextBox" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Confirm Password"></asp:TextBox>
                        <asp:Button ID="ChangePasswordButton" runat="server" CssClass="btn btn-primary" Text="Change Password" OnClick="ChangePassword_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        
        function loadCard() {
            const postJobForm = document.getElementById('post-job-form');
            postJobForm.style.display = postJobForm.style.display === 'block' ? 'none' : 'block';
        }

       
        function toggleManageJob() {
            const manageJobOptions = document.getElementById('manage-job-options');
            manageJobOptions.style.display = manageJobOptions.style.display === 'block' ? 'none' : 'block';
        }

        
        document.getElementById('update-profile-card').onclick = function () {
            const form = document.getElementById('update-profile-form');
            form.style.display = form.style.display === 'block' ? 'none' : 'block';
        };
        

      
        document.getElementById('change-password-card').onclick = function () {
            const form = document.getElementById('change-password-form');
            form.style.display = form.style.display === 'block' ? 'none' : 'block';
        };

        
        function toggleForm(formId) {
            const form = document.getElementById(formId);
            form.classList.toggle('show');
        }

        //function toggleManageJob() {
        //    const manageJobOptions = document.getElementById('manage-job-options');
        //    manageJobOptions.classList.toggle('show');
        //}
    </script>
</body>
</html>


