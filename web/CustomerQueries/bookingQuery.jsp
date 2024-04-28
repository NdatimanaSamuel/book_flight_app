<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Query</title>
    <!-- Add your CSS and JavaScript libraries here -->
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
    <%
        // Retrieve form data
        String names = request.getParameter("namess");
        String bookingCode = request.getParameter("bookingCodes");
        String flghtcodes = request.getParameter("flghtcode");
        String email = request.getParameter("emails");
        String phone = request.getParameter("phones");
        String birthdate = request.getParameter("birthdates");
        String passportdetails = request.getParameter("passportdetailss");
        String issuingdate = request.getParameter("issuingdates");
        String expiredate = request.getParameter("expiredates");
        String issuingcountry = request.getParameter("issuingcountrys");
        String gender = request.getParameter("genders");
        String specialservices = request.getParameter("specialservicess");
        String flightClass = request.getParameter("classs");
        String tripOption = request.getParameter("trips");
        String totalPrice = request.getParameter("totalPrices");
        String discount = request.getParameter("discountss");

        // Parse strings to integers
        int totalPriceToPay = Integer.parseInt(totalPrice);
        int discountApplied = Integer.parseInt(discount);

        // Calculate the paid total
        int paidTotal = totalPriceToPay - discountApplied;
        // Set payment status initially to unpaid
        String paymentStatus = "Unpaid";

        // Get the current date
        Date currentDate = new Date();

        // Convert the java.util.Date to java.sql.Date
        java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());
        
    // Format the date into the desired format (e.g., "yyyy-MM-dd HH:mm:ss")
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String formattedDate = dateFormat.format(currentDate);

        // Insert booking details into the database
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            // Establish database connection
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightdb", "root", "");

            // Check if email or phone already exist and payment status is pending
            String checkQuery = "SELECT * FROM bookingtb WHERE (email = ? OR phone = ?) AND paymentStatus = 'Unpaid'";
            pstmt = conn.prepareStatement(checkQuery);
            pstmt.setString(1, email);
            pstmt.setString(2, phone);
            rs = pstmt.executeQuery();

            // If email or phone exists and payment status is pending, show error message
            if (rs.next()) {
%>
<script>
    Swal.fire({
        icon: 'error',
        title: 'Error',
        text: 'You have an unpaid booking. Please complete the payment before making another booking.',
        confirmButtonText: 'OK',
         }).then((result) => {
        // Redirect to another page after the user clicks OK
        window.location.href = '../CustomerHome.jsp';
    });
   
</script>
<%
            } else {
                // Insert booking details into the specified table
                String sql = "INSERT INTO bookingtb (bookingcode, flightcode, names, email, phone, birthdate, passportnbr, issuedate, expiredate, issuectry, gender, specialservice, classtype, tripoption, totalprice, discount, paidtotal, bookstatus, paymentStatus, booking_timestamp, doneon) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, bookingCode);
                pstmt.setString(2, flghtcodes);
                pstmt.setString(3, names);
                pstmt.setString(4, email);
                pstmt.setString(5, phone);
                pstmt.setString(6, birthdate);
                pstmt.setString(7, passportdetails);
                pstmt.setString(8, issuingdate);
                pstmt.setString(9, expiredate);
                pstmt.setString(10, issuingcountry);
                pstmt.setString(11, gender);
                pstmt.setString(12, specialservices);
                pstmt.setString(13, flightClass);
                pstmt.setString(14, tripOption);
                pstmt.setString(15, totalPrice);
                pstmt.setString(16, discount);
                pstmt.setInt(17, paidTotal);
                pstmt.setString(18,"pending");
                pstmt.setString(19, paymentStatus);
                pstmt.setString(20, formattedDate);
                pstmt.setDate(21, sqlDate);

                int rowsAffected = pstmt.executeUpdate();

                // Check if the booking was successfully inserted
                if (rowsAffected > 0) {
%>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        Swal.fire({
            title: 'Success!',
            text: 'Your booking has been confirmed. Redirecting to Payment Process...',
            icon: 'success',
            showConfirmButton: false,
            timer: 2000 // Close alert after 3 seconds
        }).then((result) => {
            // Redirect to payment page after 3 seconds
            setTimeout(function() {
                // Concatenate bookingCode and flightCode in the URL
                var bookingCode = '<%= bookingCode %>';
                var flightCode = '<%= flghtcodes %>';
                var url = "../Payment.jsp?bookingcodes=" + encodeURIComponent(bookingCode) + "&flightcodes=" + encodeURIComponent(flightCode);
                window.location.href = url;
            }, 2000);
        });
    });
</script>

<%
                } else {
%>
<script>
    Swal.fire({
        icon: 'error',
        title: 'Error',
        text: 'Failed to insert the Flight into the Flight table.',
        confirmButtonText: 'OK'
    });
</script>
<%
                }
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
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>
</body>
</html>
