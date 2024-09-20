<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateJob.aspx.cs" Inherits="JobPortal.UpdateJob" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Job</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('images/bg_dashboard.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #ffffff;
        }

        .container {
            max-width: 800px;
            margin-top: 50px;
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            color: white;
        }

        h1 {
            font-size: 2.5rem;
            font-weight: bold;
            color: #ffffff;
            text-align: center;
            margin-bottom: 40px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .form-control {
            margin-bottom: 20px;
            background-color: rgba(255, 255, 255, 0.1);
            border: 1px solid #007bff;
            color: white;
        }

        label {
            font-size: 1.1rem;
            font-weight: 500;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        /* Hide the update form initially */
        .update-form {
            display: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Enter Job ID</h1>

            <!-- Job ID Input -->
            <div class="form-group">
                <label for="JobIDTextBox">Job ID</label>
                <asp:TextBox ID="JobIDTextBox" runat="server" CssClass="form-control" Placeholder="Enter Job ID" />

            </div>

            <!-- Submit Button -->
            <div class="text-center">
            <asp:Button ID="SubmitButton" runat="server" CssClass="btn btn-primary btn-lg" Text="Submit" OnClick="SubmitButton_Click" />

            </div>
        </div>

        <!-- Update Job Form -->
        <div class="container update-form" id="updateForm">
            <h1>Update Job</h1>

            <!-- Job Title -->
            <div class="form-group">
                <label for="JobTitleTextBox">Job Title</label>
                <asp:TextBox ID="JobTitleTextBox" runat="server" CssClass="form-control" Placeholder="Enter Job Title"></asp:TextBox>
            </div>

            <!-- Experience -->
            <div class="form-group">
                <label for="ExperienceTextBox">Experience</label>
                <asp:TextBox ID="ExperienceTextBox" runat="server" CssClass="form-control" Placeholder="Enter Experience Required"></asp:TextBox>
            </div>

            <!-- Salary -->
            <div class="form-group">
                <label for="SalaryTextBox">Salary</label>
                <asp:TextBox ID="SalaryTextBox" runat="server" CssClass="form-control" Placeholder="Enter Salary"></asp:TextBox>
            </div>

            <!-- Deadline -->
            <div class="form-group">
                <label for="DeadlineTextBox">Deadline</label>
                <asp:TextBox ID="DeadlineTextBox" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>

            <!-- Vacancy -->
            <div class="form-group">
                <label for="VacancyTextBox">Vacancy</label>
                <asp:TextBox ID="VacancyTextBox" runat="server" CssClass="form-control" TextMode="Number" Placeholder="Enter Vacancy"></asp:TextBox>
            </div>

            <!-- Employment Status -->
            <div class="form-group">
                <label for="EmploymentStatusDropDown">Employment Status</label>
                <asp:DropDownList ID="EmploymentStatusDropDown" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Fulltime" Value="Fulltime"></asp:ListItem>
                    <asp:ListItem Text="Part-time" Value="Part-time"></asp:ListItem>
                    <asp:ListItem Text="Internship" Value="Internship"></asp:ListItem>
                    <asp:ListItem Text="Contract" Value="Contract"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Job Description -->
            <div class="form-group">
                <label for="JobDescriptionTextBox">Job Description</label>
                <asp:TextBox ID="JobDescriptionTextBox" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" Placeholder="Enter Job Description"></asp:TextBox>
            </div>

            <!-- Update Button -->
            <div class="text-center">
                <asp:Button ID="UpdateButton" runat="server" CssClass="btn btn-primary btn-lg" Text="Update" OnClick="UpdateButton_Click" />
            </div>
        </div>
    </form>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

    <script type="text/javascript">
        // JavaScript function to show the update form
        function showUpdateForm() {
            var jobID = document.getElementById("JobIDTextBox").value;

            if (jobID) {
                // Show the update form if Job ID is provided
                document.getElementById("updateForm").style.display = "block";
            } else {
                // Hide the update form if no Job ID is entered
                document.getElementById("updateForm").style.display = "none";
                alert("Please enter a Job ID");
            }
        }
    </script>
</body>
</html>
