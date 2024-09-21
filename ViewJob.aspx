<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewJob.aspx.cs" Inherits="JobPortal.ViewJob" %>

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
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">View Jobs</h1>
        <div class="row" id="job-list">
            <!-- Job details will be populated here -->
            <asp:Literal ID="jobList" runat="server"></asp:Literal>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
