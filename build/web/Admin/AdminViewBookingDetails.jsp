<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Flight Details</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/libs/css/style.css">
    <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
</head>

<body>
    <!-- Main Content -->
    <div class="container mt-5">
        <!-- Flight Details Card -->
        <div class="card">
            <h5 class="card-header">Booking Details</h5>
            <div class="card-body">
                <div class="row">
                    <% 
                        // Fetch flight details from database based on flight ID
                        int flightId = Integer.parseInt(request.getParameter("id"));
                        Connection conn = null;
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;
                        ResultSet rss = null;
                        String flightCode=null;

                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightdb", "root", "");
                            pstmt = conn.prepareStatement("SELECT * FROM bookingtb WHERE bookingid = ?");
                            pstmt.setInt(1, flightId);
                            rs = pstmt.executeQuery();

                            if (rs.next()) {
                                
                  flightCode = rs.getString("flightcode");
                    %>
                    <div class="col-md-4">
                       <p><strong>Booking Code:</strong> <%= rs.getString("bookingcode") %></p>
                       <p><strong>Flight Code:</strong> <%= rs.getString("flightcode") %></p>
                       <p><strong>Names:</strong> <%= rs.getString("names") %></p>
                                <p><strong>Email:</strong> <%= rs.getString("email") %></p>
                                <p><strong>Phone:</strong> <%= rs.getString("phone") %></p>
                                <p><strong>Birth date:</strong> <%= rs.getString("birthdate") %></p>
                                <p><strong>Passport Number:</strong> <%= rs.getString("passportnbr") %></p>
                                <p><strong>Issuing Date:</strong> <%= rs.getString("issuedate") %></p>
                                <p><strong>Expire Date:</strong> <%= rs.getString("expiredate") %></p>
                                <p><strong>Issuing Country:</strong> <%= rs.getString("issuectry") %></p>
                    </div>
                    
                                           <%
            }

            // Fetch flight details and available seats
            String selectFlightDetails = "SELECT * FROM flighttb WHERE flightcode=?";
            pstmt = conn.prepareStatement(selectFlightDetails);
            pstmt.setString(1, flightCode);
            rss = pstmt.executeQuery();

            if (rss.next()) {
                // Get the total available seats
                int totalSeats = rss.getInt("flightseats");
                String flightDepart = rss.getString("flightdeparturedate");
                String flightArriva = rss.getString("flightarrivaldate");
                String flightStartTime = rss.getString("flightstarttime");
                String flightEndTime = rss.getString("flightendtime");
                String flightFrom = rss.getString("flightfrom");
                String flightTo = rss.getString("flightto");
                String FloghtUrl = rss.getString("flighturl");
                String flightName = rss.getString("flightname");
                

                %>
                    
                    <div class="col-md-4">
                        <p><strong>Gender:</strong> <%= rs.getString("gender") %></p>
                                <p><strong>Special Service:</strong> <%= rs.getString("specialservice") %></p>
                                <p><strong>Class Type:</strong> <%= rs.getString("classtype") %></p>
                                <p><strong>Trip Option:</strong> <%= rs.getString("tripoption") %></p>
                                <p><strong>Total Price:</strong> <%= rs.getString("totalprice") %></p>
                                <p><strong>Discount:</strong> <%= rs.getString("discount") %></p>
                                <p><strong>Paid Total:</strong> <%= rs.getString("paidtotal") %></p>
                                <p><strong>Booking Status:</strong> <%= rs.getString("bookstatus") %></p>
                                <p><strong>Payment Status:</strong> <%= rs.getString("paymentStatus") %></p>
                                <p><strong> Time:</strong> <%= rs.getString("booking_timestamp") %></p>
                                <p><strong>Done On:</strong> <%= rs.getString("doneon") %></p>
                        
                    </div>
                                
                                 <div class="col-md-4">
                                    <h4>Flight Details</h4>
                                    <p><strong>Flight Departure Date:</strong> <%= rss.getString("flightdeparturedate") %></p>
                                    <p><strong>Flight Arrival Date:</strong> <%= rss.getString("flightarrivaldate") %></p>
                                    <!-- Display other flight details similarly -->
                                    <img src="<%= FloghtUrl %>" alt="Flight Image" style="width:80px; height: 50px;"/>
                                    <p><%= flightName %></p>


                                    <p>Departure Date :<%= flightDepart %> - Arrival Date:<%= flightArriva %></p>

                                    <p>Start Time : <%= flightStartTime %> End Time: <%= flightEndTime %></p>

                                    <p><%= flightFrom %> To <%= flightTo %></p>
                                </div>
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
            </div>
            <div class="card-footer">
                <a href="Home.jsp" class="btn btn-primary">Back</a>
                <button class="btn btn-success" onclick="window.print()">Print</button>
            </div>
        </div>
        <!-- End Flight Details Card -->
    </div>
    <!-- End Main Content -->

    <!-- Optional JavaScript -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
</body>

</html>
