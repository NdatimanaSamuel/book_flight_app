<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
// Get user input from the form
String email = request.getParameter("emails");
String password = request.getParameter("passwords");

// Establish database connection
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    // Load the MySQL JDBC driver
    Class.forName("com.mysql.jdbc.Driver");
            
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightdb", "root", "");
    
    // Check if the user exists in the database
    String query = "SELECT * FROM customertb WHERE email=? AND password=?";
    pstmt = conn.prepareStatement(query);
    pstmt.setString(1, email);
    pstmt.setString(2, password);
    rs = pstmt.executeQuery();

    if (rs.next()) {
        // User exists, store user information in session
        String id = rs.getString("customerid");
        String name = rs.getString("names");
        String phone = rs.getString("phone");
        
        // Save user information in session
         session = request.getSession();
        session.setAttribute("customerid", id);
        session.setAttribute("email", email);
        session.setAttribute("names", name);
        session.setAttribute("phone", phone);
        
        // Redirect to CustomerHomePage.jsp
        response.sendRedirect("../CustomerHome.jsp");
    } else {
        // User does not exist, show an alert and redirect back to SignIn.jsp
%>
        <script>
            alert("User does not exist. Please check your email and password.");
            window.location.href = "../SignIn.jsp";
        </script>
<%
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    // Close database connections
    if (rs != null) {
        rs.close();
    }
    if (pstmt != null) {
        pstmt.close();
    }
    if (conn != null) {
        conn.close();
    }
}
%>
