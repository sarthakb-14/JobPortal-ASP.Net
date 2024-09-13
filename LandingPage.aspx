<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LandingPage.aspx.cs" Inherits="JobPortal.LandingPage" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Portal</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Muli:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="StyleSheet/LandingPage.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar Section -->
        <nav class="navbar navbar-expand-lg">
            <div>
                <a class="navbar-brand" href="#">Job Portal</a>
            </div>
            <div class="navbar-collapse navlink justify-content-center" id="navbarNav">
                <ul class="navbar-nav gap text-center w-100">
                    <li>
                        <a class="nav-link" href="#">Home</a>
                    </li>
                    <li>
                        <a class="nav-link" href="#">Jobs</a>
                    </li>
                    <li>
                        <a class="nav-link" href="#">Contact</a>
                    </li>
                </ul>
            </div>
            <div>
                <ul class="navbar-nav justify-content-end">
                    <li class="nav-item">
                        <asp:Button runat="server" CssClass="btn" Text="Register" />
                    </li>
                    <li class="nav-item">
                        <asp:Button runat="server" CssClass="btn" Text="Login" />
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Banner Section -->
        <div class="banner">
            <div>
                <h1>Your Dream Job Awaits</h1>
                <p>Find jobs that fit your skills, preferences, and aspirations</p>
                <asp:Button runat="server" CssClass="btn btn-primary" Text="Get Started" />
            </div>
        </div>

        <!-- Search Job Section -->
        <section class="search-section container mt-5">
            <h3>Find Your Perfect Job</h3>
            <div class="row">
                <div class="col-md-6">
                    <asp:Label runat="server" Text="Job Type" />
                    <asp:DropDownList runat="server" CssClass="form-control">
                        <asp:ListItem Text="Full-time" />
                        <asp:ListItem Text="Part-time" />
                        <asp:ListItem Text="Internship" />
                        <asp:ListItem Text="Freelance" />
                    </asp:DropDownList>
                </div>
                <div class="col-md-6">
                    <asp:Label runat="server" Text="Location" />
                    <asp:TextBox runat="server" CssClass="form-control" placeholder="Enter Location" />
                </div>
            </div>
            <asp:Button runat="server" CssClass="btn btn-primary mt-3" Text="Search Jobs" />
        </section>

        <!-- Browse Categories Section -->
        <section class="browse-categories">
            <h3>Browse Top Categories</h3>
            <div class="categories">
                <div class="category-box">
                    <i class="fas fa-laptop-code"></i>
                    <h5>Technology</h5>
                </div>
                <div class="category-box">
                    <i class="fas fa-briefcase-medical"></i>
                    <h5>Healthcare</h5>
                </div>
                <div class="category-box">
                    <i class="fas fa-hammer"></i>
                    <h5>Construction</h5>
                </div>
                <div class="category-box">
                    <i class="fas fa-paint-brush"></i>
                    <h5>Design</h5>
                </div>
            </div>
            <asp:Button runat="server" CssClass="show-all-btn" Text="Show All" />
        </section>

        <!-- Resume Upload Section -->
        <section class="resume-section container">
            <h3>Upload Your Resume</h3>
            <p>Upload your resume to be found by top companies.</p>
            <asp:FileUpload runat="server" CssClass="form-control" />
            <asp:Button runat="server" CssClass="btn btn-primary mt-3" Text="Upload Resume" />
        </section>

        <!-- How It Works Section -->
        <section class="how-it-works-section container">
            <h3>How the Portal Works</h3>
            <div class="row">
                <div class="col-md-4">
                    <div class="how-it-works-card">
                        <i class="fas fa-user-plus fa-3x mb-3"></i>
                        <h5>Create an Account</h5>
                        <p>Sign up and create a profile to start applying.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="how-it-works-card">
                        <i class="fas fa-search fa-3x mb-3"></i>
                        <h5>Search Jobs</h5>
                        <p>Browse thousands of jobs that match your profile.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="how-it-works-card">
                        <i class="fas fa-handshake fa-3x mb-3"></i>
                        <h5>Get Hired</h5>
                        <p>Apply and get hired by top companies!</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer Section -->
        <footer class="footer">
            <div class="footer-content container">
                <div>
                    <h5>About Us</h5>
                    <p>Job Portal is a leading platform connecting employers with top talent. We help individuals find their dream jobs while enabling companies to hire the best candidates.</p>
                </div>
                <div>
                    <h5>Contact Info</h5>
                    <p>Email: <a href="mailto:info@jobportal.com">info@jobportal.com</a></p>
                    <p>Phone: +123-456-7890</p>
                    <p>Address: 1234 Job Street, Employment City, Jobland</p>
                </div>
            </div>
            <p>&copy; 2024 Job Portal. All Rights Reserved.</p>
        </footer>
    </form>

    <!-- Including Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>