<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Update Flight Query</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
    <%
        // Retrieve form data
        String flightCode = request.getParameter("flightcode");
        String flightName = request.getParameter("flightname");
        String flightSeats = request.getParameter("flightseats");
        String flightDesc = request.getParameter("flightdesc");
        String flightUrl = request.getParameter("flighturl");
        String departureDate = request.getParameter("departuredate");
        String arrivalDate = request.getParameter("arrivaldate");
        String startTime = request.getParameter("starttime");
        String endTime = request.getParameter("endtime");
        String fromPlace = request.getParameter("fromplace");
        String toPlace = request.getParameter("toplace");
//        String categoryOne = request.getParameter("ctgryone");
        String priceOne = request.getParameter("priceone");
//        String categoryTwo = request.getParameter("ctgrytwo");
        String priceTwo = request.getParameter("pricetwo");
//        String categoryThree = request.getParameter("ctgrythree");
        String priceThree = request.getParameter("pricethree");
        
        // Get the flight ID from the request parameter
        int flightId = Integer.parseInt(request.getParameter("flightId"));
        
        // Get the current date
        Date currentDate = new Date();
        // Convert the java.util.Date to java.sql.Date
        java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());

        Connection conn = null;
        PreparedStatement pstmt = null;

       try {
            // Establish connection to the database
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightdb", "root", "");

            // Prepare the SQL statement for update
            String sql = "UPDATE flighttb SET flightcode=?, flightname=?, flightseats=?, flightdescr=?, flighturl=?, flightdeparturedate=?, flightarrivaldate=?, flightstarttime=?, flightendtime=?, flightfrom=?, flightto=?, priceone=?, pricetwo=?, pricethree=?, doneon=? WHERE flightid=?";
            pstmt = conn.prepareStatement(sql);

            // Set the values for the SQL statement
            pstmt.setString(1, flightCode);
            pstmt.setString(2, flightName);
            pstmt.setString(3, flightSeats);
            pstmt.setString(4, flightDesc);
            pstmt.setString(5, flightUrl);
            pstmt.setString(6, departureDate);
            pstmt.setString(7, arrivalDate);
            pstmt.setString(8, startTime);
            pstmt.setString(9, endTime);
            pstmt.setString(10, fromPlace);
            pstmt.setString(11, toPlace);
           
            pstmt.setString(12, priceOne);
            pstmt.setString(13, priceTwo);
            pstmt.setString(14, priceThree);
            pstmt.setDate(15, sqlDate);
            pstmt.setInt(16, flightId);

            // Execute the SQL statement
            int rowsAffected = pstmt.executeUpdate();

            // Check if the update was successful
            if (rowsAffected > 0) {
                // Display a success message using SweetAlert
    %>
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Success!',
            text: 'Flight updated successfully.',
            confirmButtonText: 'OK'
        }).then((result) => {
            // Redirect to another page after the user clicks OK
            window.location.href = '../ViewAllFlight.jsp';
        });
    </script>
    <%
            } else {
                // If no rows were affected, display an error message
    %>
    <script>
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'Failed to update the Flight details.',
            confirmButtonText: 'OK'
        });
    </script>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle any exceptions here
            // Display an error message to the user
    %>
    <script>
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'An error occurred while processing your request. Please try again later.',
            confirmButtonText: 'OK'
        });
    </script>
    <%
        } finally {
            // Close the database resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    %>
</body>
</html>
