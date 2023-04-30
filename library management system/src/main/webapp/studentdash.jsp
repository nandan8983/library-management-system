<!DOCTYPE html>
<%@page import="com.libraryms.Values"%>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>Student Dashboard &mdash; CNG</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="assets/modules/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/modules/fontawesome/css/all.min.css">

  <!-- CSS Libraries -->

  <!-- Template CSS -->
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/components.css">
<!-- Start GA -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-94034622-3"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-94034622-3');
</script>
<!-- /END GA --></head>
<%@ page import="java.sql.*" %>
<%@ page import="com.libraryms.DbConnection" %>

<%
int id = Values.getId();
Connection con = DbConnection.connect();
PreparedStatement pstmt1 = con.prepareStatement("SELECT * FROM `student` where id=?");
pstmt1.setInt(1, id);
ResultSet rs1 =  pstmt1.executeQuery();

 %>
<body>
  <div id="app">
    <div class="main-wrapper main-wrapper-1">
      <div class="navbar-bg"></div>
      <nav class="navbar navbar-expand-lg main-navbar">
        <form class="form-inline mr-auto">
          <ul class="navbar-nav mr-3">
            <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="fas fa-bars"></i></a></li>
            <li><a href="#" data-toggle="search" class="nav-link nav-link-lg d-sm-none"><i class="fas fa-search"></i></a></li>
          </ul>
        
        </form>
        <ul class="navbar-nav navbar-right">
         
          
          <li class="dropdown"><a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
            <img alt="image" src="assets/img/avatar/avatar-1.png" class="rounded-circle mr-1">
            <div class="d-sm-none d-lg-inline-block">Hi,<%if(rs1.next()){ %> <%=rs1.getString(5) %> <%} %></div></a>
            <div class="dropdown-menu dropdown-menu-right">
             
             
              <div class="dropdown-divider"></div>
              <a href="index.jsp" class="dropdown-item has-icon text-danger">
                <i class="fas fa-sign-out-alt"></i> Logout
              </a>
            </div>
          </li>
        </ul>
      </nav>
      <div class="main-sidebar sidebar-style-2">
        <aside id="sidebar-wrapper">
          <div class="sidebar-brand">
            <a href="#">Student Section</a>
          </div>
          <div class="sidebar-brand sidebar-brand-sm">
            <a href="#">S S</a>
          </div>
          <ul class="sidebar-menu">
           
            <li class="dropdown">
              <a href="studentdash.jsp" class="nav-link"><i class="ion-ios-home"></i><span>Home</span></a>
              
            </li>
            <li class="dropdown">
              <a href="#" class="nav-link"><i class="ion-ios-book"></i><span>Book Issue Details</span></a>
       
            </li>
            <li class="dropdown">
              <a href="#" class="nav-link"><i class="ion-ios-bookmarks"></i><span>Book Transaction History</span></a>
            </li>
            <li class="dropdown">
              <a href="#" class="nav-link"><i class="ion-key"></i><span>Change Password</span></a>
            </li>
           <li class="dropdown">
              <a href="#" class="nav-link"><i class="ion-ios-at"></i><span>About US</span></a>              
            </li>
          </ul>
	    </aside>
      </div>
<%PreparedStatement pstmt = con.prepareStatement("SELECT * FROM `books`");
ResultSet rs =  pstmt.executeQuery(); %>



      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>Welcome To SITS Library</h1>
          </div>

          <div class="section-body">
          <h2 class="section-title">Top Books</h2>
          <div class="section-body">
           
           <div class="row">
           <%while(rs.next()){ %>
              <div class="col-12 col-md-4 col-lg-4" style="max-width: 450px;">
                <article class="article article-style-c">
                  <div class="article-header">
                    <div class="article-image">
                    <center>
                    <img class="center" alt="<%=rs.getString(2) %>" src="getImage.jsp?id=<%=rs.getInt(1)%>" width="300px;">
                  </center>  </div>
                  </div>
                  <div class="article-details" style="margin-left: 10px;">
                   
                    <div class="article-title">
  					<h2 style="line-height: 28px;"><%=rs.getString(2) %></h2>
                    </div>
                    <p>  <%=rs.getString(5) %></p>
                    <div class="article-user">
                      <img alt="image" src="assets/img/avatar/avatar-1.png">
                      <div class="article-user-details">
                        <div style="margin-top: 15px;">
                          <h6> <%=rs.getString(3)%></h6>
                        </div>
                       
                      </div>
                    </div>
                  </div>
                </article>
              </div>
              <%} %>
              
             
            </div>
     </div>
          
               
              </div>
           
            
              
             
          
        </section>
      </div>
      <footer class="main-footer">
        <div class="footer-left">
          Copyright &copy; 2022 Design By Nandan
        </div>
        <div class="footer-right">
          
        </div>
      </footer>
    </div>
  </div>

  <!-- General JS Scripts -->
  <script src="assets/modules/jquery.min.js"></script>
  <script src="assets/modules/popper.js"></script>
  <script src="assets/modules/tooltip.js"></script>
  <script src="assets/modules/bootstrap/js/bootstrap.min.js"></script>
  <script src="assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
  <script src="assets/modules/moment.min.js"></script>
  <script src="assets/js/stisla.js"></script>
  
  <!-- JS Libraies -->

  <!-- Page Specific JS File -->
  
  <!-- Template JS File -->
  <script src="assets/js/scripts.js"></script>
  <script src="assets/js/custom.js"></script>
</body>
</html>