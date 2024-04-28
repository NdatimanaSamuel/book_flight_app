<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Logout</title>
</head>
<body>
<%
    // Invalidate the session
    /*HttpSession session = request.getSession(false); // Get existing session, don't create new*/
    if (session != null) {
        session.invalidate(); // Invalidate the session
    }
    
    // Redirect to the index page
    response.sendRedirect("index.jsp");
%>
</body>
</html>
