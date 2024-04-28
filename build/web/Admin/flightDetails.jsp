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
            <h5 class="card-header">Flight Details</h5>
            <div class="card-body">
                <div class="row">
                    <% 
                        // Fetch flight details from database based on flight ID
                        int flightId = Integer.parseInt(request.getParameter("id"));
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
                    <div class="col-md-6">
                        <p><strong>Flight Code:</strong> <%= rs.getString("flightcode") %></p>
                        <p><strong>Name:</strong> <%= rs.getString("flightname") %></p>
                        <p><strong>Seats:</strong> <%= rs.getString("flightseats") %></p>
                        <p><strong>Description:</strong> <%= rs.getString("flightdescr") %></p>
                        <p><strong>Departure:</strong> <%= rs.getString("flightdeparturedate") %></p>
                        <p><strong>Arrival:</strong> <%= rs.getString("flightarrivaldate") %></p>
                        <p><strong>Start Time:</strong> <%= rs.getString("flightstarttime") %></p>
                        <p><strong>End Time:</strong> <%= rs.getString("flightendtime") %></p>
                        <p><strong>From:</strong> <%= rs.getString("flightfrom") %></p>
                        <p><strong>To:</strong> <%= rs.getString("flightto") %></p>
                    </div>
                    
                    <div class="col-md-6">
                        <p><strong>First Class:</strong> <%= rs.getString("priceone") %> $</p>
                        <p><strong>Business Class:</strong> <%= rs.getString("pricetwo") %> $</p>
                        <p><strong>Economy Class:</strong> <%= rs.getString("pricethree") %> $</p>
                        
                        <p><strong>Added Date: </strong> <%= rs.getString("doneon") %></p>
                        
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
                <a href="ViewAllFlight.jsp" class="btn btn-primary">Back</a>
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
