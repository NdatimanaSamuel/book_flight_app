<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Flight Booking Ms</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/libs/css/style.css">
    <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <link rel="stylesheet" type="text/css" href="assets/vendor/datatables/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="assets/vendor/datatables/css/buttons.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="assets/vendor/datatables/css/select.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="assets/vendor/datatables/css/fixedHeader.bootstrap4.css">
</head>

<body>
    <!-- main wrapper -->
    <div class="dashboard-main-wrapper">
        <!-- navbar -->
        <div class="dashboard-header">
            <nav class="navbar navbar-expand-lg bg-white fixed-top">
                <a class="navbar-brand" href="Home.jsp">Telex Flight</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">
                        <li class="nav-item">
                            <div id="custom-search" class="top-search-bar">
                                <input class="form-control" type="text" placeholder="Search..">
                            </div>
                        </li>
                        
                       
                        <li class="nav-item dropdown nav-user">
                            <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="assets/images/avatar-1.jpg" alt="" class="user-avatar-md rounded-circle"></a>
                            <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                                <div class="nav-user-info">
                                    <h5 class="mb-0 text-white nav-user-name"><%= session.getAttribute("Name") %></h5>
                                    <span class="status"></span><span class="ml-2">Available</span>
                                </div>
                                <a class="dropdown-item" href="#"><i class="fas fa-user mr-2"></i>Account</a>
                                <a class="dropdown-item" href="#"><i class="fas fa-cog mr-2"></i>Setting</a>
                                <a class="dropdown-item" href="logout.jsp"><i class="fas fa-power-off mr-2"></i>Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>

        <!-- Left sidebar -->
        <%@ include file="AdminMenu.jsp" %>

        <!-- Page content -->
        <div class="dashboard-wrapper">
            <div class="container-fluid dashboard-content">
                <!-- Page header -->
                <div class="page-header">
                    <h2 class="pageheader-title">All Daily Booking</h2>
                    <!-- Breadcrumb -->
                    <div class="page-breadcrumb">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Show</a></li>
                                <li class="breadcrumb-item active" aria-current="page">All Flight</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <!-- End Page header -->
              <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="card">
                                <h5 class="card-header">Generate Report Based On Date</h5>
                                <div class="card-body">
                                    <form action="" method="GET"> <!-- Changed action to a new JSP -->
                                        <div class="form-row">
                                            <div class="col-xl-2 col-lg-2 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="fromDate">From: </label>
                                                <input type="date" name="fromDate" class="form-control" id="fromDate" required>
                                            </div>
                                            <div class="col-xl-2 col-lg-2 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="toDate">To: </label>
                                                <input type="date" name="toDate" class="form-control" id="toDate" required>
                                            </div>
                                            <div class="col-xl-2 col-lg-2 col-md-12 col-sm-12 col-2" style="margin-top:25px;">
                                                <button class="btn btn-primary" type="submit">Submit </button>
                                            </div>
                                         </div>
                                    </form> 
                                </div>
                            </div>
              </div>
                <!-- Flight Table -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <h5 class="card-header">All Pending Booking </h5>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="flightTable" class="table table-striped table-bordered first">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Booking Code</th>
                                                <th>Customer Names</th>
                                                <th>Status</th>
                                                <th>Payment Status</th>
                                                <th>Flight Number</th>
                                                <th>Assigned Seat</th>
                                                <th>Done on</th>
                                               
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% 
                                                // Establish database connection
                                                Connection conn = null;
                                                Statement stmt = null;
                                                ResultSet rs = null;

                                                try {
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightdb", "root", "");
                                                    
                                                    String fromDate = request.getParameter("fromDate");
                                                    String toDate = request.getParameter("toDate");
                                                    
                                                    if (fromDate != null && toDate != null) {
                                                        PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM bookingtb WHERE doneon BETWEEN ? AND ?");
                                                        pstmt.setString(1, fromDate);
                                                        pstmt.setString(2, toDate);
                                                        rs = pstmt.executeQuery();
                                                    }
                                                    else {
                                                        out.println("<tr><td colspan='8'>No records found</td></tr>");
                                                    }

                                                    int count = 1;
                                                    while(rs.next()) {
                                            %>
                                            <tr>
                                                <td><%= count++ %></td>
                                                <td><%= rs.getString("bookingcode") %></td>
                                                <td><%= rs.getString("names") %></td>
                                                <td><%= rs.getString("bookstatus") %></td>
                                                <td><%= rs.getString("paymentStatus") %></td>
                                                <td><%= rs.getInt("flightcode") %></td>
                                                <td><%= rs.getString("assignedSeat") %></td>
                                                
                                                <td><%= rs.getString("booking_timestamp") %></td>
                                                <td>
                                                    <!-- Link to more details -->
                                                    <a href="AdminViewBookingDetails.jsp?id=<%= rs.getInt("bookingid") %>" class="btn btn-info">Details</a>
                                                </td>
                                                
                                            </tr>
                                            <% 
                                                    }
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                } finally {
                                                    try {
                                                        if(rs != null) rs.close();
                                                        if(stmt != null) stmt.close();
                                                        if(conn != null) conn.close();
                                                    } catch (SQLException e) {
                                                        e.printStackTrace();
                                                    }
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Flight Table -->
            </div>
            <!-- End container-fluid -->
            
            <!-- Footer -->
            <div class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            Copyright © 2024 . All rights reserved by
                            <a href="#">Telex Flight</a>.
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="text-md-right footer-links d-none d-sm-block">
                                <a href="#">About</a>
                                <a href="#">Support</a>
                                <a href="#">Contact Us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Footer -->
        </div>
        <!-- End dashboard-wrapper -->
    </div>
    <!-- End dashboard-main-wrapper -->

    <!-- Optional JavaScript -->
    <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="assets/vendor/multi-select/js/jquery.multi-select.js"></script>
    <script src="assets/libs/js/main-js.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="assets/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
    <script src="assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
    <script src="assets/vendor/datatables/js/data-table.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
    <script src="https://cdn.datatables.net/rowgroup/1.0.4/js/dataTables.rowGroup.min.js"></script>
    <script src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>
    <script src="https://cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script>
    
</body>

</html>
