<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobListings.aspx.cs" Inherits="JobPortal.JobListings" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Job Listing</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Muli:wght@400;600&display=swap" rel="stylesheet" />
    <!-- BootStrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <link rel="stylesheet" href="StyleSheet/JobListing.css" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar Section -->
        <nav class="navbar navbar-expand-lg">
            <div><a class="navbar-brand" href="#">Job Portal</a></div>
            <div class="navbar-collapse navlink" id="navbarNav">
                <ul class="navbar-nav gap text-center w-100">
                    <li><a class="nav-link" href="StudentDashboard.aspx?sid=<%=Request.QueryString["sid"] %>&sname=<%=Request.QueryString["sname"] %>">Student Dashboard</a></li>
                    <li><a class="nav-link" href="JobListings.aspx">Job Listings</a></li>
                    <li><a class="nav-link" href="Contact.aspx">Contact Us</a></li>
                </ul>
            </div>
            <div>
                 <ul class="navbar-nav justify-content-end">
                    <li class="nav-item" runat="server" id="logoutItem">
                        <asp:Button runat="server" CssClass="btn" Text="Logout" OnClientClick="window.location.href='LandingPage.aspx'; return false;" />
                    </li>
                    <li class="nav-item" runat="server" id="registerItem">
                        <asp:Button runat="server" CssClass="btn" Text="Register" OnClientClick="window.location.href='Registration.aspx'; return false;" />
                    </li>
                    <li class="nav-item" runat="server" id="loginItem">
                        <asp:Button runat="server" CssClass="btn" Text="Login" OnClientClick="window.location.href='JobPortalLogin.aspx'; return false;" />
                    </li>
                </ul>
            </div>
        </nav>


        <!-- Banner Section -->
        <section class="banner">
            <div class="mt-5">
                <h1>Job Listings</h1>
                <p>Find jobs that fit your skills, preferences, and aspirations</p>
            </div>
        </section>


        <!-- Search Section -->
        <section class="container d-flex flex-column">
            <h3 class="fs-2 text-center" style="margin-top: 8%; margin-bottom: 3%;">Filter Jobs</h3>
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
        </section>



        <!-- Job Card Section -->
        <section class="container mt-5 mb-5">
            <asp:Label ID="JobNumberLabel" CssClass="mb-2 fs-3" runat="server"></asp:Label>
            <div class="row mt-3">
                <div class="col-md-12">
                   <asp:Repeater ID="JobCardRepeater" runat="server">
                        <ItemTemplate>
                            <!-- Job Info Column -->
                            <div class="job-card mb-4 p-4 position-relative">
                                <div class="row align-items-center">
                                    <div class="col-md-4 d-flex">
                                        <div class="job-info">
                                            <div class="badge <%# GetBadgeClass(Eval("JobType").ToString()) %> text-white mb-2">
                                                <%# Eval("JobType") %>
                                            </div>
                                            <a href='<%# Eval("JobLink") %>' class="job-title h5 text-dark mb-1 d-block">
                                                <%# Eval("JobTitle") %>
                                            </a>
                                            <p class="job-meta text-muted">
                                                Publisher: <strong><%# Eval("Publisher") %></strong>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <p class="job-location mb-0"><strong>Location</strong><br /> <%# Eval("JobLocation") %></p>
                                    </div>
                                    <div class="col-md-2">
                                        <p class="job-vacancy mb-0"><strong>Vacancies</strong><br /> <%# Eval("VacancyCount") %></p>
                                    </div>
                                    <div class="col-md-2">
                                        <p class="job-salary mb-0"><strong>Salary</strong><br /> <%# Eval("SalaryRange") %></p>
                                    </div>
                                    <div class="col-md-2 text-end">
                                        <asp:Button runat="server" CssClass="btn btn-warning px-4" Text="Apply" CommandArgument='<%# Eval("JobId") %>' OnClick="ApplyJob_Click" />
                                    </div>
                                </div>
                                <!-- Job Description -->
                                <div class="row w-75">
                                    <div class="col-md-12">
                                        <p class="job-description mb-0"><strong>Description</strong><br /></p>
                                        <asp:Label CssClass="job-description-text text-muted" runat="server" Text='<%# Eval("JobDescription") %>'></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <hr />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </section>


        <!-- Detail Section -->
        <section class="site-section py-4 mb-5 border-top">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-12 text-center mt-4 mb-5">
                        <div class="row justify-content-center">
                            <div class="col-md-7">
                                <h2 class="section-title mb-2">Our Candidates Work In Company</h2>
                                <p class="lead">Porro error reiciendis commodi beatae omnis similique voluptate rerum ipsam fugit
                                    mollitia ipsum facilis expedita tempora suscipit iste
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3 col-md-6 text-center">
                        <img src="../images/logo_mailchimp.svg" alt="Image" class="img-fluid logo-1"/>
                    </div>
                    <div class="col-6 col-lg-3 col-md-6 text-center">
                        <img src="../images/logo_paypal.svg" alt="Image" class="img-fluid logo-2"/>
                    </div>
                    <div class="col-6 col-lg-3 col-md-6 text-center">
                        <img src="../images/logo_stripe.svg" alt="Image" class="img-fluid logo-3"/>
                    </div>
                    <div class="col-6 col-lg-3 col-md-6 text-center">
                        <img src="../images/logo_visa.svg" alt="Image" class="img-fluid logo-4"/>
                    </div>
                </div>
            </div>
        </section>


        <!-- Signup Section -->
        <section class="py-5" style="background: #1442b3;">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-10">
                        <h2 class="text-white">Looking For A Job?</h2>
                        <p class="mb-0 text-white lead">Lorem ipsum dolor sit amet consectetur adipisicing elit tempora adipisci
                            impedit.
                        </p>
                    </div>
                    <div class="col-md-2">
                        <a href="Registration.aspx" class="btn btn-warning btn-block btn-lg ps-5 pe-5">Sign Up</a>
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

    <!-- Including Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-rpUCW+2UNqaBLsl/XzrvUL15NFyKLOnhC5nMrCgvM9kg2MKs/JQdci9saRI4G8jI" crossorigin="anonymous"></script>

</body>
</html>
