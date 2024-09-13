<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="JobPortal.Login" %>


<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Job Portal</title>
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
            background: url('https://images.pexels.com/photos/840996/pexels-photo-840996.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1') no-repeat center center fixed;
            background-size: cover;
            color: #ffffff;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* Dark Overlay for background */
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, -98, 75, 0.8);
            z-index: 0;
        }

        /* Transparent Card Styling */
        .login-card {
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(3px);
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            position: relative;
            z-index: 1;
            width: 100%;
            max-width: 400px;
        }

        .login-card h2 {
            margin-bottom: 30px;
            font-size: 2rem;
            color: white;
            text-align: center;
        }

        .login-card .form-control {
            background-color: rgba(255, 255, 255, 0.1);
            border: 1px solid #007bff;
            color: white;
            margin-bottom: 20px;
        }

        .login-card .form-control::placeholder {
            color: #dcdcdc;
        }

        /* Gradient Button */
        .login-card .btn {
            background: linear-gradient(135deg, #007bff, #004e92);
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            border-radius: 5px;
            text-transform: uppercase;
            font-weight: 500;
            letter-spacing: 1px;
            transition: background 0.4s linear;
        }

        .login-card .btn:hover {
            background: linear-gradient(135deg, #004e92, #007bff);
        }

        /* Small Link Styling */
        .login-card .small-link {
            display: block;
            margin-top: 15px;
            text-align: center;
            color: #007bff;
        }

        .login-card .small-link:hover {
            text-decoration: underline;
        }

        /* Remove default focus outline for buttons */
        .login-card .btn:focus {
            outline: none;
            box-shadow: none;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Login Card Section -->
        <div class="login-card">
            <h2>Login</h2>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Username" />
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="Password" />
            </div>
            <button type="submit" class="btn">Login</button>
            <a href="#" class="small-link">Forgot Password?</a>
        </div>
    </form>
</body>
</html>

