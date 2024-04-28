<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Telex Flight</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .ticket-container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
        }
        .ticket-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .ticket-header h1 {
            margin: 0;
            color: #333;
        }
        .ticket-details {
            padding: 10px 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        .ticket-details p {
            margin: 5px 0;
        }
        .print-btn {
            text-align: center;
            margin-top: 20px;
        }
        .print-btn button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .print-btn button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="ticket-container">
        <div class="ticket-header">
            <h1>Airplane Ticket Invoice</h1>
        </div>
        <div class="ticket-details">
            <% 
            // Retrieve booking details from bookingtb based on bookingcode
            String bookingCode = "98539";
            String flightCode = "6531";
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            ResultSet rss = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightdb", "root", "");
                
                // Update payment status in bookingtb table
                String updatePaymentStatus = "UPDATE bookingtb SET paymentStatus='Paid' WHERE bookingcode=?";
                pstmt = conn.prepareStatement(updatePaymentStatus);
                pstmt.setString(1, bookingCode);
                int rowsAffected = pstmt.executeUpdate();
            
                // Fetch booking details
                String selectBookingDetails = "SELECT * FROM bookingtb WHERE bookingcode = ?";
                pstmt = conn.prepareStatement(selectBookingDetails);
                pstmt.setString(1, bookingCode);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    // Display booking details
            %>
            
            <p><strong>Booking Code:</strong> <%= rs.getString("bookingcode") %></p>
            <p><strong>Flight Code:</strong> <%= rs.getString("flightcode") %></p>
            <p><strong>Names:</strong> <%= rs.getString("names") %></p>
            <p><strong>Email:</strong> <%= rs.getString("email") %></p>
            <p><strong>Phone:</strong> <%= rs.getString("phone") %></p>
            <p><strong>Birth date:</strong> <%= rs.getString("birthdate") %></p>
            <p><strong>Passport Number:</strong> <%= rs.getString("passportnbr") %></p>
            <p><strong>Issuing Date:</strong> <%= rs.getString("issuedate") %></p>
            <p><strong>Expire Date:</strong> <%= rs.getString("expiredate") %></p>
            <p><strong>Issuing Country:</strong> <%= rs.getString("issuectry") %></p>
            <p><strong>Gender:</strong> <%= rs.getString("gender") %></p>
            <p><strong>Special Service:</strong> <%= rs.getString("specialservice") %></p>
            <p><strong>Class Type:</strong> <%= rs.getString("classtype") %></p>
            <p><strong>Trip Option:</strong> <%= rs.getString("tripoption") %></p>
            <p><strong>Total Price:</strong> <%= rs.getString("totalprice") %> $</p>
            <p><strong>Discount:</strong> <%= rs.getString("discount") %> $</p>
            <p><strong>Paid Total:</strong> <%= rs.getString("paidtotal") %> $</p>
            <p><strong>Booking Status:</strong> <%= rs.getString("bookstatus") %></p>
            <p><strong>Payment Status:</strong> <%= rs.getString("paymentStatus") %></p>
            <p><strong> Time:</strong> <%= rs.getString("booking_timestamp") %></p>
            <p><strong>Done On:</strong> <%= rs.getString("doneon") %></p>
            <%
                }
                
                // Fetch flight details and available seats
                String selectFlightDetails = "SELECT * FROM flighttb WHERE flightcode=?";
                pstmt = conn.prepareStatement(selectFlightDetails);
                pstmt.setString(1, flightCode);
                rss = pstmt.executeQuery();

                if (rss.next()) {
                    // Get the total available seats
                    int totalSeats = rss.getInt("flightseats");
                    String flightDepart = rss.getString("flightdeparturedate");
                    String flightArriva = rss.getString("flightarrivaldate");
                    String flightStartTime = rss.getString("flightstarttime");
                    String flightEndTime = rss.getString("flightendtime");
                    String flightFrom = rss.getString("flightfrom");
                    String flightTo = rss.getString("flightto");
                    String FloghtUrl = rss.getString("flighturl");
                    String flightName = rss.getString("flightname");
                    // Reduce one seat from available seats
                    int availableSeats = totalSeats - 1;
                    // Update available seats in flighttb
                    String updateSeatsQuery = "UPDATE flighttb SET flightseats=? WHERE flightcode=?";
                    pstmt = conn.prepareStatement(updateSeatsQuery);
                    pstmt.setInt(1, availableSeats);
                    pstmt.setString(2, flightCode);
                    int seatsUpdated = pstmt.executeUpdate();
                    
                    // Get the seat number
                    int assignedSeat = totalSeats -availableSeats  ;
                    // Update assigned seat in bookingtb
                    String updateAssignedSeatQuery = "UPDATE bookingtb SET assignedseat=? WHERE bookingcode=?";
                    pstmt = conn.prepareStatement(updateAssignedSeatQuery);
                    pstmt.setInt(1, availableSeats);
                    pstmt.setString(2, bookingCode);
                    int assignedSeatUpdated = pstmt.executeUpdate();
            %>
            <p><strong>Assigned Seat:</strong> <%= availableSeats %></p>
           
            <img src="<%= FloghtUrl %>" alt="Flight Image" style="width:80px; height: 50px;"/>
                <p><%= flightName %></p>

                
                <p>Departure Date :<%= flightDepart %> - Arrival Date:<%= flightArriva %></p>

                <p>Start Time : <%= flightStartTime %> End Time: <%= flightEndTime %></p>

                <p><%= flightFrom %> To <%= flightTo %></p>
            <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (rss != null) rss.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            %>
        </div>
        <div class="print-btn">
            <button onclick="window.print()">Print Ticket</button>
        </div>
    </div>
</body>
</html>
