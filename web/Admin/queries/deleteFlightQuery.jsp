<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Flight</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
    <% 
        // Establish database connection
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightdb", "root", "");

            // Get the flight ID from the request parameter
            int flightId = Integer.parseInt(request.getParameter("id"));

            // Delete the flight from the database
            pstmt = conn.prepareStatement("DELETE FROM flighttb WHERE flightid = ?");
            pstmt.setInt(1, flightId);
            int rowsAffected = pstmt.executeUpdate();

            // Check if the flight was successfully deleted
            if (rowsAffected > 0) {
    %>
    <script type="text/javascript">
        // Show a Sweet Alert success message
        swal({
            title: "Flight Deleted!",
            text: "The flight has been successfully deleted.",
            icon: "success",
            button: "OK",
        }).then(function() {
            // Redirect the user to the ViewAllFlight.jsp page
            window.location.href = "../ViewAllFlight.jsp";
        });
    </script>
    <% 
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
