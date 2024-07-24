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

import com.dbconnection.DBConnection;

/**
 * Servlet implementation class SetNewPasswordServlet
 */
public class SetNewPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        HttpSession session = request.getSession(false);
        String accountNo = (String) session.getAttribute("accountNo");

        if (newPassword.equals(confirmPassword)) {
            try {
                
                Connection con =DBConnection.getConnection();

                PreparedStatement ps = con.prepareStatement("UPDATE customer SET password=?, is_password_set=TRUE WHERE account_no=?");
                ps.setString(1, newPassword);
                ps.setString(2, accountNo);
                ps.executeUpdate();

                con.close();
                response.sendRedirect("customer_dashboard.jsp");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            response.sendRedirect("set_new_password.jsp?error=Passwords do not match");
        }
	}

	

}
