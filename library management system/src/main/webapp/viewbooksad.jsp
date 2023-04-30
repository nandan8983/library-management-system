<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>Admin Dashboard &mdash; Library</title>

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
<body>
<%@ page import="java.sql.*" %>
<%@ page import="com.libraryms.DbConnection" %>


<%
Connection con = DbConnection.connect();
PreparedStatement pstmt = con.prepareStatement("SELECT * FROM `books`");
ResultSet rs =  pstmt.executeQuery();
 %>
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
            <div class="d-sm-none d-lg-inline-block">Hi, Admin</div></a>
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
            <a href="#">ADMIN PANEL</a>
          </div>
          <div class="sidebar-brand sidebar-brand-sm">
            <a href="#">A P</a>
          </div>
          <ul class="sidebar-menu">
           
            <li class="menu-header">ADMIN WORK</li>
              <li class="dropdown">
              <a href="admindash.jsp" class="nav-link"><i class="fas fa-columns"></i><span>Add Librarian</span></a>
              
            </li>
              <li class="dropdown">
              <a href="viewlalibrarian.jsp" class="nav-link"><i class="fas fa-columns"></i><span>Manage Librarian</span></a>
              
            </li>
              <li class="dropdown">
              <a href="addbooks.jsp" class="nav-link"><i class="fas fa-columns"></i><span>Add Books</span></a>
              
            </li>
              <li class="dropdown">
              <a href="viewbooksad.jsp" class="nav-link"><i class="fas fa-columns"></i><span>Manage Books</span></a>
              
            </li>
            
          </ul>
	    </aside>
      </div>

      <!-- Main Content -->
      <div class="main-content">
      <section class="section">
          <div class="section-header">
           
          

          <div class="section-body">
            <h2 class="section-title">Books List</h2>
            

            <div class="row">
              <div class="col-12 col-md-6 col-lg-6">
                <div class="card" style="width: 1200px;">
                  
                  <div class="card-body">
                    <div class="table-responsive">
                      <table class="table table-bordered table-md">
                        <tbody><tr>
                          <th>ID</th>
                          <th>Book Name</th>
                          <th>Subject</th>
                         
                          <% while(rs.next()){%>
                        </tr>
                        <tr>
                          <td><%=rs.getInt(1)%></td>
                          <td><%=rs.getString(2)%></td>
                        
                          <td><%=rs.getString(4)%></td>
                          <td><a href="bdelete.jsp?id=<%=rs.getInt(1)%>" class="btn btn-secondary">Remove</a></td>
                        </tr>
                        <%} %>
                      </tbody></table>
                    </div>
                  </div>
                
                </div>
              </div>
              
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