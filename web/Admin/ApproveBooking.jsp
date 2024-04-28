<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*, java.net.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Approve Booking</title>
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

            // Get the booking ID from the request parameter
            int bookingId = Integer.parseInt(request.getParameter("id"));

            // Update the booking status to 'approved' in the database
            pstmt = conn.prepareStatement("UPDATE bookingtb SET bookstatus=? WHERE bookingid = ?");
            pstmt.setString(1, "approved");
            pstmt.setInt(2, bookingId);
            int rowsAffected = pstmt.executeUpdate();
             
            // Check if the booking was successfully approved
            if (rowsAffected > 0) {
                // Retrieve customer's email and name from the database
                String customerEmail = "";
                String customerName = "";
                String bookingCode="";
                
                // Query to retrieve customer email and name based on booking ID
                String query = "SELECT bookingcode,email, names FROM bookingtb WHERE bookingid = ?";
                pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, bookingId);
                ResultSet rs = pstmt.executeQuery();
                
                // Check if a record is found
                if (rs.next()) {
                    customerEmail = rs.getString("email");
                    customerName = rs.getString("names");
                    bookingCode=rs.getString("bookingcode");
                    // Send email using PHP
                    try {
                        String urlString = "http://localhost/TelexTravelTours/send_email.php";
                        URL url = new URL(urlString);
                        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

                        connection.setRequestMethod("POST");
                        connection.setDoOutput(true);
                        connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

                        String postData = "customerNames=" + URLEncoder.encode(customerName, "UTF-8") +
                                "&customerEmail=" + URLEncoder.encode(customerEmail, "UTF-8") +
                                "&customerCode=" + URLEncoder.encode(bookingCode, "UTF-8") +
                                "&bookingStatus=approved";

                        OutputStreamWriter writer = new OutputStreamWriter(connection.getOutputStream());
                        writer.write(postData);
                        writer.flush();

                        BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                        String line;
                        while ((line = reader.readLine()) != null) {
                            System.out.println(line);
                        }
                        writer.close();
                        reader.close();

                        connection.disconnect();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    
                    // Show Sweet Alert message and redirect
    %>
    <script type="text/javascript">
        swal({
            title: "Booking Updated!",
            text: "The Booking has been successfully Updated.",
            icon: "success",
            button: "OK",
        }).then(function() {
            window.location.href = "viewPendingReservation.jsp";
        });
    </script>
    <% 
                }
            } else {
    %>
    <script type="text/javascript">
        // Show a Sweet Alert error message
        swal({
            title: "Error!",
            text: "Failed to update booking status. Please try again later.",
            icon: "error",
            button: "OK",
        }).then(function() {
            // Redirect the user to the ViewAllFlight.jsp page
            window.location.href = "viewPendingReservation.jsp";
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
