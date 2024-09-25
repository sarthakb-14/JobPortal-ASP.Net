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
        .profile-container {
            position: relative;
            top: 20px;
            right: 20px;
            z-index: 1;
            display: flex;
            flex-direction : column;
            align-items  : stretch;
            
            color: white;
        }
    </style>
<link rel="stylesheet" href="
https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
/></head>
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
                        <li class="nav-item"><a href="LandingPage.aspx" class="nav-link">Logout</a></li>
                        <li class="nav-item"><a href="#" onclick="loadManageProfile()" class="nav-link">Edit Profile</a></li>
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
            <section id="manage-profile" style="display:none;">
                <h2>Edit Profile</h2>
                <div class="profile-container w-50 mx-auto">
                    <div class="form-group d-flex align-items-center">
                        <label for="NameTextBox" class="form-label me-2" style="width: 200px;">Name</label>
                        <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control" Placeholder="Name"></asp:TextBox>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <label for="EmailTextBox" class="form-label me-2" style="width: 200px;">Email</label>
                        <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control" Placeholder="Email"></asp:TextBox>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <label for="DOBTextBox" class="form-label me-2" style="width: 200px;">Date of Birth</label>
                        <asp:TextBox ID="DOBTextBox" runat="server" CssClass="form-control" Placeholder="Date of Birth"></asp:TextBox>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <label for="GenderDropDown" class="form-label me-2" style="width: 200px;">Gender</label>
                        <asp:DropDownList ID="GenderDropDown" runat="server" CssClass="form-select">
                            <asp:ListItem Value="Male">Male</asp:ListItem>
                            <asp:ListItem Value="Female">Female</asp:ListItem>
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <label for="AddressTextBox" class="form-label me-2" style="width: 200px;">Address</label>
                        <asp:TextBox ID="AddressTextBox" runat="server" CssClass="form-control" Placeholder="Address"></asp:TextBox>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <label for="PhoneTextBox" class="form-label me-2" style="width: 200px;">Contact No</label>
                        <asp:TextBox ID="PhoneTextBox" runat="server" CssClass="form-control" Placeholder="Contact No"></asp:TextBox>
                    </div>
                    <asp:Button ID="SaveProfileButton" runat="server" Text="Save Profile" CssClass="btn btn-primary" OnClick="SaveProfileButton_Click" />
                    <div class="form-group mt-3">
                        <h3>Change Password</h3>
                        <label for="CurrentPasswordTextBox" class="form-label">Current Password</label>
                        <asp:TextBox ID="CurrentPasswordTextBox" runat="server" CssClass="form-control" TextMode="Password" />
                        <label for="NewPasswordTextBox" class="form-label">New Password</label>
                        <asp:TextBox ID="NewPasswordTextBox" runat="server" CssClass="form-control" TextMode="Password" />
                        <asp:Button ID="ChangePasswordButton" runat="server" Text="Change Password" CssClass="btn btn-danger" OnClick="ChangePasswordButton_Click" />
                    </div>
                </div>
            </section>
        </main>
    </form>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-KyZXEAg3QhqLMpG8r+Knujsl5/9Ibn5R3hG00iJ5xl3W6MhuF0gE2h9C4do8XWZi" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-OE03K1Io5k98UpF1Dmtw1dUj6kx+9uQIQIS6ew1g62tILrVV1S6Y0kHj7Yf7mCVn" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-HWIK2pG0h3UmEoS1d9Y18cC40PlG3q3g6N8bPjUq3w2KvM/2aLVmQdvhOdGcuTAS" crossorigin="anonymous"></script>
    <script>
        function loadManageProfile() {
            document.getElementById("manage-profile").style.display = "block";
            document.getElementById("job-search").style.display = "none";
        }

        function redirectToJobList() {
            window.location.href = "JobListings.aspx?sid=<%=Request.QueryString["sid"] %>";
        }

        
    </script>
</body>
</html>
