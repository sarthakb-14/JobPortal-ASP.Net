﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewJob.aspx.cs" Inherits="JobPortal.ViewJob" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Job</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #343a40; /* Dark background */
            color: white; /* White text */
        }
        .card {
            transition: transform 0.2s;
            border: none;
            border-radius: 10px;
            background-color: #495057; /* Darker card background */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
        }
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.4);
        }
        .card-title {
            color: #61dafb; /* Light blue title */
            font-size: 1.25rem;
            font-weight: bold;
        }
        .card-text {
            font-size: 0.9rem;
        }
        .card-header {
            background-color: #007bff; /* Blue header */
            color: white;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .bg {
          animation: slide 3s ease-in-out infinite alternate;
          background-image: linear-gradient(-60deg, #003300 50%, #006600 50%);
          bottom: 0;
          left: -50%;
          opacity: .5;
          position: fixed;
          right: -50%;
          top: 0;
          z-index: -1;
        }

        .bg2 {
          animation-direction: alternate-reverse;
          animation-duration: 4s;
        }

        .bg3 {
          animation-duration: 5s;
        }

        .content {
          background-color: rgba(255, 255, 255, .8);
          border-radius: .25em;
          box-shadow: 0 0 .25em rgba(0, 0, 0, .25);
          box-sizing: border-box;
          left: 50%;
          padding: 10vmin;
          position: fixed;
          text-align: center;
          top: 50%;
          transform: translate(-50%, -50%);
        }



        @keyframes slide {
          0% {
            transform: translateX(-25%);
          }
          100% {
            transform: translateX(25%);
          }
        }
    </style>
</head>
<body>
    <div class="bg"></div>
    <div class="bg bg2"></div>
    <div class="bg bg3"></div>
    <div class="container mt-5">
        <h1 class="text-center mb-4">View Jobs</h1>
        <div class="row" id="job-list">
            <asp:Repeater ID="jobRepeater" runat="server">
                <ItemTemplate>
                    <div class='col-md-4 mb-4'>
                        <div class='card'>
                            <div class='card-header'>
                                <%# Eval("jobtitle") %>
                            </div>
                            <div class='card-body'>
                                <p class='card-text'><strong>Job Description:</strong> <%# Eval("jobJD") %></p>
                                <p class='card-text'><strong>Salary:</strong> <%# Eval("jobsalary") %></p>
                                <p class='card-text'><strong>Vacancy:</strong> <%# Eval("jobvacancy") %></p>
                                <p class='card-text'><strong>Employment Status:</strong> <%# Eval("jobemployeementstatus") %></p>
                                <p class='card-text'><strong>Experience:</strong> <%# Eval("jobexperience") %></p>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                
            </asp:Repeater>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
