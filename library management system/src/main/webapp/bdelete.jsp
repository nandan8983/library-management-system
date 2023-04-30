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
int index = Integer.parseInt(request.getParameter("id"));
Connection con = DbConnection.connect();
PreparedStatement pstmt = con.prepareStatement("DELETE FROM `books` WHERE `id` = ?");
pstmt.setInt(1, index);
int i = pstmt.executeUpdate();
if(i>0) {
	response.sendRedirect("viewbooksad.jsp");
}else {
	response.sendRedirect("error.jsp");
}
%>
</body>
</html>