<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchAll.aspx.cs" Inherits="JobPortal.SearchAll" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search All</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: url('images/bg_dashboard.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #ffffff;
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

        .btn-search {
            background-color: transparent;
            color: #fff;
            width: 7em;
            height: 2.5em;
            border: 0.2em solid blue;
            border-radius: 11px;
            text-align: center;
            transition: all 0.6s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            letter-spacing: 1px;
            cursor: pointer;
        }

        .btn-search:hover {
            background-color: blue;
            color: white;
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

        .grid-view tr:hover {
            background-color: rgba(8, 7, 44, 0.5);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="grid-container">
            <h2>Search Across All</h2>

            <!-- Search form -->
            <div class="search-container">
                <asp:DropDownList ID="ddlEntity" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlEntity_SelectedIndexChanged">
                    <asp:ListItem Text="Select Entity" Value="" />
                    <asp:ListItem Text="Student" Value="student" />
                    <asp:ListItem Text="Job" Value="joblist" />
                    <asp:ListItem Text="Company" Value="company" />
                    <asp:ListItem Text="Admin" Value="admin" />
                    <asp:ListItem Text="Apply Job" Value="applyjob" />
                </asp:DropDownList>

                <asp:TextBox ID="txtSearch" runat="server" placeholder="Search..." CssClass="form-control" />
                <asp:DropDownList ID="ddlSearchColumn" runat="server" CssClass="form-control"></asp:DropDownList>
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn-search" OnClick="btnSearch_Click" />
            </div>

            <!-- GridView for displaying the search results -->
            <asp:GridView ID="GridView1" runat="server" CssClass="grid-view" AutoGenerateColumns="True" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
