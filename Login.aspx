<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="JobPortal.Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Portal - Login</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Muli:wght@400;600&display=swap" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    
    <style>
        /* General Styling */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #000428, #004e92);
            color: #ffffff;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Login Card Styling */
        .login-card {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 400px;
        }

        .login-card h3 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
        }

        .login-card .form-control {
            background-color: rgba(255, 255, 255, 0.1);
            border: 1px solid #007bff;
            color: white;
        }

        .login-card .form-control::placeholder {
            color: #dcdcdc;
        }

        .login-card .btn {
            background: linear-gradient(135deg, #007bff, #004e92);
            border: none;
            color: white;
            width: 100%;
            padding: 10px;
            text-transform: uppercase;
            font-size: 14px;
            font-weight: 500;
            transition: background 0.4s linear;
            margin-top: 20px;
        }

        .login-card .btn:hover {
            background: linear-gradient(135deg, #004e92, #007bff);
        }

        .login-card .forgot-password {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }

        .login-card .forgot-password a {
            color: #007bff;
            text-decoration: none;
        }

        .login-card .forgot-password a:hover {
            text-decoration: underline;
        }

        /* Footer Styling */
        .footer {
            padding: 20px;
            background-color: #1f1f1f;
            color: #dcdcdc;
            text-align: center;
            position: absolute;
            bottom: 0;
            width: 100%;
        }

        .footer a {
            color: #007bff;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Login Card Section -->
        <div class="login-card">
            <h3>Login to Job Portal</h3>
            <div class="form-group">
                <input type="text" class="form-control" id="username" placeholder="Username" />
            </div>
            <div class="form-group">
                <input type="password" class="form-control" id="password" placeholder="Password" />
            </div>
            <asp:Button runat="server" CssClass="btn" Text="Login" />
            <div class="forgot-password">
                <a href="#">Forgot your password?</a>
            </div>
        </div>

        <!-- Footer -->
        <footer class="footer">
            <p>&copy; 2024 Job Portal. All rights reserved.</p>
            <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a>
        </footer>
    </form>

    <!-- Bootstrap JS and Dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

