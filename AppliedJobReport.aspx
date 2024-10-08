<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppliedJobReport.aspx.cs" Inherits="JobPortal.AppliedJobReport" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Job Reports</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Body background and text */
        body {
            background-color: #212529;
            color: white;
        }
        .card {
            background-color: #343a40;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
        }
        h1 {
            font-size: 2.5rem;
            color: #ffc107;
        }
        .bg {
          animation: slide 3s ease-in-out infinite alternate;
          background-image: linear-gradient(-60deg, #003300 50%, #006600 50%);
          bottom: 0;
          left: -50%;
          opacity: .5;
          position: fixed;
          right: -50%;
          top: 0;
          z-index: -1;
        }

        .bg2 {
          animation-direction: alternate-reverse;
          animation-duration: 4s;
        }

        .bg3 {
          animation-duration: 5s;
        }

        .content {
          background-color: rgba(255, 255, 255, .8);
          border-radius: .25em;
          box-shadow: 0 0 .25em rgba(0, 0, 0, .25);
          box-sizing: border-box;
          left: 50%;
          padding: 10vmin;
          position: fixed;
          text-align: center;
          top: 50%;
          transform: translate(-50%, -50%);
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
        <div class="container mt-4">
            <div class="row">
                <!-- Applied Jobs Section -->
                <section id="applied-jobs" class="col-md-6">
                    <h1 class="text-center">Applied Job Report</h1>
                    <div class="row">
                        <asp:Repeater ID="rptAppliedJobs" runat="server">
                            <ItemTemplate>
                                <div class="col-md-12 mb-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title"><%# Eval("jobtitle") %></h5>
                                            <p class="card-text">Company: <%# Eval("cname") %></p>
                                            <p class="card-text">Student Name: <%# Eval("sname") %></p>
                                            <p class="card-text">Application ID: <%# Eval("applyid") %></p>
                                            <asp:Button ID="btnAccept" runat="server" Text="Accept" CommandArgument='<%# Eval("applyid") %>' OnClick="btnAccept_Click" CssClass="btn btn-success" />
                                            <asp:Button ID="btnDeny" runat="server" Text="Deny" CommandArgument='<%# Eval("applyid") %>' OnClick="btnDeny_Click" CssClass="btn btn-danger" />
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </section>

                <!-- Shortlisted Jobs Section -->
                <section id="shortlisted-jobs" class="col-md-6">
                    <h1 class="text-center">Shortlisted Job Report</h1>
                    <div class="row">
                        <asp:Repeater ID="rptShortlistedJobs" runat="server">
                            <ItemTemplate>
                                <div class="col-md-12 mb-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title"><%# Eval("jobtitle") %></h5>
                                            <p class="card-text">Company: <%# Eval("cname") %></p>
                                            <p class="card-text">Student Name: <%# Eval("sname") %></p>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </section>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
