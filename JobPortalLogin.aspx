<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobPortalLogin.aspx.cs" Inherits="JobPortal.JobPortalLogin" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Portal - Select Role</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('images/bg_login.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #ffffff;
            margin: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            padding: 0; /* Remove default padding */
        }

        /* Dark Overlay for background */
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 136%;
            background-color: rgb(0 25 65 / 20%);
            z-index: 0;
        }

        .card-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            max-width: 1200px;
            margin-top: 80px; /* Space from the top */
            margin-bottom: 30px; /* Space between cards and form */
        }

        .role-card {
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            width: 300px;
            padding: 40px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.2s ease;
            cursor: pointer;
            text-decoration: none;
            color: inherit;
            margin: 0 15px; /* Space between cards */
        }

        .role-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            color: skyblue;
        }

        .role-card i {
            font-size: 3rem;
            color: white;
            margin-bottom: 20px;
        }

        .role-card h3 {
            margin-bottom: 10px;
            font-size: 1.5rem;
            font-weight: 600;
        }

        .role-card p {
            color: white;
        }

        .dynamic-content {
            display: none; /* Hidden by default */
            width: 100%;
            max-width: 1200px;
            margin-top: 30px; /* Space above the form */
            text-align: center; /* Center the form */
            padding-bottom: 60px;
            padding-top: 30px;
        }

        .login-card {
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 400px;
            margin: auto; /* Center the form */
        }

        .login-card h2 {
            margin-bottom: 30px;
            font-size: 2rem;
            color: white;
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

        .login-card .small-link {
            display: block;
            margin-top: 15px;
            text-align: center;
            color: #6bb2ff;
        }

        .login-card .small-link:hover {
            text-decoration: underline;
        }

        .button {
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
        }

        .button:hover {
          background-color: #007bff;
          cursor: pointer;
          color: #fff;
        }

        .button:focus {
          outline: none;
          box-shadow: none;
        }
    </style>

    <script>
        function loadLoginForm(role) {
            document.querySelector('.dynamic-content').style.display = 'block';

            // Set hidden field value based on role
            document.getElementById('roleHiddenField').value = role;

            // Change the form heading and link based on role
            var formHeading = document.querySelector('.login-card h2');
            var registerLink = document.querySelector('.small-link');
            if (role === 'Student') {
                formHeading.innerText = 'Student Login';
                registerLink.href = 'Registration.aspx';
                registerLink.innerHTML = "Don't have an account? <strong>Register</strong>";
                registerLink.style.display = 'block';  // Show the link
            } else if (role === 'Company') {
                formHeading.innerText = 'Company Login';
                registerLink.href = 'Registration.aspx';
                registerLink.innerHTML = "Don't have an account? <strong>Register as Company</strong>";
                registerLink.style.display = 'block';  // Show the link
            } else if (role === 'Admin') {
                formHeading.innerText = 'Admin Login';
                registerLink.href = '#';  // Admin may not need a register link
                registerLink.style.display = 'none';  // Hide register link for admin
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card-container">
            <!-- Student Card -->
            <div class="role-card" onclick="loadLoginForm('Student')">
                <i class="fas fa-user-graduate"></i>
                <h3>Student</h3>
                <p>Login as a Student to apply for jobs.</p>
            </div>

            <!-- Company Card -->
            <div class="role-card" onclick="loadLoginForm('Company')">
                <i class="fas fa-building"></i>
                <h3>Company</h3>
                <p>Login as a Company to post jobs.</p>
            </div>

            <!-- Admin Card -->
            <div class="role-card" onclick="loadLoginForm('Admin')">
                <i class="fas fa-user-shield"></i>
                <h3>Admin</h3>
                <p>Login as an Admin to manage the portal.</p>
            </div>
        </div>

        <!-- Hidden field to store role -->
        <asp:HiddenField ID="roleHiddenField" runat="server" />

        <!-- Container for the dynamically loaded login form -->
        <div class="dynamic-content">
            <div class="login-card">
                <h2>Student Login</h2> <!-- This will dynamically change based on role -->
                <div class="form-group">
                    <asp:TextBox ID="UsernameTextBox" runat="server" CssClass="form-control" Placeholder="Username/Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UsernameRequired" runat="server" ControlToValidate="UsernameTextBox" ErrorMessage="Username/Email is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="PasswordTextBox" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="PasswordTextBox" ErrorMessage="Password is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <asp:Button ID="LoginButton" runat="server" Text="Login" CssClass="button" OnClick="LoginButton_Click" />
                <a href="Registration.aspx" class="small-link">Don't have an account? <strong>Register</strong></a>
            </div>
        </div>
    </form>
</body>
    <script type="text/javascript">
		window.history.forward();
		function noBack() {
			window.history.forward();
		}
	</script>
</html>
