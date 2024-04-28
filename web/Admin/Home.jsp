<%-- 
    Document   : Home
    Created on : Apr 24, 2024, 2:21:35 PM
    Author     : Proffesor Sum
--%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="javax.naming.*, javax.sql.*" %>
<%@ page import="java.io.*, java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="assets/vendor/bootstrap/css/bootstrap.min.css"
    />
    <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/libs/css/style.css" />
    <link
      rel="stylesheet"
      href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css"
    />
    <link
      rel="stylesheet"
      href="assets/vendor/charts/chartist-bundle/chartist.css"
    />
    <link
      rel="stylesheet"
      href="assets/vendor/charts/morris-bundle/morris.css"
    />
    <link
      rel="stylesheet"
      href="assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css"
    />
    <link rel="stylesheet" href="assets/vendor/charts/c3charts/c3.css" />
    <link
      rel="stylesheet"
      href="assets/vendor/fonts/flag-icon-css/flag-icon.min.css"
    />
    <title>Flight Booking Ms</title>
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
          <a class="navbar-brand" href="index.html">Telex Flight</a>
          <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto navbar-right-top">
              <li class="nav-item">
                <div id="custom-search" class="top-search-bar">
                  <input
                    class="form-control"
                    type="text"
                    placeholder="Search.."
                  />
                </div>
              </li>
              <!-- <li class="nav-item dropdown notification">
                            <a class="nav-link nav-icons" href="#" id="navbarDropdownMenuLink1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-fw fa-bell"></i> <span class="indicator"></span></a>
                            <ul class="dropdown-menu dropdown-menu-right notification-dropdown">
                                <li>
                                    <div class="notification-title"> Notification</div>
                                    <div class="notification-list">
                                        <div class="list-group">
                                            <a href="#" class="list-group-item list-group-item-action active">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="assets/images/avatar-2.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">Jeremy Rakestraw</span>accepted your invitation to join the team.
                                                        <div class="notification-date">2 min ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="list-group-item list-group-item-action">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="assets/images/avatar-3.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">John Abraham </span>is now following you
                                                        <div class="notification-date">2 days ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="list-group-item list-group-item-action">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="assets/images/avatar-4.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">Monaan Pechi</span> is watching your main repository
                                                        <div class="notification-date">2 min ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="list-group-item list-group-item-action">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="assets/images/avatar-5.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">Jessica Caruso</span>accepted your invitation to join the team.
                                                        <div class="notification-date">2 min ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="list-footer"> <a href="#">View all notifications</a></div>
                                </li>
                            </ul>
                        </li> -->
   
              <li class="nav-item dropdown nav-user">
                <a
                  class="nav-link nav-user-img"
                  href="#"
                  id="navbarDropdownMenuLink2"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                  ><img
                    src="assets/images/avatar-1.jpg"
                    alt=""
                    class="user-avatar-md rounded-circle"
                /></a>
                <div
                  class="dropdown-menu dropdown-menu-right nav-user-dropdown"
                  aria-labelledby="navbarDropdownMenuLink2"
                >
                  <div class="nav-user-info">
                    <h5 class="mb-0 text-white nav-user-name"> <%= session.getAttribute("Name") %></h5>
                    <span class="status"></span
                    ><span class="ml-2">Available</span>
                  </div>
                  <a class="dropdown-item" href="#"
                    ><i class="fas fa-user mr-2"></i>Account</a
                  >
                  <a class="dropdown-item" href="#"
                    ><i class="fas fa-cog mr-2"></i>Setting</a
                  >
                  <a class="dropdown-item" href="logout.jsp"
                    ><i class="fas fa-power-off mr-2"></i>Logout</a
                  >
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
        <div class="dashboard-ecommerce">
          <div class="container-fluid dashboard-content">
            <!-- ============================================================== -->
            <!-- pageheader  -->
            <!-- ============================================================== -->
            <div class="row">
              <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="page-header">
                  <h2 class="pageheader-title">
                Manage Flight
                  </h2>
                  <!-- <p class="pageheader-text">
                    Nulla euismod urna eros, sit amet scelerisque torton lectus
                    vel mauris facilisis faucibus at enim quis massa lobortis
                    rutrum.
                  </p> -->
                  <div class="page-breadcrumb">
                    <nav aria-label="breadcrumb">
                      <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                          <a href="#" class="breadcrumb-link">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                         Dashboard Admin
                        </li>
                      </ol>
                    </nav>
                  </div>
                </div>
              </div>
            </div>
            <!-- ============================================================== -->
            <!-- end pageheader  -->
            <!-- ============================================================== -->
            
            <div class="ecommerce-widget">
              <div class="row">
                  
<%
    // Method to establish database connection
    Connection conn = null;
  
       

       
    // Query to count pending booking requests
    int pendingCount = 0;
    try {
         Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightdb", "root", "");
        String query = "SELECT COUNT(*) AS pendingCount FROM bookingtb WHERE bookstatus = 'pending'";
        PreparedStatement pstmt = conn.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            pendingCount = rs.getInt("pendingCount");
        }
        rs.close();
        pstmt.close();
    } catch (SQLException e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                out.println("Error: " + e.getMessage());
            }
        }
    }
%>
                <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                  <div class="card">
                    <div class="card-body">
                      <h5 class="text-muted">Pending Reservation</h5>
                      <div class="metric-value d-inline-block">
                        <h1 class="mb-1"></h1>
                      </div>
                      <div
                        class="metric-label d-inline-block float-right text-success font-weight-bold"
                      >
                        <span><i class="fa fa-fw fa-arrow-up"></i></span
                        ><span> <h1 class="mb-1"><%= pendingCount %></h1></span>
                      </div>
                    </div>
                    <div id="sparkline-revenue"></div>
                  </div>
                </div>
                      <%
    // Method to establish database connection
    Connection conns = null;
  
       

       
    // Query to count pending booking requests
    int pendingPayCount = 0;
    try {
         Class.forName("com.mysql.jdbc.Driver");
       conns = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightdb", "root", "");
        String query = "SELECT COUNT(*) AS pendingPayCount FROM bookingtb WHERE paymentStatus = 'Unpaid'";
        PreparedStatement pstmt = conns.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            pendingCount = rs.getInt("pendingPayCount");
        }
        rs.close();
        pstmt.close();
    } catch (SQLException e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (conn != null) {
            try {
                conns.close();
            } catch (SQLException e) {
                out.println("Error: " + e.getMessage());
            }
        }
    }
%>
                <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                  <div class="card">
                    <div class="card-body">
                      <h5 class="text-muted">Pending Payment </h5>
                      <div class="metric-value d-inline-block">
                        <h1 class="mb-1"><%= pendingPayCount %></h1>
                      </div>
                      <div
                        class="metric-label d-inline-block float-right text-success font-weight-bold"
                      >
                        <span><i class="fa fa-fw fa-arrow-up"></i></span
                        ><span><%= pendingPayCount %></span>
                      </div>
                    </div>
                    <div id="sparkline-revenue2"></div>
                  </div>
                </div>
                <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                  <div class="card">
                    <div class="card-body">
                      <h5 class="text-muted">Refunds</h5>
                      <div class="metric-value d-inline-block">
                        <h1 class="mb-1">0.00</h1>
                      </div>
                      <div
                        class="metric-label d-inline-block float-right text-primary font-weight-bold"
                      >
                        <span>N/A</span>
                      </div>
                    </div>
                    <div id="sparkline-revenue3"></div>
                  </div>
                </div>
                <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                  <div class="card">
                    <div class="card-body">
                      <h5 class="text-muted">Avg. Revenue Per User</h5>
                      <div class="metric-value d-inline-block">
                        <h1 class="mb-1">$28000</h1>
                      </div>
                      <div
                        class="metric-label d-inline-block float-right text-secondary font-weight-bold"
                      >
                        <span>-2.00%</span>
                      </div>
                    </div>
                    <div id="sparkline-revenue4"></div>
                  </div>
                </div>
              </div>
              <div class="row">
                <!-- ============================================================== -->

                <!-- ============================================================== -->

                <!-- recent orders  -->
                <!-- ============================================================== -->
                <div class="col-xl-9 col-lg-12 col-md-6 col-sm-12 col-12">
                  <div class="card">
                    <h5 class="card-header">Recent Orders</h5>
                    <div class="card-body p-0">
                      <div class="table-responsive">
                        <table class="table">
                          <thead class="bg-light">
                            <tr class="border-0">
                              <th class="border-0">#</th>
                              <th class="border-0">Image</th>
                              <th class="border-0">Product Name</th>
                              <th class="border-0">Product Id</th>
                              <th class="border-0">Quantity</th>
                              <th class="border-0">Price</th>
                              <th class="border-0">Order Time</th>
                              <th class="border-0">Customer</th>
                              <th class="border-0">Status</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>1</td>
                              <td>
                                <div class="m-r-10">
                                  <img
                                    src="assets/images/product-pic.jpg"
                                    alt="user"
                                    class="rounded"
                                    width="45"
                                  />
                                </div>
                              </td>
                              <td>Product #1</td>
                              <td>id000001</td>
                              <td>20</td>
                              <td>$80.00</td>
                              <td>27-08-2018 01:22:12</td>
                              <td>Patricia J. King</td>
                              <td>
                                <span class="badge-dot badge-brand mr-1"></span
                                >InTransit
                              </td>
                            </tr>
                            <tr>
                              <td>2</td>
                              <td>
                                <div class="m-r-10">
                                  <img
                                    src="assets/images/product-pic-2.jpg"
                                    alt="user"
                                    class="rounded"
                                    width="45"
                                  />
                                </div>
                              </td>
                              <td>Product #2</td>
                              <td>id000002</td>
                              <td>12</td>
                              <td>$180.00</td>
                              <td>25-08-2018 21:12:56</td>
                              <td>Rachel J. Wicker</td>
                              <td>
                                <span
                                  class="badge-dot badge-success mr-1"
                                ></span
                                >Delivered
                              </td>
                            </tr>
                            <tr>
                              <td>3</td>
                              <td>
                                <div class="m-r-10">
                                  <img
                                    src="assets/images/product-pic-3.jpg"
                                    alt="user"
                                    class="rounded"
                                    width="45"
                                  />
                                </div>
                              </td>
                              <td>Product #3</td>
                              <td>id000003</td>
                              <td>23</td>
                              <td>$820.00</td>
                              <td>24-08-2018 14:12:77</td>
                              <td>Michael K. Ledford</td>
                              <td>
                                <span
                                  class="badge-dot badge-success mr-1"
                                ></span
                                >Delivered
                              </td>
                            </tr>
                            <tr>
                              <td>4</td>
                              <td>
                                <div class="m-r-10">
                                  <img
                                    src="assets/images/product-pic-4.jpg"
                                    alt="user"
                                    class="rounded"
                                    width="45"
                                  />
                                </div>
                              </td>
                              <td>Product #4</td>
                              <td>id000004</td>
                              <td>34</td>
                              <td>$340.00</td>
                              <td>23-08-2018 09:12:35</td>
                              <td>Michael K. Ledford</td>
                              <td>
                                <span
                                  class="badge-dot badge-success mr-1"
                                ></span
                                >Delivered
                              </td>
                            </tr>
                            <tr>
                              <td colspan="9">
                                <a
                                  href="#"
                                  class="btn btn-outline-light float-right"
                                  >View Details</a
                                >
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- ============================================================== -->
                <!-- end recent orders  -->

                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- customer acquistion  -->
                <!-- ============================================================== -->
                <!-- <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                  <div class="card">
                    <h5 class="card-header">Customer Acquisition</h5>
                    <div class="card-body">
                      <div
                        class="ct-chart ct-golden-section"
                        style="height: 354px"
                      ></div>
                      <div class="text-center">
                        <span class="legend-item mr-2">
                          <span class="fa-xs text-primary mr-1 legend-tile"
                            ><i class="fa fa-fw fa-square-full"></i
                          ></span>
                          <span class="legend-text">Returning</span>
                        </span>
                        <span class="legend-item mr-2">
                          <span class="fa-xs text-secondary mr-1 legend-tile"
                            ><i class="fa fa-fw fa-square-full"></i
                          ></span>
                          <span class="legend-text">First Time</span>
                        </span>
                      </div>
                    </div>
                  </div>
                </div> -->
                <!-- ============================================================== -->
                <!-- end customer acquistion  -->
                <!-- ============================================================== -->
              </div>
              <div class="row">
                <!-- ============================================================== -->
                <!-- product category  -->
                <!-- ============================================================== -->
                <!-- <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                  <div class="card">
                    <h5 class="card-header">Product Category</h5>
                    <div class="card-body">
                      <div
                        class="ct-chart-category ct-golden-section"
                        style="height: 315px"
                      ></div>
                      <div class="text-center m-t-40">
                        <span class="legend-item mr-3">
                          <span class="fa-xs text-primary mr-1 legend-tile"
                            ><i class="fa fa-fw fa-square-full"></i></span
                          ><span class="legend-text">Man</span>
                        </span>
                        <span class="legend-item mr-3">
                          <span class="fa-xs text-secondary mr-1 legend-tile"
                            ><i class="fa fa-fw fa-square-full"></i
                          ></span>
                          <span class="legend-text">Woman</span>
                        </span>
                        <span class="legend-item mr-3">
                          <span class="fa-xs text-info mr-1 legend-tile"
                            ><i class="fa fa-fw fa-square-full"></i
                          ></span>
                          <span class="legend-text">Accessories</span>
                        </span>
                      </div>
                    </div>
                  </div>
                </div> -->
                <!-- ============================================================== -->
                <!-- end product category  -->
           
                <!-- ============================================================== -->
                <div class="col-xl-3 col-lg-12 col-md-6 col-sm-12 col-12">
                  <!-- ============================================================== -->
           
                  <!-- ============================================================== -->
                </div>
              </div>

              <div class="row">
                <!-- ============================================================== -->
              
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- new customer  -->
                <!-- ============================================================== -->
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                  <div class="card border-3 border-top border-top-primary">
                    <div class="card-body">
                      <h5 class="text-muted">New Customer</h5>
                      <div class="metric-value d-inline-block">
                        <h1 class="mb-1">1245</h1>
                      </div>
                      <div
                        class="metric-label d-inline-block float-right text-success font-weight-bold"
                      >
                        <span
                          class="icon-circle-small icon-box-xs text-success bg-success-light"
                          ><i class="fa fa-fw fa-arrow-up"></i></span
                        ><span class="ml-1">10%</span>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- ============================================================== -->
                <!-- end new customer  -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- visitor  -->
                <!-- ============================================================== -->
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                  <div class="card border-3 border-top border-top-primary">
                    <div class="card-body">
                      <h5 class="text-muted">Visitor</h5>
                      <div class="metric-value d-inline-block">
                        <h1 class="mb-1">13000</h1>
                      </div>
                      <div
                        class="metric-label d-inline-block float-right text-success font-weight-bold"
                      >
                        <span
                          class="icon-circle-small icon-box-xs text-success bg-success-light"
                          ><i class="fa fa-fw fa-arrow-up"></i></span
                        ><span class="ml-1">5%</span>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- ============================================================== -->
                <!-- end visitor  -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- total orders  -->
                <!-- ============================================================== -->
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                  <div class="card border-3 border-top border-top-primary">
                    <div class="card-body">
                      <h5 class="text-muted">Total Orders</h5>
                      <div class="metric-value d-inline-block">
                        <h1 class="mb-1">1340</h1>
                      </div>
                      <div
                        class="metric-label d-inline-block float-right text-danger font-weight-bold"
                      >
                        <span
                          class="icon-circle-small icon-box-xs text-danger bg-danger-light bg-danger-light"
                          ><i class="fa fa-fw fa-arrow-down"></i></span
                        ><span class="ml-1">4%</span>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- ============================================================== -->
                <!-- end total orders  -->
                <!-- ============================================================== -->
              </div>
              <div class="row">
                <!-- ============================================================== -->
                <!-- total revenue  -->
                <!-- ============================================================== -->

                <!-- ============================================================== -->
                <!-- ============================================================== -->
               
                <!-- ============================================================== -->

           
              </div>
              <div class="row">
                <div class="col-xl-5 col-lg-6 col-md-6 col-sm-12 col-12">
                  <!-- ============================================================== -->
                  
                  <!-- ============================================================== -->
                </div>
                <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
                  <!-- ============================================================== -->
                  
                <!-- ============================================================== -->
                <!-- end sales traffice source  -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
          
              </div>
            </div>
          </div>
        </div>
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->
        <div class="footer">
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
      <!-- ============================================================== -->
      <!-- end wrapper  -->
      <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <!-- jquery 3.3.1 -->
    <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <!-- bootstap bundle js -->
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <!-- slimscroll js -->
    <script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <!-- main js -->
    <script src="assets/libs/js/main-js.js"></script>
    <!-- chart chartist js -->
    <script src="assets/vendor/charts/chartist-bundle/chartist.min.js"></script>
    <!-- sparkline js -->
    <script src="assets/vendor/charts/sparkline/jquery.sparkline.js"></script>
    <!-- morris js -->
    <script src="assets/vendor/charts/morris-bundle/raphael.min.js"></script>
    <script src="assets/vendor/charts/morris-bundle/morris.js"></script>
    <!-- chart c3 js -->
    <script src="assets/vendor/charts/c3charts/c3.min.js"></script>
    <script src="assets/vendor/charts/c3charts/d3-5.4.0.min.js"></script>
    <script src="assets/vendor/charts/c3charts/C3chartjs.js"></script>
    <script src="assets/libs/js/dashboard-ecommerce.js"></script>
  </body>
</html>
