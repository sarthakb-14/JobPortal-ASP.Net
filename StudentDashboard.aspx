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
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('images/bg_dashboard.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #ffffff;
            margin: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Dark Overlay for background */
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.25);
            z-index: 0;
        }

        header {
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            color: #ffffff;
            padding: 1rem 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            position: relative;
            z-index: 1;
        }

        header .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header h1 {
            margin: 0;
        }

        nav ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
        }

        nav ul li {
            margin-left: 1rem;
        }

        nav ul li a {
            color: #ffffff;
            text-decoration: none;
            font-weight: bold;
        }

        nav ul li a:hover {
            text-decoration: underline;
        }

        main {
            flex: 1;
            padding: 2rem 1rem;
            position: relative;
            z-index: 1;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        section {
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            margin-bottom: 2rem;
            padding: 2rem;
            color: #ffffff;
        }

        h2 {
            margin-top: 0;
            border-bottom: 2px solid #007bff;
            padding-bottom: 0.5rem;
            color: #ffffff;
        }

        form {
            margin: 1rem 0;
        }

        form label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: bold;
        }

        form input[type="text"],
        form input[type="email"],
        form input[type="password"],
        form input[type="date"],
        form select,
        form input[type="file"],
        form button {
            display: block;
            width: 100%;
            margin-bottom: 1rem;
            padding: 0.5rem;
            border: 1px solid #007bff;
            border-radius: 4px;
            background-color: rgba(255, 255, 255, 0.1);
            color: #ffffff;
        }

        form input[type="file"] {
            padding: 0;
        }

        form button {
            background-color: transparent;
            color: #ffffff;
            border: 0.2em solid #007bff;
            cursor: pointer;
            font-size: 1rem;
        }

        form button:hover {
            background-color: #007bff;
            color: #ffffff;
        }

        .job-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .job-list li {
            padding: 1rem;
            border-bottom: 1px solid #007bff;
        }

        footer {
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            color: #ffffff;
            text-align: center;
            padding: 1rem;
            position: relative;
            z-index: 1;
        }

        footer .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .form-control {
            border-radius: 4px;
            border: 1px solid #007bff;
            background-color: rgba(255, 255, 255, 0.1);
            color: #ffffff;
        }

        .form-control:focus {
            border-color: #0056b3;
            box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25);
        }

        /* Manage Profile Styles */
        #manage-profile {
            display: none; /* Initially hidden */
        }

        /* Job Category Tiles */
        .category-tile {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(15px);
            border-radius: 10px;
            padding: 1.5rem;
            margin-bottom: 1rem;
            text-align: center;
            color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .category-tile:hover {
            background-color: #007bff;
            transform: scale(1.05);
        }

        .category-tile h3 {
            margin: 0;
            font-size: 1.25rem;
        }

        .category-tile p {
            font-size: 1rem;
        }

        .show-more-tile {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(15px);
            border-radius: 10px;
            padding: 1.5rem;
            margin-bottom: 1rem;
            text-align: center;
            color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            transition: background-color 0.3s ease, transform 0.3s ease;
            cursor: pointer;
        }

        .show-more-tile:hover {
            background-color: #007bff;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <header>
            <div class="container">
                <h1>Student Dashboard</h1>
                <nav>
                    <ul>
                        <li><a href="~/Home/Index">Home</a></li>
                        <li><div onclick="loadManageProfile()"><a href="#" id="profileLink">Profile</a></div></li>
                    </ul>
                </nav>
            </div>
        </header>

        <main class="container">
            <!-- Job Search Section -->
            <section id="job-search">
                <h2>Search Jobs</h2>
                <asp:TextBox ID="SearchTextBox" runat="server" CssClass="form-control" Placeholder="Search jobs..." OnTextChanged="SearchTextBox_TextChanged"></asp:TextBox>
                <asp:Button ID="SearchButton" runat="server" CssClass="button" Text="Search" OnClick="SearchButton_Click" />
                
                <asp:Repeater ID="JobRepeater" runat="server" OnItemCommand="JobRepeater_ItemCommand">
                    <ItemTemplate>
                        <div class="job-list">
                            <h3><%# Eval("Title") %></h3>
                            <p><%# Eval("Description") %></p>
                            <p><strong>Location:</strong> <%# Eval("Location") %></p>
                            <p><strong>Posted on:</strong> <%# Eval("PostedDate", "{0:MM/dd/yyyy}") %></p>
                            <asp:Button ID="ApplyButton" runat="server" CssClass="button" Text="Apply" CommandArgument='<%# Eval("Id") %>' />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </section>

            <!-- Job Categories Section -->
            <section id="job-categories">
                <h2>Job Categories</h2>
                <div class="row">
                    <div class="col-md-4">
                        <div class="category-tile" id="technology" onclick="showCategory('technology')">
                            <h3>Technology</h3>
                            <p>Find jobs in software development, IT, and tech-related fields.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="category-tile" id="finance" onclick="showCategory('finance')">
                            <h3>Finance</h3>
                            <p>Explore career opportunities in banking, investment, and accounting.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="show-more-tile" onclick="showMoreCategories()">
                            <h3>Show More</h3>
                            <p>View additional job categories.</p>
                        </div>
                    </div>
                </div>
            </section>

           <!-- Manage Profile Section -->
<section id="manage-profile">
    <h2>Edit Your Profile</h2>
    <div class="profile-container w-50 mx-auto"> <!-- Added mx-auto for centering -->
        <asp:TextBox ID="EnrollmentTextBox" runat="server" CssClass="form-control mb-3" Placeholder="Enrollment Number"></asp:TextBox>
        <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control mb-3" Placeholder="Name"></asp:TextBox>
        <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control mb-3" Placeholder="Email" TextMode="Email"></asp:TextBox>
        <asp:TextBox ID="PhoneTextBox" runat="server" CssClass="form-control mb-3" Placeholder="Phone"></asp:TextBox>
        <asp:TextBox ID="AddressTextBox" runat="server" CssClass="form-control mb-3" Placeholder="Address" TextMode="MultiLine"></asp:TextBox>
        <asp:TextBox ID="DOBTextBox" runat="server" CssClass="form-control mb-3" Placeholder="Date of Birth" TextMode="Date"></asp:TextBox>
        <asp:DropDownList ID="GenderDropDown" runat="server" CssClass="form-control mb-3">
            <asp:ListItem Value="Male">Male</asp:ListItem>
            <asp:ListItem Value="Female">Female</asp:ListItem>
            <asp:ListItem Value="Other">Other</asp:ListItem>
        </asp:DropDownList>

        <h3>Update Password</h3>
        <asp:TextBox ID="CurrentPasswordTextBox" runat="server" CssClass="form-control mb-3" TextMode="Password" Placeholder="Current Password"></asp:TextBox>
        <asp:TextBox ID="NewPasswordTextBox" runat="server" CssClass="form-control mb-3" TextMode="Password" Placeholder="New Password"></asp:TextBox>
        <asp:TextBox ID="ConfirmPasswordTextBox" runat="server" CssClass="form-control mb-3" TextMode="Password" Placeholder="Confirm New Password"></asp:TextBox>

        <h3>Upload Resume</h3>
        <asp:FileUpload ID="ResumeFileUpload" runat="server" CssClass="form-control mb-3" />

        <asp:Button ID="SaveButton" runat="server" CssClass="button" Text="Save Changes" OnClick="SaveButton_Click" />
    </div>

            </section>
        </main>

        <footer>
            <div class="container">
                <p>&copy; 2024 Job Portal</p>
            </div>
        </footer>
    </form>

    <script>
        function loadManageProfile() {
            document.querySelector('#manage-profile').style.display = 'block';
        }

        function showCategory(category) {
            // Implement the logic to display job listings based on the selected category
            console.log('Selected category:', category);
        }

        function showMoreCategories() {
            // Implement the logic to display more job categories
            console.log('Show more categories');
        }
    </script>
</body>
</html>
