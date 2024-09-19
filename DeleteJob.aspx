<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteJob.aspx.cs" Inherits="JobPortal.DeleteJob" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Job</title>
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
        h6{
            
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Delete Job</h1>

            <h6>Enter any one of the following to delete!</h6>
            <!-- Job ID -->
            <div class="form-group">
                <label for="JobIDTextBox">Job ID</label>
                <asp:TextBox ID="JobIDTextBox" runat="server" CssClass="form-control" Placeholder="Enter Job ID"></asp:TextBox>
            </div>
            
            <!-- Job Title -->
            <div class="form-group">
                <label for="JobTitleTextBox">Job Title</label>
                <asp:TextBox ID="JobTitleTextBox" runat="server" CssClass="form-control" Placeholder="Enter Job Title"></asp:TextBox>
            </div>


            <!-- Delete Button -->
            <div class="text-center">
                <asp:Button ID="DeleteButton" runat="server" CssClass="btn btn-primary btn-lg" Text="Delete" OnClick="DeleteButton_Click" />
            </div>
        </div>
    </form>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
