<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactPage.aspx.cs" Inherits="JobPortal.ContactPage" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Job Portal</title>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">

    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <!-- Custom CSS -->
    <style>
        /* Base Styles */
        body {
            margin: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", "Roboto", "Oxygen", "Ubuntu", "Cantarell", "Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            background-color: rgb(22, 20, 24);
            color: #eee;
            user-select: none;
        }

        h1,
        h2 {
            font-weight: 700;
        }

        .container {
            padding-top: 50px;
        }

        /* Home Button */
        .home-btn {
            background-color: #17a2b8;
            border: none;
            padding: 10px 20px;
            font-size: 18px;
            border-radius: 50px;
            position: fixed;
            top: 20px;
            left: 20px;
            color: white;
            text-transform: uppercase;
            font-weight: bold;
            z-index: 1000;
        }

        .tech-container {
            display: flex;
            width: 100%;
        }

        .home-btn:hover {
            background-color: #138496;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4);
        }

        /* NFT Card Styles */
        .nft {
            user-select: none;
            width: 300px; /* Card width */
            margin: 1rem auto; /* Added margin for spacing between cards */
            border: 1px solid #ffffff22;
            background-color: #282c34;
            background: linear-gradient(0deg, rgba(40, 44, 52, 1) 0%, rgba(17, 0, 32, .5) 100%);
            box-shadow: 0 7px 20px 5px #00000088;
            border-radius: .7rem;
            backdrop-filter: blur(7px);
            overflow: hidden;
            transition: .5s all;
            display: flex;
            flex-direction: column;
            justify-content: space-between; /* Ensure equal height */
        }

        .nft:hover {
            border: 1px solid #ffffff44;
            box-shadow: 0 7px 50px 10px #000000aa;
            transform: scale(1.015);
            filter: brightness(1.3);
            position: relative;
        }

        .main {
            display: flex;
            flex-direction: column;
            width: 100%;
            padding: 1rem;
        }

        .tokenImage {
            border-radius: .5rem;
            max-width: 100%;
            height: 250px;
            object-fit: cover;
            filter: grayscale(100%); /* Set to black and white */
            transition: filter 0.5s ease; /* Smooth transition for the filter effect */
        }

        .tokenImage:hover {
            filter: grayscale(0%); /* Change to color on hover */
        }

        .description {
            margin: .5rem 0;
            color: #a89ec9;
        }

        .tokenInfo {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* Technologies Section */
        .tech-section {
            padding: 60px 0;
            background-color: #1a1a1a;
        }

        .tech-title {
            text-align: center;
            font-size: 1.8rem;
            font-weight: 700;
            color: #17a2b8;
        }

        footer {
            background-color: #282c34;
            padding: 20px 0;
            color: #aaa;
            text-align: center;
        }

        .footer-links {
            margin: 20px 0;
        }

        .footer-links a {
            color: #17a2b8;
            text-decoration: none;
            margin: 0 15px;
        }

        .footer-links a:hover {
            text-decoration: underline;
        }

        .social-icons {
            margin: 10px 0;
        }

        .social-icons i {
            font-size: 24px;
            color: #17a2b8;
            margin: 0 10px;
        }

        .social-icons i:hover {
            color: #138496;
        }

        .row {
            display: -ms-flexbox;
            display: flex;
            -ms-flex-wrap: wrap;
            margin-right: -15px;
            margin-left: 51px;
            width: 91%;
            flex-wrap: nowrap;
            justify-content: center;
        }
    </style>
</head>

<body>

    <!-- Home Button -->
    <button class="home-btn" onclick="window.location.href='LandingPage.aspx'">
        <i class="fas fa-home"></i> Job Portal
    </button>

    <!-- Header Section -->
    <header class="text-center" style="background-color: #1a1a1a; padding: 50px;">
        <h1>About Us</h1>
        <p>Meet the team and technologies behind our job portal</p>
    </header>

    <!-- Team Section -->
<section class="team-section container">
    <div class="row">
        <!-- Team Member 1 -->
        <div class="col-md-4">
            <div class="nft">
                <div class="main">
                    <img class="tokenImage" src="images/roshan1.jpg" alt="Roshan Kumar">
                    <h2>Roshan Kumar</h2>
                    <p class="description">Associate Software Engineer</p>
                    <div class="tokenInfo">
                        <div class="price">
                            <a href="mailto:Roshan.Kumar@finthrive.com" style="color: #17a2b8; text-decoration: none;">Roshan.Kumar@finthrive.com</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Team Member 2 -->
        <div class="col-md-4">
            <div class="nft">
                <div class="main">
                    <img class="tokenImage" src="images/utkarsh1.png" alt="Utkarsh Singh">
                    <h2>Utkarsh Singh</h2>
                    <p class="description">Associate Software Enginee</p>
                    <div class="tokenInfo">
                        <div class="price">
                            <a href="mailto:Utkarsh.Singh@finthrive.com" style="color: #17a2b8; text-decoration: none;">Utkarsh.Singh@finthrive.com</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Team Member 3 -->
        <div class="col-md-4">
            <div class="nft">
                <div class="main">
                    <img class="tokenImage" src="images/sarthak1.jpg" alt="Sarthak Bhardwaj">
                    <h2>Sarthak Bhardwaj</h2>
                    <p class="description">Associate Software Enginee</p>
                    <div class="tokenInfo">
                        <div class="price">
                            <a href="mailto:Sarthak.Bhardwaj@finthrive.com" style="color: #17a2b8; text-decoration: none;">Sarthak.Bhardwaj@finthrive.com</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Team Member 4 -->
        <div class="col-md-4">
            <div class="nft">
                <div class="main">
                    <img class="tokenImage" src="images/Devansh.jpg" alt="Devansh Sati">
                    <h2>Devansh Sati</h2>
                    <p class="description">Associate Software Enginee</p>
                    <div class="tokenInfo">
                        <div class="price">
                            <a href="mailto:Devansh.Sati@finthrive.com" style="color: #17a2b8; text-decoration: none;">Devansh.Sati@finthrive.com</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


    <!-- Technologies Section -->
    <section class="tech-section">
        <h2 class="tech-title">Technologies We Use</h2>
        <div class="tech-container">
            <!-- ASP.NET -->
            <div class="nft">
                <div class="main">
                    <i class="fab fa-microsoft" style="font-size: 100px; color: #17a2b8;"></i>
                    <h2>ASP.NET</h2>
                    <p class="description">Web Framework</p>
                    <div class="tokenInfo">
                        <div class="price">Used For: Backend Development</div>
                    </div>
                </div>
            </div>

            <!-- C# -->
            <div class="nft">
                <div class="main">
                    <i class="fab fa-microsoft" style="font-size: 100px; color: #17a2b8;"></i>
                    <h2>C#</h2>
                    <p class="description">Programming Language</p>
                    <div class="tokenInfo">
                        <div class="price">Used For: Application Development</div>
                    </div>
                </div>
            </div>

            <!-- SQL -->
            <div class="nft">
                <div class="main">
                    <i class="fas fa-database" style="font-size: 100px; color: #17a2b8;"></i>
                    <h2>SQL</h2>
                    <p class="description">Database Language</p>
                    <div class="tokenInfo">
                        <div class="price">Used For: Data Management</div>
                    </div>
                </div>
            </div>

            <!-- GitHub -->
            <div class="nft">
                <div class="main">
                    <i class="fab fa-github" style="font-size: 100px; color: #17a2b8;"></i>
                    <h2>GitHub</h2>
                    <p class="description">Version Control</p>
                    <div class="tokenInfo">
                        <div class="price">Used For: Code Collaboration</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="footer-links">
            <a href="#">Privacy Policy</a>
            <a href="#">Terms of Service</a>
        </div>
        <div class="social-icons">
            <i class="fab fa-facebook"></i>
            <i class="fab fa-twitter"></i>
            <i class="fab fa-linkedin"></i>
        </div>
        <p>&copy; 2024 Job Portal. All rights reserved.</p>
    </footer>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
