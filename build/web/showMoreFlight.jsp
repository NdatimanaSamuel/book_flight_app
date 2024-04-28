<%-- 
    Document   : showMoreFlight
    Created on : Apr 24, 2024, 1:28:47 PM
    Author     : Proffesor Sum
--%>

<%@page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    <style>
      .flight-details {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        border: 1px solid #ccc;
        border-radius: 8px;
        padding: 20px;
        margin-bottom: 20px;
      }

      .flight-details img {
        max-width: 100px;
        border-radius: 8px;
        margin-bottom: 10px;
      }

      .flight-details h5 {
        margin: 0;
      }

      .flight-details p {
        margin: 5px 0;
      }

      .flight-details .details {
        display: flex;
        justify-content: space-between;
        width: 100%;
      }

      .flight-details .details div {
        flex: 1;
        text-align: right;
      }

      .btn-primary {
        align-self: flex-start;
      }
    </style>
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
        <div class="container py-5">
          <div class="row justify-content-center py-5">
            <div class="col-lg-10 pt-lg-5 mt-lg-5 text-center">
              <h1 class="display-3 text-white mb-3 animated slideInDown">
                Search Airplane here
              </h1>
              <p class="fs-4 text-white mb-4 animated slideInDown">
                Then Book a Ticket With Us
              </p>
              <div class="position-relative w-75 mx-auto animated slideInDown">
                <input
                  class="form-control border-0 rounded-pill w-100 py-3 ps-4 pe-5"
                  type="text"
                  placeholder="Eg: Thailand"
                />
                <!-- <button type="button" class="btn btn-primary rounded-pill py-2 px-4 position-absolute top-0 end-0 me-2" style="margin-top: 7px;">Search</button> -->
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="container" style="margin-top: -270px">
        <div class="row justify-content-center">
          <div class="col-lg-8">
            <div class="card">
              <div class="card-body">
                          <form action="SearchedFlight.jsp" method="get">
    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="from">From</label>
            <input
                type="text"
                class="form-control"
                id="from"
                name="from"
                placeholder="Departure City" required=""
            />
        </div>
        <div class="col-md-6 mb-3">
            <label for="to">To</label>
            <input
                type="text"
                class="form-control"
                id="to"
                name="to"
                placeholder="Destination City" required=""
            />
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="departure-date">Departure Date</label>
            <input
                type="date"
                class="form-control"
                id="departure-date"
                name="departure-date"
                required=""
            />
        </div>
        <div class="col-md-6 mb-3">
            <label for="return-date">Return Date</label>
            <input
                type="date"
                class="form-control"
                id="return-date"
                name="return-date"
                required=""
            />
        </div>
    </div>
    <button type="submit" class="btn btn-primary">Search</button>
</form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Navbar & Hero End -->

    <!-- About End -->

    <!-- Service Start -->

    <!-- Package Start -->
    <div class="container-xxl py-5">
      <div class="container">
        <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
          <h6 class="section-title bg-white text-center text-primary px-3">
            Flight Details
          </h6>
        </div>
        <div class="row justify-content-center">
          <div class="col-lg-12">

<%
    // Define the number of records to display per page
    int recordsPerPage = 3;

    // Retrieve the selected flight parameters from the URL
    String from = request.getParameter("from");
    String to = request.getParameter("to");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightdb", "root", "");
        // Get the current date
        Date currentDate = new Date();
        // SQL query to select flights based on origin and destination
        String sql = "SELECT DISTINCT flightcode, flightname, flighturl, flightdescr, flightfrom, flightto, flightdeparturedate, flightarrivaldate, priceone, pricetwo, pricethree " +
                     "FROM flighttb " +
                     "WHERE flightfrom = ? AND flightto = ? AND flightdeparturedate >= ?" +
                     "ORDER BY flightdeparturedate ASC";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, from);
        pstmt.setString(2, to);
        pstmt.setDate(3, new java.sql.Date(currentDate.getTime()));
        rs = pstmt.executeQuery();
        
        // Pagination logic
        int pageNumber = 1;
        String pageNum = request.getParameter("page");
        if (pageNum != null && !pageNum.isEmpty()) {
            pageNumber = Integer.parseInt(pageNum);
        }
        int start = (pageNumber - 1) * recordsPerPage;
        int count = 0;
        
        // Display flight details
        while (rs.next()) {
            if (count >= start && count < (start + recordsPerPage)) {
                String flightCode = rs.getString("flightcode");
                String flightName = rs.getString("flightname");
                String flightDescr = rs.getString("flightdescr");
                String flightDepartureDate = rs.getString("flightarrivaldate");
                String flightArrivalDate = rs.getString("flightdeparturedate");
                String FlightFrom = rs.getString("flightfrom");
                String FlightTo = rs.getString("flightto");
                String FloghtUrl = rs.getString("flighturl");
                double priceOne = rs.getDouble("priceone");
                double priceTw = rs.getDouble("pricetwo");
                double priceThr = rs.getDouble("pricethree");
%>
  <!-- Display flight details -->
    <div class="flight-details">
        <img src="<%= FloghtUrl %>" alt="Flight Image" width="100"/>
        <h5><%= flightName %></h5>
        <div class="details">
            <div>
                <p>Departure Date: <%= flightDepartureDate %></p>
                <p>Arrival Date: <%= flightArrivalDate %></p>
            </div>
            <div>
                <p>From: <%= FlightFrom %></p>
                <p>To: <%= FlightTo %></p>
            </div>
            <div>
                <p>First Price: $<%= priceOne %></p>
                <p>Business Price: $<%= priceTw %></p>
                <p>Economy Price: $<%= priceThr %></p>
            </div>
<%
// Check if the user is logged in by checking if the "email" attribute is set in the session
String emails = (String) session.getAttribute("email");
boolean isLoggedIns = (email != null && !email.isEmpty());

%>

<% if (isLoggedIn) { %>
    <!-- Display the "Book Now" button if the user is logged in -->
    <div>
        <button class="btn btn-primary" onclick="redirectToFlightDetails('<%= flightCode %>')">Book Now</button>
    </div>
<% } %>

<script>
    function redirectToFlightDetails(flightCode) {
        // Redirect to FlightDetails.jsp with flightCode parameter
        window.location.href = "FlightDetails.jsp?flightCode=" + flightCode;
    }
</script>

        </div>
            
    </div>
            
    <%
            }
            count++;
        }
%>
<%
        // Pagination controls
        int totalPages = (int) Math.ceil((double) count / recordsPerPage);
%>
<div class="text-center">
    <ul class="pagination">
        <% if (pageNumber > 1) { %>
            <li class="page-item"><a class="page-link" href="showMoreFlight.jsp?from=<%=from%>&to=<%=to%>&page=<%=pageNumber - 1%>">Previous</a></li>
        <% } %>
        <% for (int i = 1; i <= totalPages; i++) { %>
            <li class="page-item <%= i == pageNumber ? "active" : "" %>"><a class="page-link" href="showMoreFlight.jsp?from=<%=from%>&to=<%=to%>&page=<%=i%>"><%=i%></a></li>
        <% } %>
        <% if (pageNumber < totalPages) { %>
            <li class="page-item"><a class="page-link" href="showMoreFlight.jsp?from=<%=from%>&to=<%=to%>&page=<%=pageNumber + 1%>">Next</a></li>
        <% } %>
    </ul>
</div>
<%
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
        </div>
      </div>
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
  </body>
</html>
