<%-- 
    Document   : showMoreFlight
    Created on : Apr 24, 2024, 1:28:47 PM
    Author     : Proffesor Sum
--%>
<%@ page import="java.util.Random" %>
<%@page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Telex Flight</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="keywords" />
    <meta content="" name="description" />

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap"
      rel="stylesheet"
    />

    <!-- Icon Font Stylesheet -->
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
      rel="stylesheet"
    />

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet" />
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />
    <link
      href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
      rel="stylesheet"
    />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet" />

  </head>

  <body>
    <!-- Spinner Start -->
    <div
      id="spinner"
      class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center"
    >
      <div
        class="spinner-border text-primary"
        style="width: 3rem; height: 3rem"
        role="status"
      >
        <span class="sr-only">Loading...</span>
      </div>
    </div>
    <!-- Spinner End -->

    <!-- Topbar Start -->
    <div class="container-fluid bg-dark px-5 d-none d-lg-block">
      <div class="row gx-0">
        <div class="col-lg-8 text-center text-lg-start mb-2 mb-lg-0">
          <div class="d-inline-flex align-items-center" style="height: 45px">
            <small class="me-3 text-light"
              ><i class="fa fa-map-marker-alt me-2"></i>123 Rubavu, Gisenyi,
              Rwanda</small
            >
            <small class="me-3 text-light"
              ><i class="fa fa-phone-alt me-2"></i>+250781110784</small
            >
            <small class="text-light"
              ><i class="fa fa-envelope-open me-2"></i
              >telexflight@telex.ac.rw</small
            >
          </div>
        </div>
        <div class="col-lg-4 text-center text-lg-end">
          <div class="d-inline-flex align-items-center" style="height: 45px">
            <a
              class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2"
              href=""
              ><i class="fab fa-twitter fw-normal"></i
            ></a>
            <a
              class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2"
              href=""
              ><i class="fab fa-facebook-f fw-normal"></i
            ></a>
            <a
              class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2"
              href=""
              ><i class="fab fa-linkedin-in fw-normal"></i
            ></a>
            <a
              class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2"
              href=""
              ><i class="fab fa-instagram fw-normal"></i
            ></a>
            <a
              class="btn btn-sm btn-outline-light btn-sm-square rounded-circle"
              href=""
              ><i class="fab fa-youtube fw-normal"></i
            ></a>
          </div>
        </div>
      </div>
    </div>
    <!-- Topbar End -->

    <!-- Navbar & Hero Start -->
    <div class="container-fluid position-relative p-0">
      <nav
        class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0"
      >
        <a href="" class="navbar-brand p-0">
          <h1 class="text-primary m-0">
            <i class="fa fa-plane" aria-hidden="true"></i>Flight
          </h1>
          <!-- <img src="img/logo.png" alt="Logo"> -->
        </a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarCollapse"
        >
          <span class="fa fa-bars"></span>
        </button>
      <%@ include file="CustomerMenu.jsp" %>
      </nav>
      <div class="container-fluid bg-primary py-5 mb-5 hero-header">
      
      </div>


    </div>
    <!-- Navbar & Hero End -->

    <!-- About End -->

    <!-- Service Start -->

    <!-- Package Start -->
<!-- Retrieve flight details from the database -->
    

<!-- Booking form -->
<!-- Booking Details Section -->

<div class="container booking-details">
    <%
        // Retrieve booking details from bookingtb based on bookingcode
        String bookingCode = request.getParameter("id"); // Get booking code from request parameter

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ResultSet rss = null;
        String flightCode = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightdb", "root", "");

            // Fetch booking details based on the provided booking code
            String selectBookingDetails = "SELECT * FROM bookingtb WHERE bookingcode = ?";
            pstmt = conn.prepareStatement(selectBookingDetails);
            pstmt.setString(1, bookingCode);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // Display booking details
                flightCode = rs.getString("flightcode");
            %>
                <div class="ticket-container">
                    <div class="ticket-header">
                        <h2>Airplane Booking Details</h2>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="ticket-details">

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

                                <!-- Display other booking details similarly -->
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="ticket-details">
                                <p><strong>Gender:</strong> <%= rs.getString("gender") %></p>
                                <p><strong>Special Service:</strong> <%= rs.getString("specialservice") %></p>
                                <p><strong>Class Type:</strong> <%= rs.getString("classtype") %></p>
                                <p><strong>Trip Option:</strong> <%= rs.getString("tripoption") %></p>
                                <p><strong>Total Price:</strong> <%= rs.getString("totalprice") %></p>
                                <p><strong>Discount:</strong> <%= rs.getString("discount") %></p>
                                <p><strong>Paid Total:</strong> <%= rs.getString("paidtotal") %></p>
                                <p><strong>Booking Status:</strong> <%= rs.getString("bookstatus") %></p>
                                <p><strong>Payment Status:</strong> <%= rs.getString("paymentStatus") %></p>
                                <p><strong> Time:</strong> <%= rs.getString("booking_timestamp") %></p>
                                <p><strong>Done On:</strong> <%= rs.getString("doneon") %></p>
                                <!-- Display other booking details similarly -->
                            </div>
                        </div>
                                
                                 <div class="col-md-4">
                                    <h4>Flight Details</h4>
                                    <p><strong>Flight Departure Date:</strong> <%= rss.getString("flightdeparturedate") %></p>
                                    <p><strong>Flight Arrival Date:</strong> <%= rss.getString("flightarrivaldate") %></p>
                                    <!-- Display other flight details similarly -->
                                    <img src="<%= FloghtUrl %>" alt="Flight Image" style="width:80px; height: 50px;"/>
                                    <p><%= flightName %></p>


                                    <p>Departure Date :<%= flightDepart %> - Arrival Date:<%= flightArriva %></p>

                                    <p>Start Time : <%= flightStartTime %> End Time: <%= flightEndTime %></p>

                                    <p><%= flightFrom %> To <%= flightTo %></p>
                                </div>
                                <div>
                                    <!-- Print Button -->
                               <button class="btn btn-primary btn-lg" onclick="window.print()">Print</button>
                                </div>
                
            </div>
        </div>
    </div>
</div>
<%
            } else {
                // If no booking details found for the provided booking code
%>
    <div class="alert alert-danger" role="alert">
        No booking details found for the provided booking code.
    </div>
<%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
%>
</div>






    <!-- Process Start -->

    <!-- Footer Start -->
    <div
      class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn"
      data-wow-delay="0.1s"
    >
      <div class="container py-5">
        <div class="row g-5">
          <div class="col-lg-3 col-md-6">
            <h4 class="text-white mb-3">Company</h4>
            <a class="btn btn-link" href="">About Us</a>
            <a class="btn btn-link" href="">Contact Us</a>
            <a class="btn btn-link" href="">Privacy Policy</a>
            <a class="btn btn-link" href="">Terms & Condition</a>
            <a class="btn btn-link" href="">FAQs & Help</a>
          </div>
          <div class="col-lg-3 col-md-6">
            <h4 class="text-white mb-3">Contact</h4>
            <p class="mb-2">
              <i class="fa fa-map-marker-alt me-3"></i>123 Street, Rubavu
              Gisenyi, Rwanda
            </p>
            <p class="mb-2">
              <i class="fa fa-phone-alt me-3"></i>+250781110784
            </p>
            <p class="mb-2">
              <i class="fa fa-envelope me-3"></i>telexflight@telex.ac.rw
            </p>
            <div class="d-flex pt-2">
              <a class="btn btn-outline-light btn-social" href=""
                ><i class="fab fa-twitter"></i
              ></a>
              <a class="btn btn-outline-light btn-social" href=""
                ><i class="fab fa-facebook-f"></i
              ></a>
              <a class="btn btn-outline-light btn-social" href=""
                ><i class="fab fa-youtube"></i
              ></a>
              <a class="btn btn-outline-light btn-social" href=""
                ><i class="fab fa-linkedin-in"></i
              ></a>
            </div>
          </div>
          <div class="col-lg-3 col-md-6">
            <h4 class="text-white mb-3">Gallery</h4>
            <div class="row g-2 pt-2">
              <div class="col-4">
                <img
                  class="img-fluid bg-light p-1"
                  src="img/package-1.jpg"
                  alt=""
                />
              </div>
              <div class="col-4">
                <img
                  class="img-fluid bg-light p-1"
                  src="img/package-2.jpg"
                  alt=""
                />
              </div>
              <div class="col-4">
                <img
                  class="img-fluid bg-light p-1"
                  src="img/package-3.jpg"
                  alt=""
                />
              </div>
              <div class="col-4">
                <img
                  class="img-fluid bg-light p-1"
                  src="img/package-2.jpg"
                  alt=""
                />
              </div>
              <div class="col-4">
                <img
                  class="img-fluid bg-light p-1"
                  src="img/package-3.jpg"
                  alt=""
                />
              </div>
              <div class="col-4">
                <img
                  class="img-fluid bg-light p-1"
                  src="img/package-1.jpg"
                  alt=""
                />
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-6"></div>
        </div>
      </div>
      <div class="container">
        <div class="copyright">
          <div class="row">
            <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
              &copy; <a class="border-bottom" href="#">Telex Flight</a>, All
              Right Reserved.

              <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
            </div>
            <div class="col-md-6 text-center text-md-end">
              <div class="footer-menu">
                <a href="">Home</a>
                <a href="">Cookies</a>
                <a href="">Help</a>
                <a href="">FQAs</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Footer End -->

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"
      ><i class="bi bi-arrow-up"></i
    ></a>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    


 
<!-- Include jQuery for simplicity in making AJAX requests -->


  </body>
</html>
