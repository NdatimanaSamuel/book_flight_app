<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up Query</title>
    <!-- Include SweetAlert CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/sweetalert2@10">
</head>
<body>

<%
    // Get parameters from the request
    String fullName = request.getParameter("fullname");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirm_password");

    // Get the current date
    Date currentDate = new Date();

    // Convert the java.util.Date to java.sql.Date
    java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());

    // Check if the password matches the confirmed password
    if (!password.equals(confirmPassword)) {
        // Passwords don't match, show a sweet alert message
        out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
        out.println("<script>");
        out.println("Swal.fire({");
        out.println("  icon: 'error',");
        out.println("  title: 'Oops...',");
        out.println("  text: 'Passwords do not match!'");
        out.println("}).then(function() {");
        out.println("  window.location = '../SignUp.jsp';"); // Redirect back to sign-up page
        out.println("});");
        out.println("</script>");
    } else {
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightdb", "root", "");
            // Establish the connection with the database
            
            
            // Check if the user already exists
            String checkQuery = "SELECT * FROM customertb WHERE email = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
            checkStmt.setString(1, email);
            ResultSet rs = checkStmt.executeQuery();
            
            if (rs.next()) {
                // User already exists, show a sweet alert message
                out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
                out.println("<script>");
                out.println("Swal.fire({");
                out.println("  icon: 'error',");
                out.println("  title: 'Oops...',");
                out.println("  text: 'User already exists!'");
                out.println("}).then(function() {");
                out.println("  window.location = '../SignUp.jsp';"); // Redirect back to sign-up page
                out.println("});");
                out.println("</script>");
            } else {
                // User does not exist, insert into the database
                String insertQuery = "INSERT INTO customertb (names, email, phone, password,doneon) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement insertStmt = conn.prepareStatement(insertQuery);
                insertStmt.setString(1, fullName);
                insertStmt.setString(2, email);
                insertStmt.setString(3, phone);
                insertStmt.setString(4, password);
                insertStmt.setDate(5, sqlDate);
                insertStmt.executeUpdate();
                
                // Show a sweet alert message for successful registration
                out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
                out.println("<script>");
                out.println("Swal.fire({");
                out.println("  icon: 'success',");
                out.println("  title: 'Success',");
                out.println("  text: 'Account added successfully!'");
                out.println("}).then(function() {");
                out.println("  window.location = '../SignIn.jsp';"); // Redirect to sign-in page
                out.println("});");
                out.println("</script>");
            }
            
            // Close all connections
            rs.close();
            checkStmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

</body>
</html>
