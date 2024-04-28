<%-- 
    Document   : AddNewFlight
    Created on : Apr 24, 2024, 2:24:17 PM
    Author     : Proffesor Sum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html lang="en">

 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Flight Booking Ms</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/libs/css/style.css">
    <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
</head>

<body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
         <!-- ============================================================== -->
        <!-- navbar -->
        <!-- ============================================================== -->
         <div class="dashboard-header">
            <nav class="navbar navbar-expand-lg bg-white fixed-top">
                <a class="navbar-brand" href="Home.jsp">Telex Flight</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">
                        <li class="nav-item">
                            <div id="custom-search" class="top-search-bar">
                                <input class="form-control" type="text" placeholder="Search..">
                            </div>
                        </li>
                        
                       
                        <li class="nav-item dropdown nav-user">
                            <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="assets/images/avatar-1.jpg" alt="" class="user-avatar-md rounded-circle"></a>
                            <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                                <div class="nav-user-info">
                                    <h5 class="mb-0 text-white nav-user-name"><%= session.getAttribute("Name") %></h5>
                                    <span class="status"></span><span class="ml-2">Available</span>
                                </div>
                                <a class="dropdown-item" href="#"><i class="fas fa-user mr-2"></i>Account</a>
                                <a class="dropdown-item" href="#"><i class="fas fa-cog mr-2"></i>Setting</a>
                                <a class="dropdown-item" href="logout.jsp"><i class="fas fa-power-off mr-2"></i>Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <!-- ============================================================== -->
        <!-- end navbar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- left sidebar -->
        <!-- ============================================================== -->
        <%@ include file="AdminMenu.jsp" %>
        <!-- ============================================================== -->
        <!-- end left sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="container-fluid  dashboard-content">
                <!-- ============================================================== -->
                <!-- pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <h2 class="pageheader-title">Manage New Flight </h2>
                            <!-- <p class="pageheader-text">Proin placerat ante duiullam scelerisque a velit ac porta, fusce sit amet vestibulum mi. Morbi lobortis pulvinar quam.</p>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Forms</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Form Validations</li>
                                    </ol>
                                </nav>
                            </div> -->
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader -->
                <!-- ============================================================== -->
             
                    <div class="row">
                        <!-- ============================================================== -->
                        <!-- validation form -->
                        <!-- ============================================================== -->
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="card">
                                <h5 class="card-header">Add New Flight</h5>
                                <div class="card-body">
                                    <form method="post" action="queries/addFlightQuery.jsp" class="needs-validation" novalidate>
                                        <div class="row">
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <label for="validationCustom01">Flight Code</label>
                                                <input type="text" name="flightcode" class="form-control" id="validationCustom01" placeholder="Flight Code" readonly>
                                            </div>
                                              <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
                                                <label for="validationCustom02" style="margin-bottom: -10px;">Flight Name</label>
                                                <input type="text" name="flightname" class="form-control" id="validationCustom02" placeholder="Flight Name"  required>
                                                
                                            </div>
                                            
                                             <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
                                                <label for="validationCustom02" style="margin-bottom: -10px;">Flight Seats</label>
                                                <input type="text" name="flightseats" class="form-control" id="validationCustom02" placeholder="Flight Seats"  required>
                                                
                                            </div>
                                            
                                             <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
                                                <label for="validationCustom02" style="margin-bottom: -10px;">Flight Description</label>
                                                <input type="text" name="flightdesc" class="form-control" id="validationCustom02" placeholder="Flight Description"  required>
                                                
                                            </div>
                                            
                                             <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
                                                <label for="validationCustom02" style="margin-bottom: -10px;">Flight URL</label>
                                                <input type="text" name="flighturl" class="form-control" id="validationCustom02" placeholder="Flight URL"  required>
                                                
                                            </div>
<!--                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
                                                <label for="validationCustomUsername">Username</label>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="inputGroupPrepend">@</span>
                                                    </div>
                                                    <input type="text" class="form-control" id="validationCustomUsername" placeholder="Username" aria-describedby="inputGroupPrepend" required>
                                                    <div class="invalid-feedback">
                                                        Please choose a username.
                                                    </div>
                                                </div>
                                            </div>-->
                                        </div>
                                        <div class="form-row">
                                            
                                            <div class="col-xl-2 col-lg-2 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom03">Departure Date </label>
                                                <input type="date" name="departuredate"  class="form-control" id="validationCustom03" required>
                                                
                                            </div>
                                            
                                            <div class="col-xl-2 col-lg-2 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom05">Arrival Date </label>
                                                <input type="date"  name="arrivaldate"class="form-control" id="validationCustom05"  required>
                                               
                                            </div>
                                            
                                           
                                            
                                            <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom03">Start Time </label>
                                                <input type="time" name="starttime"  class="form-control" id="validationCustom03" required>
                                                
                                            </div>
                                            
                                            <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom05">End Time </label>
                                                <input type="time"  name="endtime"class="form-control" id="validationCustom05"  required>
                                               
                                            </div>
                                            
                                             <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom03">From : </label>
                                                <input type="text" name="fromplace"  class="form-control" id="validationCustom03" required>
                                                
                                            </div>
                                            
                                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom05">To : </label>
                                                <input type="text"  name="toplace"class="form-control" id="validationCustom05"  required>
                                               
                                            </div>
                  
                                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom03">Category One </label>
                                                <input type="text" name="ctgryone" value="FirstClass" class="form-control" id="validationCustom03" placeholder="Price" readonly>
                                                
                                            </div>
                                            
                                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom05">Price</label>
                                                <input type="text"  name="priceone"class="form-control" id="validationCustom05" placeholder="Price " required>
                                               
                                            </div>
                                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom03">Category Two </label>
                                                <input type="text" name="ctgrytwo" value="BusinessClass" class="form-control" id="validationCustom03" placeholder="Price" readonly>
                                                
                                            </div>
                                            
                                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom05">Price </label>
                                                <input type="text" name="pricetwo" class="form-control" id="validationCustom05" placeholder="Price " required>
                                               
                                            </div>
                                            
                                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom03">Category Three </label>
                                                <input type="text" name="ctgrythree" value="EconomyClass" class="form-control" id="validationCustom03" placeholder="Price" readonly>
                                                
                                            </div>
                                            
                                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom05">Price </label>
                                                <input type="text" name="pricethree" class="form-control" id="validationCustom05" placeholder="Price " required>
                                               
                                            </div>
                                           
                                         
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
                                                <button class="btn btn-primary" type="submit">Submit </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end validation form -->
                        <!-- ============================================================== -->
                    </div>
                   
                    
           
            </div>
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
        <div class="footer" style="margin-left: 300px; padding: 20px;position: fixed;left: 0; bottom: 0; width: 70%;">
                <div class="container-fluid">
                  <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                      Copyright © 2024 . All rights reserved by
                      <a href="#">Telex Flight</a>.
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                      <div class="text-md-right footer-links d-none d-sm-block">
                        <a href="#">About</a>
                        <a href="#">Support</a>
                        <a href="#">Contact Us</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            <!-- ============================================================== -->
            <!-- end footer -->
            <!-- ============================================================== -->
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="assets/vendor/parsley/parsley.js"></script>
    <script src="assets/libs/js/main-js.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script>
    $('#form').parsley();
    </script>
    <script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function() {
        'use strict';
        window.addEventListener('load', function() {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
    
      <%-- Check if the status parameter is present in the URL and display corresponding SweetAlert message --%>
    var status = getParameterByName('status');
    if (status === 'failed') {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Invalid username or password!',
        });
    }
    </script>
    
    <script>
    // Function to generate a random code based on the current time
    function generateRandomCode() {
        // Get the current timestamp
        var timestamp = new Date().getTime();
        // Convert the timestamp to a string and take the last 4 digits
        var randomCode = timestamp.toString().slice(-4);
        // Return the generated random code
        return randomCode;
    }

    // Set the value of the flight code input field to the generated random code
    document.getElementById('validationCustom01').value = generateRandomCode();
</script>
</body>
 
</html>