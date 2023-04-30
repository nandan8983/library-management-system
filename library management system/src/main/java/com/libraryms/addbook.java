package com.libraryms;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class addbook
 */
@WebServlet("/addbook")
@MultipartConfig(maxFileSize = 16177216)
public class addbook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addbook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		Connection con = DbConnection.connect();

		String name = request.getParameter("book");
		String auther = request.getParameter("author");
		String subject = request.getParameter("resub");
		String details = request.getParameter("details");
		int qu = Integer.parseInt(request.getParameter("quantity"));
		
		Part part = request.getPart("image");
		if(part != null) {
		try{
			
		     
		    
		    PreparedStatement ps = con.prepareStatement("INSERT INTO `books`(`id`, `book_name`, `author_name`, `related_subject`, `details`, `image`,`quantity`) VALUES (?,?,?,?,?,?,?)");
		    InputStream is = part.getInputStream();
		    ps.setInt(1, 0);
		    ps.setString(2, name);
		    ps.setString(3, auther);
		    ps.setString(4, subject);
		    ps.setString(5, details);
		    ps.setBlob(6, is);
		    ps.setInt(7, qu);
		    int result = ps.executeUpdate();
		    if(result > 0){
		     response.sendRedirect("addbooks.jsp");
		    }
		    else{
		    response.sendRedirect("error.jsp");
		}
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
		
		
		}else {
			response.sendRedirect("error.jsp");
		}
		
		



//
//		PreparedStatement pstmt = con.prepareStatement("insert into librarian values(?,?,?,?)");
//		pstmt.setInt(1, 0);
//		pstmt.setString(2, name);
//		pstmt.setString(3, email);
//		pstmt.setString(4, mobile);
//		int rs1 =  pstmt.executeUpdate();
//		if(rs1 > 0){
//			response.sendRedirect("admindash.jsp");
//		}
//		else{
//			response.sendRedirect("error.jsp");
//		}
//		
	}

}
