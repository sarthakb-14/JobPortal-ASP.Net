<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateJob.aspx.cs" Inherits="JobPortal.UpdateJob" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Job</title>
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
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h1 class="text-center mb-4">Update Jobs</h1>
            <div class="row" id="job-list">
                <asp:Repeater ID="jobRepeater" runat="server">
                    <ItemTemplate>
                        <div class='col-md-4 mb-4'>
                            <div class='card'>
                                <div class='card-header'>
                                    <asp:TextBox ID="txtJobTitle" runat="server" Text='<%# Eval("jobtitle") %>' CssClass="form-control" />
                                </div>
                                <div class='card-body'>
                                    <p class='card-text'>
                                        <strong>Job Description:</strong> 
                                        <asp:TextBox ID="txtJobJD" runat="server" Text='<%# Eval("jobJD") %>' CssClass="form-control" TextMode="MultiLine" />
                                    </p>
                                    <p class='card-text'>
                                        <strong>Salary:</strong> 
                                        <asp:TextBox ID="txtJobSalary" runat="server" Text='<%# Eval("jobsalary") %>' CssClass="form-control" />
                                    </p>
                                    <p class='card-text'>
                                        <strong>Vacancy:</strong> 
                                        <asp:TextBox ID="txtJobVacancy" runat="server" Text='<%# Eval("jobvacancy") %>' CssClass="form-control" />
                                    </p>
                                    <p class='card-text'>
                                        <strong>Employment Status:</strong> 
                                        <asp:DropDownList ID="ddlJobStatus" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="Full-Time" Text="Full-Time"></asp:ListItem>
                                            <asp:ListItem Value="Part-Time" Text="Part-Time"></asp:ListItem>
                                            <asp:ListItem Value="Contract" Text="Contract"></asp:ListItem>
                                            <asp:ListItem Value="Internship" Text="Internship"></asp:ListItem>
                                        </asp:DropDownList>
                                    </p>
                                    <p class='card-text'>
                                        <strong>Experience:</strong> 
                                        <asp:TextBox ID="txtJobExperience" runat="server" Text='<%# Eval("jobexperience") %>' CssClass="form-control" />
                                    </p>
                                    <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                                        CommandArgument='<%# Eval("jobId") %>' OnCommand="btnUpdate_Command" CssClass="btn btn-primary" />
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
