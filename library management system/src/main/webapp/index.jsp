<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>Home &mdash; Library</title>

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
Connection con = DbConnection.connect();
PreparedStatement pstmt = con.prepareStatement("SELECT * FROM `books`");
ResultSet rs =  pstmt.executeQuery();
 %>
<body class="layout-3">
  <div id="app">
   
      <div class="navbar-bg" style="height: 100px;"></div>
      <nav class="navbar navbar-expand-lg main-navbar" style="margin-top: 25px;">
      <ul class="form-inline mr-auto">
        <a href="index.html" class="navbar-brand sidebar">Library Home</a>
        </ul>
     <ul class="navbar-nav navbar-right"> 
                <a href="studentlogin.jsp" class="btn btn-primary trigger--fire-modal-2" id="modal-2" style="width: 100px; margin-right: 35px;">Login</a>
      </ul>
      
      </nav>
      <!-- Main Content -->
      <div class="main-content">
      
        <section class="section" style="margin: 30px;margin-left: 80px;">
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
                      <h2 style="line-height: 28px;">  <%=rs.getString(2) %></h2>
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
          

        
        </section>
      </div>
      
      <footer class="main-footer">
        <div class="footer-left" style="align-self: center;">
          Copyright &copy; 2022 Design By Nandan
        </div>
        <div class="footer-right">
          
        </div>
      </footer>
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