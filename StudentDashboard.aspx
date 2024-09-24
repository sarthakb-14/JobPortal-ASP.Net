<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="JobPortal.StudentDashboard" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Dashboard - Job Portal</title>
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<!-- FontAwesome Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
<link rel="stylesheet" href="StyleSheet/StudentDashboard.css"/>
</head>
<body>
<form id="form1" class="m-0" runat="server" enctype="multipart/form-data">
<header>
<div class="container">
<h1>Student Dashboard</h1>
<nav>
<ul>
<li><a href="LandingPage.aspx">Home</a></li>
<li><a href="#" onclick="loadManageProfile()">Edit Profile</a></li>
</ul>
</nav>
</div>
</header>
 
        <main class="container">
 
            <!-- Job Search Section -->
<div id="job-search">
<div class="card search-card text-center" onclick="redirectToJobList()">
<div class="card-body">
<i class="fas fa-search fa-3x"></i> <!-- FontAwesome Search Icon -->
<h5 class="card-title mt-3">Search</h5>
<h6 class="card-body p-0">Dream Job, Company Details, Job Posting and Vaccancies</h6>
</div>
</div>
</div>
 
 
            <!-- Apply Job Section -->
<section id="applied-job">
<asp:GridView ID="JobGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" GridLines="None">
<Columns>
<asp:BoundField DataField="JobTitle" HeaderText="Job Title" />
<asp:BoundField DataField="CompanyName" HeaderText="Company Name" />
<asp:BoundField DataField="Location" HeaderText="Location" />
<asp:TemplateField HeaderText="Actions">
<ItemTemplate>
<asp:Button ID="ApplyButton" runat="server" Text="Delete" CssClass="btn btn-primary" CommandName="Delete" CommandArgument='<%# Eval("JobId") %>' />
</ItemTemplate>
</asp:TemplateField>
</Columns>
</asp:GridView>
</section>
 
 
            <!-- Manage Profile Section -->
<section id="manage-profile" style="display:none;">
<h2>Edit Profile</h2>
<div class="profile-container w-50 mx-auto">
<div class="form-group d-flex align-items-center">
<label for="EnrollmentTextBox" class="form-label me-2" style="width: 200px;">Enrollment Number</label>
<asp:TextBox ID="EnrollmentTextBox" runat="server" CssClass="form-control" Placeholder="Enrollment Number"></asp:TextBox>
</div>
<div class="form-group d-flex align-items-center">
<label for="NameTextBox" class="form-label me-2" style="width: 200px;">Name</label>
<asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control" Placeholder="Name"></asp:TextBox>
</div>
<div class="form-group d-flex align-items-center">
<label for="EmailTextBox" class="form-label me-2" style="width: 200px;">Email</label>
<asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control" Placeholder="Email" TextMode="Email"></asp:TextBox>
</div>
<div class="form-group d-flex align-items-center">
<label for="PhoneTextBox" class="form-label me-2" style="width: 200px;">Phone</label>
<asp:TextBox ID="PhoneTextBox" runat="server" CssClass="form-control" Placeholder="Phone"></asp:TextBox>
</div>
<div class="form-group d-flex align-items-center">
<label for="AddressTextBox" class="form-label me-2" style="width: 200px;">Address</label>
<asp:TextBox ID="AddressTextBox" runat="server" CssClass="form-control" Placeholder="Address" TextMode="MultiLine"></asp:TextBox>
</div>
<div class="form-group d-flex align-items-center">
<label for="DOBTextBox" class="form-label me-2" style="width: 200px;">Date of Birth</label>
<asp:TextBox ID="DOBTextBox" runat="server" CssClass="form-control" Placeholder="Date of Birth" TextMode="Date"></asp:TextBox>
</div>
<div class="form-group d-flex align-items-center">
<label for="GenderDropDown" class="form-label me-2" style="width: 200px;">Gender</label>
<asp:DropDownList ID="GenderDropDown" runat="server" CssClass="form-control">
<asp:ListItem Value="Male">Male</asp:ListItem>
<asp:ListItem Value="Female">Female</asp:ListItem>
<asp:ListItem Value="Other">Other</asp:ListItem>
</asp:DropDownList>
</div>
<asp:Button ID="SaveProfileButton" runat="server" CssClass="btn btn-primary" Text="Save Changes" OnClick="SaveProfileButton_Click" />
</div>
</section>
 
            <!-- Change Password Section -->
<section id="change-password" style="display:none;">
<h2>Change Password</h2>
<div class="password-container w-50 mx-auto">
<div class="form-group d-flex align-items-center">
<label for="CurrentPasswordTextBox" class="form-label me-2" style="width: 200px;">Current Password</label>
<asp:TextBox ID="CurrentPasswordTextBox" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Current Password"></asp:TextBox>
</div>
<div class="form-group d-flex align-items-center">
<label for="NewPasswordTextBox" class="form-label me-2" style="width: 200px;">New Password</label>
<asp:TextBox ID="NewPasswordTextBox" runat="server" CssClass="form-control" TextMode="Password" Placeholder="New Password"></asp:TextBox>
</div>
<div class="form-group d-flex align-items-center">
<label for="ConfirmPasswordTextBox" class="form-label me-2" style="width: 200px;">Confirm New Password</label>
<asp:TextBox ID="ConfirmPasswordTextBox" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Confirm New Password"></asp:TextBox>
</div>
<asp:Button ID="ChangePasswordButton" runat="server" CssClass="btn btn-primary" Text="Change Password" OnClick="ChangePasswordButton_Click" />
</div>
</section>
 
        </main>
</form>
 
    <script>
        function loadManageProfile() {
            var profileSection = document.querySelector('#manage-profile');
            var passwordSection = document.querySelector('#change-password');

            // Toggle the display property
            if (profileSection.style.display === 'block' && passwordSection.style.display === 'block') {
                profileSection.style.display = 'none';
                passwordSection.style.display = 'none';
            } else {
                profileSection.style.display = 'block';
                passwordSection.style.display = 'block';
            }
        }
        function redirectToJobList() {
            var sid = '<%= Request.QueryString["sid"] %>';
			var sname = '<%= Request.QueryString["sname"] %>';
            window.location.href = "JobListings.aspx?sid=" + sid + "&sname=" + encodeURIComponent(sname);
        }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>