<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobListings.aspx.cs" Inherits="JobPortal.JobListings" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta name="viewport" content="width=device-width, initial-scale=1.0" />
     <title>Job Listing</title>
     <!-- Google Fonts -->
     <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
     <link href="https://fonts.googleapis.com/css2?family=Muli:wght@400;600&display=swap" rel="stylesheet">
     <!-- BootStrap -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
     <!-- FontAwesome Icons -->
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
     <link rel="stylesheet" href="StyleSheet/JobListing.css"/>
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
                        <a class="nav-link" href="LandingPage.aspx">Home</a>
                    </li>
                    <li>
                        <a class="nav-link" href="JobListings.aspx">Job Listings</a>
                    </li>
                    <li>
                        <a class="nav-link" href="#">Contact Us</a>
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
                <div class="row mb-5">
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
                        <input type="text" class="form-control form-control-lg sizeing" placeholder="Job title, keywords...">
                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
                        <select class="form-select sizeing">
                            <option selected>Anywhere</option>
                            <option>San Francisco</option>
                            <option>Palo Alto</option>
                            <option>New York</option>
                            <option>Manhattan</option>
                            <option>Ontario</option>
                            <option>Toronto</option>
                            <option>Kansas</option>
                            <option>Mountain View</option>
                        </select>
                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
                        <select class="form-select sizeing">
                            <option selected>Any</option>
                            <option>Full Time</option>
                            <option>Part Time</option>
                            <option>Internship</option>
                            <option>Freelancer</option>
                        </select>
                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
                        <button type="submit" class="btn btn-primary btn-lg btn-block text-white btn-search sizeing">Search Job</button>
                    </div>
                </div> 
            </div>
        </div>




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

    <!-- Including Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
