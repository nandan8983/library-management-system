<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="com.libraryms.DbConnection" %>
<%
Connection con = DbConnection.connect();

String name = request.getParameter("name");
String email = request.getParameter("email");
String mobile = request.getParameter("mobile");

PreparedStatement pstmt = con.prepareStatement("insert into librarian values(?,?,?,?)");
pstmt.setInt(1, 0);
pstmt.setString(2, name);
pstmt.setString(3, email);
pstmt.setString(4, mobile);
int rs1 =  pstmt.executeUpdate();
if(rs1 > 0){
	response.sendRedirect("admindash.jsp");
}
else{
	response.sendRedirect("error.jsp");
}




%>
</body>
</html>