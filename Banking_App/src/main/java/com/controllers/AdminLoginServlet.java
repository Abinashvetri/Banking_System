package com.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dbconnection.DBConnection;

/**
 * Servlet implementation class AdminLoginServlet
 * 
 */

public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		 try {
	           
	            Connection con = DBConnection.getConnection();

	            PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE username=? AND password=?");
	            ps.setString(1, username);
	            ps.setString(2, password);
	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
	                HttpSession session = request.getSession();
	                session.setAttribute("admin", username);
	                response.sendRedirect("admin_dashboard.jsp");
	            } else {
	                response.sendRedirect("admin_login.jsp?error=Invalid credentials");
	            }
	            con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}

	

}
