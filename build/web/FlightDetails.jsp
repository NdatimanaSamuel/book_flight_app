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
    /* Add your custom styles here */
        /* Left side flight details */
        .flight-details-container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            padding: 20px;
            flex-wrap: wrap;
            
        }
        .flight-details {
            flex: 1;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            margin-right: 20px;
           
            flex-basis: calc(50% - 20px); /* Adjust width to 50% with 20px margin */
            margin-bottom: 20px; /* Add margin between divs */
        }
        .flight-details h2 {
            margin-top: 0;
        }
        /* Right side booking form */
        .flight-details,
        .booking-form {
            flex: 1;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            
        }
        .booking-form form {
            /* Add form styles */
              margin: 0;
        }
        .booking-form input,select{
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            height: 45px;
        }
        .booking-form button {
            width: 80%;
            padding: 12px;
            margin-left: 10%;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }
        .booking-form button:hover {
            background-color: #0056b3;
        }
    </style>
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
      
      </div>


    </div>
    <!-- Navbar & Hero End -->

    <!-- About End -->

    <!-- Service Start -->

    <!-- Package Start -->
<!-- Retrieve flight details from the database -->
    <%
        String flightCode = request.getParameter("flightCode");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String flightPriceOne=null;
        String flightPriceTwo=null;
        String flightPriceThree=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightdb", "root", "");
            String sql = "SELECT * FROM flighttb WHERE flightcode = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, flightCode);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                // Retrieve flight details
                String flightName = rs.getString("flightname");
                String flightDescr = rs.getString("flightdescr");
                String flightCodes = rs.getString("flightcode");
                    String flightDepart = rs.getString("flightdeparturedate");
                    String flightArriva = rs.getString("flightarrivaldate");
                    String flightStartTime = rs.getString("flightstarttime");
                    String flightEndTime = rs.getString("flightendtime");
                    String flightFrom = rs.getString("flightfrom");
                    String flightTo = rs.getString("flightto");
                 flightPriceOne = rs.getString("priceone");
                 flightPriceTwo = rs.getString("pricetwo");
                 flightPriceThree = rs.getString("pricethree");
                 String FloghtUrl = rs.getString("flighturl");
                // Add more flight details as needed
                
                // Display flight details
              

// Parse departure date string to LocalDate object
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
LocalDate departureDate = LocalDate.parse(flightDepart, formatter);

// Get the current date
LocalDate currentDate = LocalDate.now();

// Calculate the difference in days between departure date and current date
long daysDifference = java.time.temporal.ChronoUnit.DAYS.between(currentDate, departureDate);

// Initialize discount
int discount = 0;

// Check if the departure date is two or more days from the current date
if (daysDifference >= 1) {
    discount = 100; // Apply discount of 100
}
    // Importing java.util.Date to specify which Date class to use
//     SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
//    java.util.Date startTime = dateFormat.parse(flightStartTime);
//    java.util.Date endTime = dateFormat.parse(flightEndTime);
//
//    // Calculate the time difference in milliseconds
//    long timeDifferenceMillis = endTime.getTime() - startTime.getTime();
//
//    // Convert time difference from milliseconds to hours and minutes
//    long hours = timeDifferenceMillis / (1000 * 60 * 60);
//    long minutes = (timeDifferenceMillis / (1000 * 60)) % 60;
//
//    // Display the time difference in a paragraph
//    String timeDifferenceStr = hours + " hours and " + minutes + " minutes";


    %>
   <div class="flight-details-container">
    <div class="flight-details">
        <h5>Flight Details</h5><hr>
        <img src="<%= FloghtUrl %>" alt="Flight Image" style="width:80px; height: 50px;"/>
        <p><%= flightName %></p>
        
        <p>Flight Code :<%= flightCodes %></p>
        <p>Departure Date :<%= flightDepart %> - Arrival Date:<%= flightArriva %></p>
     
        <p>Start Time : <%= flightStartTime %> End Time: <%= flightEndTime %></p>

        <p><%= flightFrom %> To <%= flightTo %></p>
        
        <p>First Class: <%= flightPriceOne %>$</p>
        <p>Business Class:<%= flightPriceTwo %>$</p>
        <p>Economy Class:<%= flightPriceThree %>$</p>
        <!-- Add more flight details here -->
    </div>
        
    <div class="flight-details">
        <h5>Baggage Information (per person)</h5><hr>
        <img src="https://images-na.ssl-images-amazon.com/images/I/61pdJD6fJML._SL1500_.jpg" alt="Flight Image" style="width:80px; height: 50px;"/>
        <p>Personal Item Purse, small backpack, briefcase</p>
     
        <p>Carry-on bag Fits in overhead bin or under the seat</p>
        
        <p>2 Checked Bags Up to 2 pieces of checked baggage</p>
        <!-- Add more flight details here -->
        <h6>Traveler Details</h6><hr>
        <p>This Flight has One Way and <strong>Round Trip</strong> so also you get seats based on selected class no selection of seat </p>
        <p>so if you select <strong>Round Trip</strong> price based on selected class 
            will be times if is <strong>one way</strong> will keep be some </p>  
    </div>
    
<%
  // Get the current timestamp
  long timestamp = System.currentTimeMillis();
  
  // Generate a random number between 10000 and 99999
  Random random = new Random();
  int randomNumber = random.nextInt(90000) + 10000; // Generates a random number between 10000 and 99999
  
  // Combine timestamp and random number
  String code = Long.toString(timestamp) + randomNumber;
  code = code.substring(code.length() - 5); // Keep only the last 5 digits
%>
    <div class="booking-form">
        <!-- Booking form -->
        <form method="POST" action="CustomerQueries/bookingQuery.jsp" >
            <!-- Add form fields for booking details -->
            <!-- Example: -->
            <div class="row">
                <div class="col-md-6">
                    <input type="hidden" id="name" name="flghtcode" value="<%= flightCodes%>" >
                    <input type="hidden" id="bookingCode" name="bookingCodes" value="<%= code%>" >
                    
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="namess" required>
                </div>
                <div class="col-md-6">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="emails" required>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <label for="phone">Phone:</label>
                    <input type="text" id="phone" name="phones" required>
                </div>
                <div class="col-md-6">
                    <label for="birthdate">Birth date:</label>
                    <input type="date" id="birthdate" name="birthdates" required>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <label for="passportdetails">Passport Details:</label>
                    <input type="text" id="passportdetails" name="passportdetailss" required>
                </div>
                <div class="col-md-6">
                    <label for="issuingdate">Issuing Date:</label>
                    <input type="date" id="issuingdate" name="issuingdates" required>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <label for="expiredate">Expire Date:</label>
                    <input type="date" id="expiredate" name="expiredates" required>
                </div>
                <div class="col-md-6">
                    <label for="issuingcountry">Issuing Country:</label>
                    <select id="issuingcountry" name="issuingcountrys">
                        <option value="Rwanda">Rwanda</option>
                        <option value="Uganda">Uganda</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <label for="gender">Gender:</label>
                    <select id="gender" name="genders">
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label for="specialservices">Special Services:</label>
                    <select id="specialservices" name="specialservicess">
                        <option value="No Special Services">No Special Services</option>
                        <option value="Blind Passenger">Blind Passenger</option>
                        <option value="Deaf Passenger">Deaf Passenger</option>
                        <option value="Stretcher Assistance">Stretcher Assistance</option>
                    </select>
                </div>
            </div>
            <div class="row">
              
                <div class="col-md-6">
                <label for="class">Class:</label>
                <select id="class" name="classs" onchange="calculateTotalPrice()">
                    <option value="First Class">First Class</option>
                    <option value="Business Class">Business Class</option>
                    <option value="Economy Class">Economy Class</option>
                </select>
            </div>
                
                 <div class="col-md-6">
                <label for="trip">Trip Option:</label>
                <select id="trip" name="trips" onchange="calculateTotalPrice()">
                    <option value="One Way">One Way</option>
                    <option value="Round Trip">Round Trip</option>
                </select>
            </div>
                
                 <div class="col-md-12">
                <label for="totalPrice">Total Price:</label>
                
                <input type="text" id="totalPrice" name="totalPrices" >
               </div>
                
                <div class="col-md-12">
                <label for="totalPrice">Discount  :</label>
                
               <input type="text" id="discount" name="discountss" value="<%= discount %>" >
               </div>
 
            </div>
            <!-- Add more form fields as needed -->
            <button type="submit">Book Now</button>
        </form>
    </div>
</div>

            
    <%
            } else {
                // Flight not found
                out.println("Flight not found.");
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
    
    <script>
    function calculateTotalPrice() {
        var classPrice;
        var tripPrice = 1; // Default to One Way trip

        // Get selected class
        var selectedClass = document.getElementById("class").value;
        // Get selected trip option
        var selectedTrip = document.getElementById("trip").value;

        // Set classPrice based on selected class
        if (selectedClass === "First Class") {
            classPrice = <%= flightPriceOne %>;
        } else if (selectedClass === "Business Class") {
            classPrice = <%= flightPriceTwo %>;
        } else if (selectedClass === "Economy Class") {
            classPrice = <%= flightPriceThree %>;
        }

        // If Round Trip is selected, double the tripPrice
        if (selectedTrip === "Round Trip") {
            tripPrice = 2;
        }

        // Calculate total price
        var totalPrice = classPrice * tripPrice;

        // Display total price in the input field
        document.getElementById("totalPrice").value = totalPrice;
    }
</script>



  </body>
</html>
