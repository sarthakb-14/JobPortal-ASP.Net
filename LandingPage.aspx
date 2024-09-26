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
    <!-- BootStrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <link rel="stylesheet" href="StyleSheet/LandingPage.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar Section -->
        <nav class="navbar navbar-expand-lg">
            <div>
                <a class="navbar-brand" href="#">Job Portal</a>
            </div>
            <div class="navbar-collapse navlink" id="navbarNav">
                <ul class="navbar-nav gap text-center w-100">
                    <li>
                        <a class="nav-link" href="#">Home</a>
                    </li>
                    <li>
                        <a class="nav-link" href="JobListings.aspx">Job Listings</a>
                    </li>
                    <li>
                        <a class="nav-link" href="ContactPage.aspx">Contact Us</a>
                    </li>
                </ul>
            </div>
            <div>
                <ul class="navbar-nav justify-content-end">
                    <li class="nav-item">
                        <asp:Button runat="server" CssClass="btn" Text="Register" OnClientClick="window.location.href='Registration.aspx'; return false;" />
                    </li>
                    <li class="nav-item">
                        <asp:Button runat="server" CssClass="btn" Text="Login" OnClientClick="window.location.href='JobPortalLogin.aspx'; return false;" />
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Banner Section -->
        <div class="banner">
            <div class="w-75">
                <h1>Your Dream Job Awaits</h1>
                <p>Find jobs that fit your skills, preferences, and aspirations</p>
                <div class="row">
                <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
                    <asp:TextBox ID="keyword" CssClass="form-control form-control-lg sizeing" runat="server" Placeholder="Job title, keywords..."></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
                    <asp:TextBox ID="location" CssClass="form-control form-control-lg sizeing" runat="server" Placeholder="Location..."></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
                    <asp:DropDownList ID="timing" CssClass="form-select sizeing" runat="server">
                        <asp:ListItem Selected="True" Text="Any" Value=""></asp:ListItem>
                        <asp:ListItem Text="Full Time" Value="Full Time"></asp:ListItem>
                        <asp:ListItem Text="Part Time" Value="Part Time"></asp:ListItem>
                        <asp:ListItem Text="Internship" Value="Internship"></asp:ListItem>
                        <asp:ListItem Text="Freelancer" Value="Freelancer"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
                    <asp:Button ID="FilterJob" runat="server" CssClass="btn btn-primary btn-lg btn-block text-white btn-search sizeing" OnClick="FilterJob_Click" Text="Search Job" />
                </div>
            </div>
            </div>
        </div>

        <!-- Search Job Section -->
        <section class="opacity-box">
            <div class="row mb-5 justify-content-center">
                <div class="col-md-7 text-center">
                    <h2 class="section-title mb-2 text-white">Careers Statistics</h2>
                    <p class="lead text-white">Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita unde officiis recusandae sequi excepturi corrupti.</p>
                </div>
            </div>
            <div class="row section-counter justify-content-around">
                <div class="col-6 col-md-6 col-lg-3 mb-5 mb-lg-0">
                    <div class="d-flex align-items-center justify-content-center">
                        <strong class="number" id="applicants"><asp:Label ID="lblApplicants" runat="server"></asp:Label></strong>
                    </div>
                    <span class="caption">Candidates</span>
                </div>
                <div class="col-6 col-md-6 col-lg-3 mb-5 mb-lg-0">
                    <div class="d-flex align-items-center justify-content-center">
                        <strong class="number" id="jobsPosted"><asp:Label ID="lblJobsPosted" runat="server"></asp:Label></strong>
                    </div>
                    <span class="caption">Jobs Posted</span>
                </div>
                <div class="col-6 col-md-6 col-lg-3 mb-5 mb-lg-0">
                    <div class="d-flex align-items-center justify-content-center">
                        <strong class="number" id="jobsFilled"><asp:Label ID="lblJobsFilled" runat="server"></asp:Label></strong>
                    </div>
                    <span class="caption">Jobs Filled</span>
                </div>
                <div class="col-6 col-md-6 col-lg-3 mb-5 mb-lg-0">
                    <div class="d-flex align-items-center justify-content-center">
                        <strong class="number" id="companies"><asp:Label ID="lblCompanies" runat="server"></asp:Label></strong>
                    </div>
                    <span class="caption">Companies</span>
                </div>
            </div>
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



        <!-- How It Works Section -->
        <section class="how-it-works-section">
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
            <hr class="w-100 bg-white mb-5" />
            <div class="footer-content container">
                <div>
                    <h5>About Us</h5>
                    <p>Job Portal is a leading platform connecting employers with top talent. We help individuals find their dream jobs while enabling companies to hire the best candidates.</p>
                </div>
                <div>
                    <h5>Contact Info</h5>
                    <p>Email: <a href="mailto:utkarsh.singh@finthrive.com">info@jobportal.com</a></p>
                    <p>Phone: +919090909090</p>
                    <p>Address: 15th, Finthrive Global, Unitech CyberPark, Gurugram</p>
                </div>
            </div>
            <p>&copy; 2024 Job Portal. All Rights Reserved.</p>
        </footer>
    </form>



    <script>
	    $(document).ready(function () {
		    // Function to animate number counting
		    function animateNumber(id, targetNumber) {
			    $({ countNum: 0 }).animate({ countNum: targetNumber }, {
				    duration: 2000, // Duration of animation in milliseconds
				    easing: 'linear',
				    step: function () {
					    $(id).text(Math.floor(this.countNum)); // Update the label text
				    },
				    complete: function () {
					    $(id).text(this.countNum); // Ensure the final number is displayed
				    }
			    });
		    }

		    // Get the values from the server-side labels and animate
		    animateNumber('#applicants', parseInt($('#<%= lblApplicants.ClientID %>').text()) || 0);
		    animateNumber('#jobsPosted', parseInt($('#<%= lblJobsPosted.ClientID %>').text()) || 0);
            animateNumber('#jobsFilled', parseInt($('#<%= lblJobsFilled.ClientID %>').text()) || 0);
            animateNumber('#companies', parseInt($('#<%= lblCompanies.ClientID %>').text()) || 0);
	    });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>