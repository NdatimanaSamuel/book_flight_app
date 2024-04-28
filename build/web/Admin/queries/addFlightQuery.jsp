<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Flight Query</title>
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
        String categoryOne = request.getParameter("ctgryone");
        String priceOne = request.getParameter("priceone");
        String categoryTwo = request.getParameter("ctgrytwo");
        String priceTwo = request.getParameter("pricetwo");
        String categoryThree = request.getParameter("ctgrythree");
        String priceThree = request.getParameter("pricethree");
        
        
                // Get the current date
       // Get the current date
        Date currentDate = new Date();

        // Convert the java.util.Date to java.sql.Date
        java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());

        // Set the date parameter in the PreparedStatement
        

        Connection conn = null;
        PreparedStatement pstmt = null;

       try {
            // Establish connection to the database
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightdb", "root", "");

            // Prepare the SQL statement for insertion
            String sql = "INSERT INTO flighttb (flightcode, flightname, flightseats, flightdescr, flighturl, flightdeparturedate, flightarrivaldate, flightstarttime, flightendtime, flightfrom, flightto, flightclassone, flightclasstwo, flightclassthree, priceone, pricetwo, pricethree, doneon) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
            pstmt.setString(12, categoryOne);
            pstmt.setString(13, categoryTwo);
            
           pstmt.setString(14, categoryThree);
           pstmt.setString(15, priceOne);
            pstmt.setString(16, priceTwo);
            
            pstmt.setString(17, priceThree);
           
            pstmt.setDate(18, sqlDate);
        

            
            // Execute the SQL statement
            int rowsAffected = pstmt.executeUpdate();

//            if (rowsAffected > 0) {
//                // Insertion successful, redirect to addFlight.jsp with success message
//                response.sendRedirect("AddNewFlight.jsp?message=Flight added successfully");
//            } else {
//                // Insertion failed, redirect to addFlight.jsp with error message
//                response.sendRedirect("AddNewFlight.jsp?error=Failed to add flight");
//            }

        // Check if the insert was successful
        if (rowsAffected > 0) {
            // Display a success message using SweetAlert
%>
<script>
    Swal.fire({
        icon: 'success',
        title: 'Success!',
        text: 'Flight added successfully.',
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
        text: 'Failed to insert the Flight  into the Flight table.',
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
