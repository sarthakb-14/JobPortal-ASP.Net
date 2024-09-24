<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageCompanies.aspx.cs" Inherits="JobPortal.ManageCompanies" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Companies</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
     <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <style>
        body {
            background: url('images/bg_dashboard.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #ffffff;
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

        h2 {
            padding-bottom: 20px;
            padding-top: 20px;
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

        .search-container {
            display: flex; /* Flexbox for alignment */
            justify-content: center; /* Center the items */
            margin-bottom: 20px; /* Space below search container */
        }

        .search-container input[type="text"] {
            width: 300px;
            padding: 10px;
            background-color: transparent; /* Keep it transparent */
            color: white;
            border-radius: 10px;
            outline: none;
            margin-right: 10px; /* Space between input and dropdown */
        }

        .search-container select {
            width: 200px;
            background-color: transparent; /* Keep it transparent */
            color: white;
            border-radius: 10px;
            margin-right: 10px; /* Space between dropdown and button */
        }

        .button {
            background-color: transparent;
            color: #fff;
            width: 7em;
            height: 2.5em;
            border: 0.2em solid red; /* Red border for Delete */
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

        .button:hover {
            background-color: red; /* Red background for Delete */
            color: #fff;
        }

        .btn-search {
            background-color: transparent;
            color: #fff;
            width: 7em;
            height: 2.5em;
            border: 0.2em solid blue; /* Blue border for Search */
            border-radius: 11px;
            text-align: center;
            transition: all 0.6s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0 1em;
            font-weight: bold;
            letter-spacing: 1px;
            cursor: pointer;
        }

        .btn-search:hover {
            background-color: blue; /* Blue background on hover for Search */
            color: white;
        }

        .btn-search:focus {
            outline: none;
            box-shadow: none;
        }

        .grid-view {
            width: 100%;
            margin: 0 auto;
            border-collapse: collapse;
            border-radius: 20px;
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
        #lblAdminName {
            font-family: 'Poppins', sans-serif;
        }
                    
    </style>
</head>
<body>

    <form id="form1" runat="server">
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
            <asp:GridView ID="GridView1" runat="server" CssClass="grid-view" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
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
                            <button class="button" onclick="return confirm('Are you sure you want to delete this record?');">Delete</button>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
