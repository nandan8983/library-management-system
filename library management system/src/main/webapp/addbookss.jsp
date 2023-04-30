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

//String name = request.getParameter("book");
//String email = request.getParameter("auther");
//String mobile = request.getParameter("resub");
//String mobile = request.getParameter("resub");
//String mobile = request.getParameter("resub");



int result = 0;
Part part = request.getPart("image");
 
if(part != null){
try{
     
    
    PreparedStatement ps = con.prepareStatement("insert into data(image) values(?)");
  //  InputStream is = part.getInputStream();
  //  ps.setBlob(1, is);
    result = ps.executeUpdate();
}
catch(Exception e){
e.printStackTrace();
}
finally{
if(con != null){
try{
con.close();
}
catch(Exception e){
e.printStackTrace();
}
}
}
}
if(result > 0){
     response.sendRedirect("result.jsp?message=Image+Uploaded");
    }
else{
response.sendRedirect("result.jsp?message=Some+Error+Occurred");
}




PreparedStatement pstmt = con.prepareStatement("insert into librarian values(?,?,?,?)");
pstmt.setInt(1, 0);
//pstmt.setString(2, name);
//pstmt.setString(3, email);
//pstmt.setString(4, mobile);
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