<%
// Check if the user is logged in by checking if the "email" attribute is set in the session
String email = (String) session.getAttribute("email");
boolean isLoggedIn = (email != null && !email.isEmpty());
%>
<div class="collapse navbar-collapse" id="navbarCollapse">
    <div class="navbar-nav ms-auto py-0">
        
        
        
        <!-- Check if user is logged in -->
        <% if (isLoggedIn) { %>
            <!-- Display Logout link -->
            <a href="CustomerHome.jsp" class="nav-item nav-link active">Home</a>
             <a href="viewAllBooking.jsp" class="nav-item nav-link ">Manage Booking</a>
            <a href="Logout.jsp" class="nav-item nav-link">Logout</a>
        <% } else { %>
            <!-- Display Sign In link -->
            
            <a href="index.jsp" class="nav-item nav-link active">Home</a>
            
            <a href="package.jsp" class="nav-item nav-link ">Packages</a>
        <a href="contact.jsp" class="nav-item nav-link ">Contact</a>
        <a href="SignIn.jsp" class="nav-item nav-link">Sign In</a>
            
            <!-- Display Register link -->
            <a href="SignUp.jsp" class="nav-item nav-link">Register</a>
        <% } %>
        <div id="google_translate_element"></div>

            <script type="text/javascript">
           function googleTranslateElementInit() {
           new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
            }
          </script>
                                
            <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
    </div>
</div>