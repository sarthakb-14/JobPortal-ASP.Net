<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageCompanies.aspx.cs" Inherits="JobPortal.ManageCompanies" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Companies</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <style>
        html {
            height: 100%;
        }

        body {
            margin: 0;
            color: #ffffff;
            position: relative; /* To position the content properly */
            z-index: 1; /* Ensure content is above the background */
        }

        .bg {
            animation: slide 3s ease-in-out infinite alternate;
            background-image: linear-gradient(-60deg, #0a0e1e 50%, #121d45 50%);
            bottom: 0;
            left: -50%;
            opacity: .8;
            position: fixed;
            right: -50%;
            top: 0;
            z-index: -1;
        }

        .bg2 {
            animation-direction: alternate-reverse;
            animation-duration: 4s;
            background-image: linear-gradient(-60deg, #091228 50%, #0f2557 50%);
        }

        .bg3 {
            animation-duration: 5s;
            background-image: linear-gradient(-60deg, #0f2557 50%, #0a1b40 50%);
        }

        .form-control {
            border: 2.5px solid #ffffff;
        }

        .grid-container {
            margin: 20px auto;
            max-width: 1250px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        h2 {
            padding-bottom: 20px;
            padding-top: 20px;
        }

        .search-container {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .search-container input[type="text"] {
            width: 300px;
            padding: 10px;
            background-color: transparent;
            color: white;
            border-radius: 10px;
            outline: none;
            margin-right: 10px;
        }

        .search-container select {
            width: 200px;
            background-color: transparent;
            color: white;
            border-radius: 10px;
            margin-right: 10px;
        }

        .button, .btn-search {
            border-radius: 11px;
            padding: 0 1em;
            font-weight: bold;
            cursor: pointer;
            height: 37px; /* Set a fixed height */
            display: inline-flex; /* Ensure they can be vertically centered */
            align-items: center; /* Center content vertically */
        }

        .button {
            background-color: transparent;
            color: #fff;
            border: 0.2em solid red;
            transition: all 0.6s ease;
        }

        .button:hover {
            background-color: red;
            color: #fff;
            text-decoration: none;
        }

        .btn-search {
            background-color: transparent;
            color: #fff;
            border: 0.2em solid blue;
            transition: all 0.6s ease;
        }

        .btn-search:hover {
            background-color: blue;
            color: white;
        }

        .grid-view {
            width: 100%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: transparent;
            border: none;
        }

        .grid-view th, .grid-view td {
            text-align: center;
            padding: 15px;
            border: none;
        }

        .grid-view th {
            background-color: rgba(8, 7, 44, 0.5);
            color: white;
            border-bottom: 1px solid darkblue;
        }

        .grid-view tr {
            border-bottom: 1px solid darkblue;
        }

        .grid-view tr:hover {
            background-color: rgba(8, 7, 44, 0.5);
        }

        .logout-btn {
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
            margin-left: 13px;
        }

        .logout-btn:hover {
            background-color: #007bff;
            cursor: pointer;
            color: #fff;
        }

        .logout-btn:focus {
            outline: none;
            box-shadow: none;
        }

        .profile-container {
            position: absolute;
            top: 20px;
            right: 20px;
            z-index: 1;
            display: flex;
            align-items: center;
            color: white;
        }

        .profile-icon {
            font-size: 2rem;
            margin-right: 10px;
        }

        #lblAdminName {
            font-family: 'Poppins', sans-serif;
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
    <form id="form1" runat="server">
        <div class="bg"></div>
        <div class="bg bg2"></div>
        <div class="bg bg3"></div>

        <div class="grid-container">
            <h2>Manage Companies</h2>
            <div class="profile-container">
                <i class="fas fa-user-circle profile-icon"></i>
                <asp:Label ID="lblAdminName" runat="server" Text=""></asp:Label>
                <asp:Button ID="Button1" runat="server" Text="Logout" CssClass="logout-btn" OnClick="LogoutButton_Click" />
            </div>
            <!-- Search form -->
            <div class="search-container">
                <asp:TextBox ID="txtSearch" runat="server" placeholder="Search..." CssClass="form-control" />
                <asp:DropDownList ID="ddlSearchColumn" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Company Name" Value="cname" />
                    <asp:ListItem Text="Email" Value="cemail" />
                    <asp:ListItem Text="Username" Value="cusername" />
                    <asp:ListItem Text="City" Value="ccity" />
                    <asp:ListItem Text="Contact Number" Value="ccontactno" />
                </asp:DropDownList>
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn-search" OnClick="btnSearch_Click" />
            </div>

            <!-- GridView for displaying companies -->
            <asp:GridView ID="GridView1" runat="server" CssClass="grid-view" AutoGenerateColumns="False" AllowPaging="True" 
                OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="cid">
                <Columns>
                    <asp:BoundField DataField="cname" HeaderText="Company Name" />
                    <asp:BoundField DataField="cemail" HeaderText="Email" />
                    <asp:BoundField DataField="cusername" HeaderText="Username" />
                    <asp:BoundField DataField="caddress" HeaderText="Address" />
                    <asp:BoundField DataField="ccity" HeaderText="City" />
                    <asp:TemplateField HeaderText="Website">
                        <ItemTemplate>
                            <a href='<%# Eval("cwebsiteurl", "http://{0}") %>' target="_blank" class="text-white">
                                <%# Eval("cwebsiteurl") %>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ccontactno" HeaderText="Contact Number" />
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" 
                                CommandArgument='<%# Eval("cid") %>' OnClientClick="return confirm('Are you sure you want to delete this record?');" 
                                CssClass="button">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
