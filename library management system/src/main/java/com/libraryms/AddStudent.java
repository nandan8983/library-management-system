package com.libraryms;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddStudent
 */
@WebServlet("/AddStudent")
public class AddStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStudent() {
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
		
		String prn = request.getParameter("prns");
		String name = request.getParameter("name");
		String dep = request.getParameter("dep");
		String pass = request.getParameter("pass");
		
		Connection con = DbConnection.connect();
		
		try {
			PreparedStatement pstmt = con.prepareStatement("INSERT INTO `student` VALUES (?,?,?,?,?)");
			pstmt.setInt(1, 0);
			pstmt.setString(2, prn);
			pstmt.setString(3, dep);
			pstmt.setString(4, pass);
			pstmt.setString(5, name);
			int i = pstmt.executeUpdate();
			if(i>0) {
				response.sendRedirect("addstudent.jsp");
			}
			else {
				response.sendRedirect("error.jsp");
			}
			
			
			
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
