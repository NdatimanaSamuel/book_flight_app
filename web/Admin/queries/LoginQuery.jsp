<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    RequestDispatcher dispatcher = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightdb", "root", "");
        PreparedStatement checkStmt = conn.prepareStatement("SELECT * FROM admintb WHERE email = ? AND password = ?");
        checkStmt.setString(1, username);
        checkStmt.setString(2, password);
        ResultSet rs = checkStmt.executeQuery();

        if (rs.next()) {
            String userId = rs.getString("adminid");
            session.setAttribute("userId", userId);
            session.setAttribute("Name", rs.getString("names"));
            session.setAttribute("email", rs.getString("email"));
            // Redirect to Home.jsp after successful login
            response.sendRedirect("../Home.jsp");
        } else {
            // Admin authentication failed, redirect to index.jsp with error message
            response.sendRedirect("../index.jsp?status=failed");
        }

        rs.close();
        checkStmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
        // Handle exceptions as needed
    }
%>
    </body>
</html>
