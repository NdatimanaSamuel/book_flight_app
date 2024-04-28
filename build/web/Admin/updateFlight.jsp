<%-- 
    Document   : UpdateFlight
    Created on : Apr 24, 2024, 2:24:17 PM
    Author     : Proffesor Sum
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
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
</head>

<body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
        <!-- ============================================================== -->
        <!-- navbar -->
        <!-- ============================================================== -->
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
        <!-- ============================================================== -->
        <!-- end navbar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- left sidebar -->
        <!-- ============================================================== -->
        <%@ include file="AdminMenu.jsp" %>
        <!-- ============================================================== -->
        <!-- end left sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="container-fluid  dashboard-content">
                <!-- ============================================================== -->
                <!-- pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <h2 class="pageheader-title">Update Flight </h2>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader -->
                <!-- ============================================================== -->

                <div class="row">
                    <!-- ============================================================== -->
                    <!-- validation form -->
                    <!-- ============================================================== -->
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <h5 class="card-header">Update Flight</h5>
                            <div class="card-body">
                                <form method="post" action="queries/updateFlightQuery.jsp" class="needs-validation" novalidate>
                                    <div class="row">
                                        <%-- Populate the form fields with existing flight data --%>
                                        <%
                                            // Get the flight ID from the request parameter
                                            int flightId = Integer.parseInt(request.getParameter("id"));

                                            // Fetch flight details from database based on flight ID
                                            Connection conn = null;
                                            PreparedStatement pstmt = null;
                                            ResultSet rs = null;

                                            try {
                                                Class.forName("com.mysql.jdbc.Driver");
                                                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightdb", "root", "");
                                                pstmt = conn.prepareStatement("SELECT * FROM flighttb WHERE flightid = ?");
                                                pstmt.setInt(1, flightId);
                                                rs = pstmt.executeQuery();

                                                if (rs.next()) {
                                        %>
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
                                            <input type="hidden" name="flightId" value="<%= rs.getString("flightid") %>"/>
                                            <label for="validationCustom01">Flight Code</label>
                                            <input type="text" name="flightcode" class="form-control" id="validationCustom01" placeholder="Flight Code" value="<%= rs.getString("flightcode") %>" required>

                                        </div>
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
                                            <label for="validationCustom02" style="margin-bottom: -10px;">Flight Name</label>
                                            <input type="text" name="flightname" class="form-control" id="validationCustom02" placeholder="Flight Name" value="<%= rs.getString("flightname") %>" required>

                                        </div>

                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
                                            <label for="validationCustom02" style="margin-bottom: -10px;">Flight Seats</label>
                                            <input type="text" name="flightseats" class="form-control" id="validationCustom02" placeholder="Flight Seats" value="<%= rs.getString("flightseats") %>" required>

                                        </div>

                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
                                            <label for="validationCustom02" style="margin-bottom: -10px;">Flight Description</label>
                                            <input type="text" name="flightdesc" class="form-control" id="validationCustom02" placeholder="Flight Description" value="<%= rs.getString("flightdescr") %>" required>

                                        </div>

                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
                                            <label for="validationCustom02" style="margin-bottom: -10px;">Flight URL</label>
                                            <input type="text" name="flighturl" class="form-control" id="validationCustom02" placeholder="Flight URL" value="<%= rs.getString("flighturl") %>" required>

                                        </div>
                                            <div class="col-xl-2 col-lg-2 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom03">Departure Date </label>
                                                <input type="date" name="departuredate" value="<%= rs.getString("flightdeparturedate") %>" class="form-control" id="validationCustom03" required>
                                                
                                            </div>
                                            
                                            <div class="col-xl-2 col-lg-2 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom05">Arrival Date </label>
                                                <input type="date"  name="arrivaldate" value="<%= rs.getString("flightarrivaldate") %>" class="form-control" id="validationCustom05"  required>
                                               
                                            </div>
                                            
                                             <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom03">Start Time </label>
                                                <input type="time" name="starttime" value="<%= rs.getString("flightstarttime") %>" class="form-control" id="validationCustom03" required>
                                                
                                            </div>
                                            
                                            <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom05">End Time </label>
                                                <input type="time"  name="endtime" value="<%= rs.getString("flightendtime") %>" class="form-control" id="validationCustom05"  required>
                                               
                                            </div>
                                            
                                             <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom03">From : </label>
                                                <input type="text" name="fromplace"  value="<%= rs.getString("flightfrom") %>" class="form-control" id="validationCustom03" required>
                                                
                                            </div>
                                             <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom05">To : </label>
                                                <input type="text"  name="toplace" value="<%= rs.getString("flightto") %>" class="form-control" id="validationCustom05"  required>
                                               
                                            </div>
                  
                                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom03">Category One </label>
                                                <input type="text" name="ctgryone" value="FirstClass" class="form-control" id="validationCustom03" placeholder="Price" readonly>
                                                
                                            </div>
                                            
                                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom05">Price</label>
                                                <input type="text"  name="priceone"class="form-control" value="<%= rs.getString("priceone") %>" id="validationCustom05" placeholder="Price " required>
                                               
                                            </div>
                                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom03">Category Two </label>
                                                <input type="text" name="ctgrytwo" value="BusinessClass" class="form-control" id="validationCustom03" placeholder="Price" readonly>
                                                
                                            </div>
                                            
                                             <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom05">Price </label>
                                                <input type="text" name="pricetwo" class="form-control" value="<%= rs.getString("pricetwo") %>" id="validationCustom05" placeholder="Price " required>
                                               
                                            </div>
                                            
                                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom03">Category Three </label>
                                                <input type="text" name="ctgrythree" value="EconomyClass" class="form-control" id="validationCustom03" placeholder="Price" readonly>
                                                
                                            </div>
                                            
                                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom05">Price </label>
                                                <input type="text" name="pricethree" value="<%= rs.getString("pricethree") %>" class="form-control" id="validationCustom05" placeholder="Price " required>
                                               
                                            </div>
                                        <%-- Include other form fields similarly --%>
                                        <% 
                                                }
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            } finally {
                                                try {
                                                    if(rs != null) rs.close();
                                                    if(pstmt != null) pstmt.close();
                                                    if(conn != null) conn.close();
                                                } catch (SQLException e) {
                                                    e.printStackTrace();
                                                }
                                            }
                                        %>
                                    </div>
                                    <div class="form-row">
                                        <%-- Include other form fields here --%>
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
                                            <button class="btn btn-primary" type="submit">Save Changes </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end validation form -->
                    <!-- ============================================================== -->
                </div>
            </div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="assets/vendor/parsley/parsley.js"></script>
    <script src="assets/libs/js/main-js.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script>
        $('#form').parsley();
    </script>
</body>

</html>
