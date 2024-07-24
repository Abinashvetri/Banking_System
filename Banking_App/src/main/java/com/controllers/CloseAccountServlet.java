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
 * Servlet implementation class CloseAccountServlet
 */
public class CloseAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(false);
	        String accountNo = (String) session.getAttribute("accountNo");

	        try {
	          
	            Connection con = DBConnection.getConnection();

	            // Check current balance
	            PreparedStatement ps = con.prepareStatement("SELECT initial_balance FROM customer WHERE account_no=?");
	            ps.setString(1, accountNo);
	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
	                double currentBalance = rs.getDouble("initial_balance");

	                if (currentBalance == 0) {
	                    // Delete customer record
	                	ps=con.prepareStatement("delete from transactions where account_no=?");
	                	ps.setString(1, accountNo);
	                	ps.executeUpdate();
	                    ps = con.prepareStatement("DELETE FROM customer WHERE account_no=?");
	                    ps.setString(1, accountNo);
	                    ps.executeUpdate();

	                    response.sendRedirect("customer_login.jsp?success=Account closed successfully");
	                } else {
	                    response.sendRedirect("customer_dashboard.jsp?error=Account balance must be zero to close account");
	                }
	            } else {
	                response.sendRedirect("customer_dashboard.jsp?error=Account not found");
	            }
	            con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}


}
