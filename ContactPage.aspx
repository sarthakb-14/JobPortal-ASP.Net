<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactPage.aspx.cs" Inherits="JobPortal.ContactPage" %>


 
<!DOCTYPE html>
<html lang="en">
<head runat="server">
<title>Contact Us</title>
<link rel="stylesheet" type="text/css" href="Styles/site.css" />
<style>
        body {
            background: #000000; /* Solid black background */
            color: white;
            font-family: Arial, sans-serif;
            margin: 0; /* Reset margin */
        }
 
        .container {
            max-width: 1300px;
            margin: 10px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.1);
        }
 
        h1, h2 {
            color: #1e90ff; /* Blue color for headings */
            margin-bottom: 10px;
        }
 
        .about-us, .team-photos {
            margin-bottom: 30px;
        }
 
        .team-photos {
            display: flex;
            flex-direction: column; /* Stack header and cards */
            margin-top: 20px;
        }
 
        .team-header {
            text-align: center; /* Center align the header */
            margin-bottom: 20px; /* Space below the header */
        }
 
        .team-cards {
            display: flex;
            flex-wrap: wrap; /* Allow wrapping for smaller screens */
            justify-content: space-around; /* Evenly distribute cards */
        }
 
        .team-member {
            background: rgba(0, 0, 0, 0.5); /* Darker background for team cards */
            margin: 10px; /* Adjust margin to fit better */
            text-align: center;
            width: 260px; /* Decreased width for more cards in a row */
            padding: 15px; /* Adjust padding for consistent appearance */
            border-radius: 10px;
            transition: transform 0.3s, box-shadow 0.3s, background 0.3s; /* Animation on hover */
            box-shadow: 0 0 10px rgba(0, 255, 0, 0.3);
        }
 
        .team-member:hover {
            transform: translateY(-5px); /* Lift effect on hover */
            box-shadow: 0 0 20px rgba(30, 144, 255, 0.7); /* Stronger blue shadow on hover */
            background: rgba(30, 144, 255, 0.1); /* Light blue background on hover */
        }
 
        .team-member img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 2px solid #1e90ff; /* Blue border for images */
            margin-bottom: 10px;
        }
 
        p {
            color: #dcdcdc; /* Light gray for paragraphs */
            margin: 5px 0; /* Consistent spacing */
        }
 
        .social-icons {
            margin-top: 10px;
        }
 
        .social-icons a {
            margin: 0 5px;
            color: #1e90ff;
            text-decoration: none;
        }
 
        .footer {
            color: white;
            padding: 20px;
            text-align: center;
            margin-top: 30px;
        }
 
        .footer-content {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
            flex-wrap: wrap; /* Allow wrapping on smaller screens */
        }
 
        .footer-content div {
            max-width: 300px;
        }
</style>
<!-- Include Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
</head>
<body>
<form id="form1" runat="server">
<div class="container">
<h1>Contact Us</h1>
<div class="about-us">
<h2>About Us</h2>
<p>"We are a dedicated team of professionals committed to delivering exceptional services. Our mission is rooted in quality and 
                    innovation, striving to exceed expectations in everything we do. We believe in fostering collaboration 
                    and creativity, ensuring that every solution we provide is tailored 
                    to meet the unique needs of our clients. With a focus on continuous improvement, we are passionate 
                    about pushing boundaries and setting new standards in our industry.".</p>
</div>
 
            <div class="team-photos">
<div class="team-header">
<h2>Meet Our Team</h2>
</div>
<div class="team-cards">
<div class="team-member">
<img src="Images/Devansh.jpg" alt="Team Member 1" />
<h3>Devansh Sati</h3>
<p>Role: Associate Software Engineer</p>
<p>Email: <a href="mailto:devansh.sati@example.com" style="color: #1e90ff;">devansh.sati@example.com</a></p>
<p>Phone: +919090909091</p>
<div class="social-icons">
<a href="https://linkedin.com" target="_blank"><i class="fab fa-linkedin"></i></a>
<a href="https://twitter.com" target="_blank"><i class="fab fa-twitter"></i></a>
<a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
</div>
</div>
<div class="team-member">
<img src="Images/roshan1.jpg" alt="Team Member 2" />
<h3>Roshan Kumar</h3>
<p>Role: Associate Software Engineer</p>
<p>Email: <a href="mailto:roshan.kumar@example.com" style="color: #1e90ff;">roshan.kumar@example.com</a></p>
<p>Phone: +919090909092</p>
<div class="social-icons">
<a href="https://linkedin.com" target="_blank"><i class="fab fa-linkedin"></i></a>
<a href="https://twitter.com" target="_blank"><i class="fab fa-twitter"></i></a>
<a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
</div>
</div>
<div class="team-member">
<img src="Images/sarthak1.jpg" alt="Team Member 3" />
<h3>Sarthak Bhardwaj</h3>
<p>Role: Associate Software Engineer</p>
<p>Email: <a href="mailto:sarthak@example.com" style="color: #1e90ff;">sarthak@example.com</a></p>
<p>Phone: +919090909093</p>
<div class="social-icons">
<a href="https://linkedin.com" target="_blank"><i class="fab fa-linkedin"></i></a>
<a href="https://twitter.com" target="_blank"><i class="fab fa-twitter"></i></a>
<a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
</div>
</div>
<div class="team-member">
<img src="Images/utkarsh1.png" alt="Team Member 4" />
<h3>Utkarsh Singh</h3>
<p>Role: Associate Software Engineer</p>
<p>Email: <a href="mailto:utkarsh.singh@example.com" style="color: #1e90ff;">utkarsh.singh@example.com</a></p>
<p>Phone: +919090909094</p>
<div class="social-icons">
<a href="https://linkedin.com" target="_blank"><i class="fab fa-linkedin"></i></a>
<a href="https://twitter.com" target="_blank"><i class="fab fa-twitter"></i></a>
<a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
</div>
</div>
</div>
</div>
</div>
</form>
 
    <!-- Footer Section -->
<footer class="footer">
<div class="footer-content container">
<div>
<h5>About Us</h5>
<p>Job Portal is a leading platform connecting employers with top talent. We help individuals find their dream jobs while enabling companies to hire the best candidates.</p>
</div>
<div>
<h5>Contact Info</h5>
<p>Email: <a href="mailto:info@jobportal.com" style="color: #1e90ff;">info@jobportal.com</a></p>
<p>Phone: +919090909090</p>
<p>Address: 15th, Finthrive Global, Unitech CyberPark, Gurugram</p>
</div>
</div>
<p>&copy; 2024 Job Portal. All Rights Reserved.</p>
</footer>
</body>
</html>
