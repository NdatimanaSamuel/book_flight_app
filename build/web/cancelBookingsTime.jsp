<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<%
// Establish database connection
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    // Load your driver and establish a connection here
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightdb", "root", "");
    // Define the time threshold for cancellation (1 minute in milliseconds for testing)
    long timeThreshold = 1 * 60 * 1000; // 1 minute

    // Get the current timestamp
    long currentTime = System.currentTimeMillis();

    // Calculate the timestamp threshold for cancellation
    long cancellationTime = currentTime - timeThreshold;

    // Construct the SQL query to update cancelled bookings
    String cancelQuery = "UPDATE bookingtb SET bookstatus = 'Cancelled', paymentStatus='Cancelled' WHERE email = ? AND booking_timestamp < ? AND paymentStatus = 'Unpaid'";
    
    pstmt = conn.prepareStatement(cancelQuery);
    pstmt.setString(1, session.getAttribute("email").toString()); // Assuming session has email attribute
    pstmt.setTimestamp(2, new Timestamp(cancellationTime));
    
    // Execute the update query
    int rowsAffected = pstmt.executeUpdate();

    // Print the number of bookings cancelled for debugging
    out.println("Cancelled " + rowsAffected + " bookings.");
} catch (Exception e) {
    e.printStackTrace();
} finally {
    // Close resources
    try {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
}
%>
