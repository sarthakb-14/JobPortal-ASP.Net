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
    <!-- Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    
    <style>
        /* General Styling */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
        }

        /* Navbar Styling */
        .navbar {
            background-color: #ffffff;
            padding: 10px 30px;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 100;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .navbar .navbar-nav .nav-link {
            color: #343a40;
            font-weight: 500;
            padding: 0 10px;
            font-size: 14px;
        }

        .navbar .navbar-nav .btn {
            border: 1px solid #007bff;
            color: #007bff;
            font-family: 'Muli', sans-serif;
            background: none;
            padding: 10px 30px;
            text-transform: uppercase;
            cursor: pointer;
            display: inline-block;
            font-size: 14px;
            font-weight: 500;
            letter-spacing: 1px;
            border-radius: 5px;
            transition: color 0.4s linear, border-color 0.4s linear;
            margin-left: 10px;
        }

        .navbar .navbar-nav .btn:hover {
            color: #ffffff;
            border-color: #ffffff;
            background-color: #007bff;
        }

        /* Adjust for sticky navbar */
        body {
            padding-top: 60px;
        }

        /* Banner Section */
        .banner {
            position: relative;
            height: 80vh;
            background-image: url('https://images.unsplash.com/photo-1499750310107-5fef28a66643?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
        }

        .banner::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.3);
            z-index: 1;
        }

        .banner h1 {
            position: relative;
            font-size: 3rem;
            z-index: 1;
        }

        .banner p {
            position: relative;
            z-index: 1;
            font-size: 1.2rem;
            margin-bottom: 20px;
        }

        /* Search Section */
        .search-section {
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: -50px;
            z-index: 10;
            position: relative;
        }

        .search-section h3 {
            text-align: center;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .search-section .form-control {
            margin-bottom: 15px;
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
            color: #495057;
        }

        .search-section .form-control::placeholder {
            color: #6c757d;
        }

        /* Browse Categories Section */
        .browse-categories {
            margin: 50px 0;
            text-align: center;
        }

        .browse-categories h3 {
            font-weight: 600;
            margin-bottom: 20px;
        }

        .categories {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
            flex-wrap: wrap;
        }

        .category-box {
            background-color: #ffffff;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 22%;
            margin-bottom: 15px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .category-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border: 1px solid #007bff;
        }

        .category-box i {
            font-size: 2.5rem;
            color: #007bff;
        }

        .category-box h5 {
            margin-top: 10px;
            font-weight: 600;
        }

        .show-all-btn {
            margin-top: 20px;
            border: 1px solid #007bff;
            color: #007bff;
            font-family: 'Muli', sans-serif;
            background: none;
            padding: 10px 20px;
            text-transform: uppercase;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            letter-spacing: 1px;
            border-radius: 5px;
            transition: color 0.4s linear, border-color 0.4s linear;
        }

        .show-all-btn:hover {
            color: #ffffff;
            border-color: #ffffff;
            background-color: #007bff;
        }

        /* Resume Upload Section */
        .resume-section {
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* How It Works Section */
        .how-it-works-section {
            padding: 20px;
            text-align: center;
            margin-bottom: 50px;
        }

        .how-it-works-card {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .how-it-works-card:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* Footer */
        .footer {
            padding: 40px;
            background-color: #f1f3f5;
            color: #343a40;
            text-align: center;
        }

        .footer .footer-content {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            margin-bottom: 30px;
        }

        .footer .footer-content div {
            flex: 1;
            margin: 10px;
        }

        .footer h5 {
            margin-bottom: 15px;
            font-weight: 600;
        }

        .footer p {
            margin-bottom: 0;
        }

        .footer a {
            color: #007bff;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar Section -->
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand" href="#">Job Portal</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Jobs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>
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


