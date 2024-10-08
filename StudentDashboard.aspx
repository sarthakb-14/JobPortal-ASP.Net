<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="JobPortal.StudentDashboard" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard - Job Portal</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="StyleSheet/StudentDashboard.css"/>
    <style>
        #bg-wrap {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 0; /* Background is behind everything */
        }

        main, header, footer {
            position: relative;
            z-index: 1; /* Content is above the background */
        }
        /* Add some padding to the main content */
        main {
            padding-top: 60px;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
</head>
<body>
    <form id="form1" class="m-0" runat="server" enctype="multipart/form-data">
        <header>
            <div class="container d-flex justify-content-between align-items-center">
                <h1>Student Dashboard</h1>
                <nav>
                    <ul class="nav" >
                    <li class="nav-item d-flex align-items-center profile-container">
                    <i class="fas fa-user-circle profile-icon"></i>
                    <asp:Label ID="lblStudentName" runat="server" CssClass="me-3"></asp:Label> <!-- Student name -->
                    </li>
                    <li class="nav-item"><asp:Button ID="LogoutBtn" runat="server" CssClass="btn btn-primary m-0" Text="Logout" OnClick="LogoutBtn_Click"/></li>
                    <li class="nav-item"><a href="#" onclick="loadManageProfile()" class="btn btn-primary m-0 text-decoration-none">Edit Profile</a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <main class="container">
            <div id="job-search">
                <div class="card search-card text-center" onclick="redirectToJobList()">
                    <div class="card-body">
                        <i class="fas fa-search fa-3x"></i>
                        <h5 class="card-title mt-3">Search</h5>
                        <h6 class="card-body p-0">Dream Job, Company Details, Job Posting and Vacancies</h6>
                    </div>
                </div>
            </div>

            <section id="applied-job">
                <h2>Your Recent Jobs Applied</h2>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="CompanyName" HeaderText="Company Name" />
                        <asp:BoundField DataField="JobTitle" HeaderText="Job Title" />
                    </Columns>
                </asp:GridView>
            </section>

            <section id="manage-profile" style="display:none;">
                <h2 style="color: #000000;">Edit Profile</h2>
                <div class="profile-container w-50 mx-auto">
                    <div class="form-group d-flex align-items-center">
                        <label for="NameTextBox" class="form-label me-2" style="width: 200px; color: #000000;">Name</label>
                        <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control" Placeholder="Name"></asp:TextBox>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <label for="EmailTextBox" class="form-label me-2" style="width: 200px; color: #000000;">Email</label>
                        <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control" Placeholder="Email"></asp:TextBox>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <label for="DOBTextBox" class="form-label me-2" style="width: 200px; color: #000000;">Date of Birth</label>
                        <asp:TextBox ID="DOBTextBox" runat="server" CssClass="form-control" Placeholder="Date of Birth"></asp:TextBox>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <label for="GenderDropDown" class="form-label me-2" style="width: 200px; color: #000000;">Gender</label>
                        <asp:DropDownList ID="GenderDropDown" runat="server" CssClass="form-select">
                            <asp:ListItem Value="Male">Male</asp:ListItem>
                            <asp:ListItem Value="Female">Female</asp:ListItem>
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <label for="AddressTextBox" class="form-label me-2" style="width: 200px; color: #000000;">Address</label>
                        <asp:TextBox ID="AddressTextBox" runat="server" CssClass="form-control" Placeholder="Address"></asp:TextBox>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <label for="PhoneTextBox" class="form-label me-2" style="width: 200px; color: #000000;">Contact No</label>
                        <asp:TextBox ID="PhoneTextBox" runat="server" CssClass="form-control" Placeholder="Contact No"></asp:TextBox>
                    </div>
                    <asp:Button ID="SaveProfileButton" runat="server" Text="Save Profile" CssClass="btn btn-primary" OnClick="SaveProfileButton_Click" />
                    <div class="form-group mt-3">
                        <h3 style="color: #000000;">Change Password</h3>
                        <label for="CurrentPasswordTextBox" class="form-label" style="color: #000000;">Current Password</label>
                        <asp:TextBox ID="CurrentPasswordTextBox" runat="server" CssClass="form-control" TextMode="Password" />
                        <label for="NewPasswordTextBox" class="form-label" style="color: #000000;">New Password</label>
                        <asp:TextBox ID="NewPasswordTextBox" runat="server" CssClass="form-control" TextMode="Password" />
                        <asp:Button ID="ChangePasswordButton" runat="server" Text="Change Password" CssClass="btn btn-danger" OnClick="ChangePasswordButton_Click" />
                    </div>
                </div>
            </section>

        </main>
    </form>

    <!-- Background SVG -->
    <div id="bg-wrap">
        <svg viewBox="0 0 100 100" preserveAspectRatio="xMidYMid slice">
            <defs>
                <radialGradient id="Gradient1" cx="50%" cy="50%" fx="0.441602%" fy="50%" r=".5">
                    <animate attributeName="fx" dur="34s" values="0%;3%;0%" repeatCount="indefinite"></animate>
                    <stop offset="0%" stop-color="rgba(255, 0, 255, 1)"></stop>
                    <stop offset="100%" stop-color="rgba(255, 0, 255, 0)"></stop>
                </radialGradient>
                <radialGradient id="Gradient2" cx="50%" cy="50%" fx="2.68147%" fy="50%" r=".5">
                    <animate attributeName="fx" dur="23.5s" values="0%;3%;0%" repeatCount="indefinite"></animate>
                    <stop offset="0%" stop-color="rgba(0, 255, 255, 1)"></stop>
                    <stop offset="100%" stop-color="rgba(0, 255, 255, 0)"></stop>
                </radialGradient>
            </defs>
            <rect x="0" y="0" width="100" height="100" fill="url(#Gradient1)">
                <animate attributeName="x" dur="20s" values="25%;0%;25%" repeatCount="indefinite"></animate>
                <animate attributeName="y" dur="21s" values="0%;25%;0%" repeatCount="indefinite"></animate>
                <animateTransform attributeName="transform" type="rotate" from="360 50 50" to="0 50 50" dur="7s" repeatCount="indefinite"></animateTransform>
            </rect>
            <rect x="0" y="0" width="100" height="100" fill="url(#Gradient2)">
                <animate attributeName="x" dur="23s" values="-25%;0%;-25%" repeatCount="indefinite"></animate>
                <animate attributeName="y" dur="24s" values="0%;-25%;0%" repeatCount="indefinite"></animate>
                <animateTransform attributeName="transform" type="rotate" from="0 50 50" to="360 50 50" dur="12s" repeatCount="indefinite"></animateTransform>
            </rect>
        </svg>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
    function loadManageProfile() {
        document.getElementById("manage-profile").style.display = "block";
    }

    function redirectToJobList() {
        window.location.href = "JobListings.aspx";
    }
</script>
<script type="text/javascript">
    window.history.forward();
    function noBack() {
        window.history.forward();
    }
</script>
</body>
</html>
