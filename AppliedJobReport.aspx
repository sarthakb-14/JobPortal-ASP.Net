<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppliedJobReport.aspx.cs" Inherits="JobPortal.AppliedJobReport" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Applied Job Report</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Body background and text */
        body {
            background-color: #212529; /* Darker theme background */
            color: white; /* White text for readability */
        }
        /* Styling the card */
        .card {
            background-color: #343a40; /* Dark card background */
            border: none; /* Remove border */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Card shadow */
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }
        .card:hover {
            transform: translateY(-10px); /* Lift effect on hover */
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3); /* Increase shadow on hover */
        }
        /* Card title styling */
        .card-title {
            color: #ffc107; /* Yellow title */
            font-weight: bold;
            font-size: 1.25rem;
        }
        /* Container and row layout */
        .container {
            max-width: 1200px; /* Max container width */
            padding-top: 2rem; /* Padding at the top */
        }
        .row {
            display: flex;
            justify-content: space-between; /* Space between cards */
        }
        /* Adding hover effect for company name */
        .card-text:hover {
            color: #17a2b8; /* Interactive hover color for text */
            transition: color 0.2s ease-in-out;
        }
        /* Page title */
        h1 {
            font-size: 2.5rem;
            font-weight: bold;
            margin-bottom: 2rem;
            color: #ffffff;
            text-transform: uppercase;
            letter-spacing: 2px;
            border-bottom: 2px solid #ffc107;
            display: inline-block;
            padding-bottom: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h1 class="text-center">Applied Job Report</h1>
            <div class="row">
                <asp:Repeater ID="rptAppliedJobs" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4 mb-4">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("jobtitle") %></h5>
                                    <p class="card-text">Company: <%# Eval("cname") %></p>
                                    <p class="card-text">Student Name: <%# Eval("sname") %></p>
                                    <p class="card-text">Application ID: <%# Eval("applyid") %></p>
                                    <p class="card-text">Student ID: <%# Eval("sid") %></p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
