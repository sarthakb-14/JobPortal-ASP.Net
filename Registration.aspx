<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="JobPortal.Registration" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Portal - Registration</title>
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
            padding: 0;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 0;
        }

        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 450px;
            margin-top: 80px;
            margin-bottom: 30px;
            margin-left: 0px;
        }

        option {
            color:black;
        }

        .registration-card {
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 500px;
            margin: auto;
            text-align: center;
        }

        .registration-card h2 {
            margin-bottom: 30px;
            font-size: 2rem;
            color: white;
        }

        .registration-card .form-control {
            background-color: rgba(255, 255, 255, 0.1);
            border: 1px solid #007bff;
            color: white;
            margin-bottom: 2px;
        }

        .registration-card .form-control::placeholder {
            color: #dcdcdc;
        }

        .registration-card .form-control.is-invalid {
            border-color: #ff4d4d;
        }

        .registration-card .form-control.is-valid {
            border-color: #28a745;
        }

        .registration-card .validation-message {
            color: #ff4d4d;
            font-size: 0.9em;
        }

        .registration-card .button {
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
            cursor: pointer;
        }

        .button.disabled {
            background-color: grey;
            color: white;
            border-color: grey;
            cursor: not-allowed;
        }

        .button:hover:not(.disabled) {
            background-color: #007bff;
            cursor: pointer;
            color: #fff;
        }

        /* Dropdown Custom Styling */
        .custom-dropdown select {
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border: 1px solid #007bff;
            color: white;
            width: 100%;
            border-radius: 5px;
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
        }

        .custom-dropdown select:focus {
            outline: none;
            box-shadow: none;
        }

        .custom-dropdown {
            position: relative;
        }

        .custom-dropdown::after {
            content: '\f078'; /* FontAwesome icon code for a down arrow */
            font-family: 'FontAwesome';
            color: #007bff;
            position: absolute;
            right: 10px;
            top: 15px;
            pointer-events: none;
        }

        .custom-dropdown select option {
            color: black;
        }

        /* Home Button */
        .home-btn {
            background-color: #17a2b8;
            border: none;
            padding: 10px 20px;
            font-size: 18px;
            border-radius: 50px;
            position: fixed;
            top: 20px;
            left: 20px;
            color: white;
            text-transform: uppercase;
            font-weight: bold;
            z-index: 1000;
        }
    </style>
</head>
<body>
    <!-- Home Button -->
    <button class="home-btn" onclick="window.location.href='LandingPage.aspx'">
        <i class="fas fa-home"></i> Job Portal
    </button>
    <form id="form1" runat="server">
        <div class="form-container">
            <div class="registration-card">
                <h2>Register</h2>
                <div class="form-group">
                    <asp:DropDownList ID="UserTypeDropDown" runat="server" CssClass="form-control custom-dropdown" AutoPostBack="true" OnSelectedIndexChanged="UserTypeDropDown_SelectedIndexChanged">
                        <asp:ListItem Text="Select User Type" Value=""></asp:ListItem>
                        <asp:ListItem Text="Student" Value="Student"></asp:ListItem>
                        <asp:ListItem Text="Company" Value="Company"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <!-- Student Registration Form -->
                <asp:Panel ID="StudentPanel" runat="server" Visible="false">
                    <div class="form-group">
                        <asp:TextBox ID="StudentNameTextBox" runat="server" CssClass="form-control" Placeholder="Student Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="StudentNameRequired" runat="server" ControlToValidate="StudentNameTextBox" ErrorMessage="Student Name is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
    
                    <div class="form-group">
                        <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control" Placeholder="Email" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="EmailTextBox" ErrorMessage="Email is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
    
                    <div class="form-group">
                        <asp:TextBox ID="PasswordTextBox" runat="server" CssClass="form-control" Placeholder="Password" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="PasswordTextBox" ErrorMessage="Password is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
    
                    <div class="form-group">
                        <asp:TextBox ID="ConfirmPasswordTextBox" runat="server" CssClass="form-control" Placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="PasswordMismatch" runat="server" ControlToCompare="PasswordTextBox" ControlToValidate="ConfirmPasswordTextBox" ErrorMessage="Passwords do not match." CssClass="text-danger" style="visibility:hidden; display: none"></asp:CompareValidator>
                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPasswordTextBox" ErrorMessage="Confirm Password is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
    
                    <div class="form-group">
                        <asp:TextBox ID="UsernameTextBox" runat="server" CssClass="form-control" Placeholder="Username"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UsernameRequired" runat="server" ControlToValidate="UsernameTextBox" ErrorMessage="Username is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
    
                    <div class="form-group">
                        <asp:TextBox ID="DOBTextBox" runat="server" CssClass="form-control" Placeholder="Date of Birth" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="DOBRequired" runat="server" ControlToValidate="DOBTextBox" ErrorMessage="Date of Birth is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
    
                        <div class="form-group">
                        <asp:TextBox ID="ContactTextBox" runat="server" CssClass="form-control" Placeholder="Contact Number" />
                        <asp:RequiredFieldValidator ID="ContactRequired" runat="server" ControlToValidate="ContactTextBox" ErrorMessage="Contact number is required." CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="ContactRegexValidator" runat="server" ControlToValidate="ContactTextBox" ErrorMessage="Contact number must be digits only and up to 10 digits." CssClass="text-danger" Display="Dynamic" ValidationExpression="^\d{0,10}$" />
                    </div>



                    <div class="form-group custom-dropdown">
                        <asp:DropDownList ID="GenderDropDown" runat="server" CssClass="form-control">
                            <asp:ListItem Value="">Select Gender</asp:ListItem>
                            <asp:ListItem Value="Male">Male</asp:ListItem>
                            <asp:ListItem Value="Female">Female</asp:ListItem>
                            <asp:ListItem Value="Others">Others</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="GenderRequired" runat="server" ControlToValidate="GenderDropDown" InitialValue="" ErrorMessage="Gender is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
    
                    <div class="form-group">
                        <asp:TextBox ID="AddressTextBox" runat="server" CssClass="form-control" Placeholder="Address"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="AddressRequired" runat="server" ControlToValidate="AddressTextBox" ErrorMessage="Address is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
    
                    <div class="form-group">
                        <asp:TextBox ID="SkillTextBox" runat="server" CssClass="form-control" Placeholder="Skill"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="SkillRequired" runat="server" ControlToValidate="SkillTextBox" ErrorMessage="Skill is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
    
                    <asp:Button ID="StudentRegisterButton" runat="server" CssClass="button" Text="Register" OnClick="StudentRegisterButton_Click" />
                    <br />
                    <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
                </asp:Panel>


                <!-- Company Registration Form -->
                <asp:Panel ID="CompanyPanel" runat="server" Visible="false">
                    <div class="form-group">
                        <asp:TextBox ID="CompanyNameTextBox" runat="server" CssClass="form-control" Placeholder="Company Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="CompanyNameRequired" runat="server" ControlToValidate="CompanyNameTextBox" ErrorMessage="Company Name is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="CompanyEmailTextBox" runat="server" CssClass="form-control" Placeholder="Email" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="CompanyEmailRequired" runat="server" ControlToValidate="CompanyEmailTextBox" ErrorMessage="Email is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="CompanyUsernameTextBox" runat="server" CssClass="form-control" Placeholder="Username"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="CompanyUsernameRequired" runat="server" ControlToValidate="CompanyUsernameTextBox" ErrorMessage="Username is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="CompanyPasswordTextBox" runat="server" CssClass="form-control" Placeholder="Password" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="CompanyPasswordRequired" runat="server" ControlToValidate="CompanyPasswordTextBox" ErrorMessage="Password is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="CompanyAddressTextBox" runat="server" CssClass="form-control" Placeholder="Address"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="CompanyAddressRequired" runat="server" ControlToValidate="CompanyAddressTextBox" ErrorMessage="Address is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="CityTextBox" runat="server" CssClass="form-control" Placeholder="City"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="CityRequired" runat="server" ControlToValidate="CityTextBox" ErrorMessage="City is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="WebsiteTextBox" runat="server" CssClass="form-control" Placeholder="Website"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="WebsiteRequired" runat="server" ControlToValidate="WebsiteTextBox" ErrorMessage="Website is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator 
                            ID="WebsiteRegexValidator" 
                            runat="server" 
                            ControlToValidate="WebsiteTextBox" 
                            ErrorMessage="Please enter a valid website URL." 
                            CssClass="text-danger" 
                            Display="Dynamic" 
                            ValidationExpression="^(http://|https://|www\.|)([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,6}(/.*)?$"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="ContactNumberTextBox" runat="server" CssClass="form-control" Placeholder="Contact Number" TextMode="Phone"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ContactNumberRequired" runat="server" ControlToValidate="ContactNumberTextBox" ErrorMessage="Contact Number is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="ContactNumberRegexValidator" runat="server" ControlToValidate="ContactNumberTextBox" ErrorMessage="Contact Number must be digits only and up to 10 digits." CssClass="text-danger" Display="Dynamic" ValidationExpression="^\d{0,10}$"></asp:RegularExpressionValidator>
                    </div>
                    <asp:Button ID="CompanyRegisterButton" runat="server" CssClass="button" Text="Register" OnClick="CompanyRegisterButton_Click" />
                    <br />
                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                </asp:Panel>

                <!-- Already have an account? Login -->
                <div class="small-link">
                    <a href="JobPortalLogin.aspx" class="text-white">Already have an account? Login</a>
                </div>
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
