<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="JobPortal.AdminDashboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <!-- Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

    <style>
        /* Darker Blue Gradient Animation */
        html {
            height: 100%;
        }

        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
            color: #ffffff;
            padding: 0;
        }

        .bg {
            animation: slide 3s ease-in-out infinite alternate;
            background-image: linear-gradient(-60deg, #0a0e1e 50%, #121d45 50%);
            bottom: 0;
            left: -50%;
            opacity: .8;
            position: fixed;
            right: -50%;
            top: 0;
            z-index: -1;
        }
        
        .bg2 {
            animation-direction: alternate-reverse;
            animation-duration: 4s;
            background-image: linear-gradient(-60deg, #091228 50%, #0f2557 50%);
        }
        
        .bg3 {
            animation-duration: 5s;
            background-image: linear-gradient(-60deg, #0f2557 50%, #0a1b40 50%);
        }

        @keyframes slide {
            0% {
                transform: translateX(-25%);
            }
            100% {
                transform: translateX(25%);
            }
        }

        /* Additional styles for the dashboard */
        .Heading {
            margin-top: 5px;
        }

        .logout-btn {
            background-color: transparent;
            color: #fff;
            width: 7em;
            height: 2.5em;
            border: 0.2em solid #007bff;
            border-radius: 11px;
            text-align: center;
            transition: all 0.6s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0 1em;
            position: relative;
            font-weight: bold;
            letter-spacing: 1px;
            margin-left: 13px;
        }

        .logout-btn:hover {
            background-color: #007bff;
            cursor: pointer;
            color: #fff;
        }

        .dashboard-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            max-width: 1200px;
            margin-top: 20px;
            z-index: 1;
        }

        .dashboard-card {
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(40px);
            width: 300px;
            height: 275px;
            padding: 40px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.2s ease;
            cursor: pointer;
            text-decoration: none;
            color: inherit;
            margin: 15px;
        }

        .dashboard-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            border: 2px solid lightskyblue;
        }

        .dashboard-card i {
            font-size: 3rem;
            color: white;
            margin-bottom: 20px;
        }

        .dashboard-card h3 {
            margin-bottom: 10px;
            font-size: 1.8rem;
            font-weight: 600;
            color: white;
        }

        .dashboard-card p {
            color: white;
        }

        .dashboard-card:hover h3 {
            color: lightskyblue;
        }

        .stats-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            z-index: 1;
        }

        .stats-card {
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(40px);
            width: 226px;
            height: 118px;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 10px;
            transition: all 0.2s ease;
        }

        .stats-card:hover {
           
            box-shadow: 0 6px 12px #091228;
        }

        .stats-card h4 {
            font-size: 1.5rem;
            margin-bottom: 10px;
            color: #ffffff;
        }

        .stats-card p {
            font-size: 2rem;
            color: #ffffff;
            font-weight: bold;
        }

        .profile-container {
            position: absolute;
            top: 20px;
            right: 20px;
            z-index: 1;
            display: flex;
            align-items: center;
            color: white;
        }

        .profile-icon {
            font-size: 2rem;
            margin-right: 10px;
        }

        @media (max-width: 992px) {
            .dashboard-container, .stats-container {
                flex-direction: column;
                align-items: center;
            }

            .dashboard-card, .stats-card {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <div class="bg"></div>
    <div class="bg bg2"></div>
    <div class="bg bg3"></div>

    <div class="Heading"><h2></h2></div>

    <div class="profile-container">
        <i class="fas fa-user-circle profile-icon"></i>
        <asp:Label ID="lblAdminName" runat="server" Text=""></asp:Label>
        <button class="logout-btn" onclick="logout()">Logout</button>
    </div>

    <form id="form1" runat="server">
        <div class="dashboard-container">
            <div class="dashboard-card" onclick="window.location.href='../SearchAll.aspx?aid=<%= Request.QueryString["aid"] %>&aname=<%= Request.QueryString["aname"] %>';">
                <i class="fas fa-search"></i>
                <h3>Search</h3>
                <p>Company Details, Student Details, Total Job Posting, Total Company</p>
            </div>

            <div class="dashboard-card" onclick="window.location.href='../ManageStudents.aspx?aid=<%= Request.QueryString["aid"] %>&aname=<%= Request.QueryString["aname"] %>';">
                <i class="fas fa-user-graduate"></i>
                <h3>Manage Students</h3>
                <p>View and manage student details and applications</p>
            </div>

            <div class="dashboard-card" onclick="window.location.href='../ManageCompanies.aspx?aid=<%= Request.QueryString["aid"] %>&aname=<%= Request.QueryString["aname"] %>';">
                <i class="fas fa-building"></i>
                <h3>Manage Companies</h3>
                <p>View and manage company details and job postings</p>
            </div>

            <div class="stats-container">
                <div class="stats-card">
                    <h4>Companies</h4>
                    <p><asp:Label ID="lblCompanies" runat="server" Text="0"></asp:Label></p>
                </div>

                <div class="stats-card">
                    <h4>Jobs Posted</h4>
                    <p><asp:Label ID="lblJobsPosted" runat="server" Text="0"></asp:Label></p>
                </div>

                <div class="stats-card">
                    <h4>Candidates</h4>
                    <p><asp:Label ID="lblApplicants" runat="server" Text="0"></asp:Label></p>
                </div>
            </div>
        </div>
    </form>

    <script>
        function logout() {
            window.location.href = '../JobPortalLogin.aspx';
        }

        $(document).ready(function () {
            var text = "Admin Dashboard";
            var index = 0;

            function typeWriter() {
                if (index < text.length) {
                    $('.Heading h2').append(text.charAt(index));
                    index++;
                    setTimeout(typeWriter, 100);
                } else {
                    setTimeout(function () {
                        $('.Heading h2').text('');
                        index = 0;
                        typeWriter();
                    }, 2500);
                }
            }

            typeWriter();
        });
    </script>
</body>
</html>
