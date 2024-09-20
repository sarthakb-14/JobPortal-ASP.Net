<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageStudents.aspx.cs" Inherits="JobPortal.ManageStudents" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Students</title>
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
            max-width: 1200px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            text-align: center; /* Center align content */
        }

        .grid-view {
            width: 100%; /* Ensure the GridView takes full width */
            margin: 0 auto; /* Center the GridView */
            border-collapse: collapse; /* Collapse borders */
            border-radius: 20px;
            background-color: transparent; /* Set background color to transparent */
            border: none; /* Remove the default table border */
        }

        .grid-view th, .grid-view td {
            text-align: center;
            padding: 15px;
            border: none; /* Remove vertical borders */
        }

        .grid-view th {
            background-color: rgba(8, 7, 44, 0.5); /* Darker transparent background for headers */
            color: white;
            border-bottom: 1px solid darkblue; /* Horizontal line for header */
        }

        .grid-view tr {
            border-bottom: 1px solid darkblue; /* Horizontal line for rows */
        }

        .grid-view tr:hover {
            background-color: rgba(8, 7, 44, 0.5); /* Slightly darker background on hover */
        }

        .button {
            background-color: transparent;
            color: #fff;
            width: 7em;
            height: 2.5em;
            border: 0.2em solid red; /* Change border color to red */
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
            background-color: red; /* Change hover background to red */
            color: #fff;
        }

        .button:focus {
            outline: none;
            box-shadow: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="grid-container">
            <h2>Manage Students</h2>
            <asp:GridView ID="GridView1" runat="server" CssClass="grid-view" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="sname" HeaderText="Student Name" />
                    <asp:BoundField DataField="semail" HeaderText="Email" />
                    <asp:BoundField DataField="susername" HeaderText="Username" />
                    <asp:BoundField DataField="sdob" HeaderText="Date of Birth" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="sgender" HeaderText="Gender" />
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

