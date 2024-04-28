package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebServlet("/controller/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        RequestDispatcher dispatcher = null;
        HttpSession session = request.getSession();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightdb", "root", "");
            PreparedStatement checkStmt = conn.prepareStatement("SELECT * FROM admintb WHERE email = ? AND password = ? ");
            checkStmt.setString(1, username);
            checkStmt.setString(2, password);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                String userId = rs.getString("adminid");
                session.setAttribute("userId", userId);
                session.setAttribute("Name", rs.getString("names"));
                session.setAttribute("email", rs.getString("email"));
                dispatcher = request.getRequestDispatcher("Home.jsp"); // Redirect to admin dashboard
            } else {
                // Admin authentication failed, show error message on login page
                request.setAttribute("status", "failed");
                dispatcher = request.getRequestDispatcher("index.jsp");
            }

            dispatcher.forward(request, response);
            rs.close();
            checkStmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions as needed
        }
    }
}
