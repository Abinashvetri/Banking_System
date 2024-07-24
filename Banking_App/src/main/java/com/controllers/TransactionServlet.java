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
 * Servlet implementation class TransactionServlet
 */
public class TransactionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session==null) {
			response.sendRedirect("customer_dashboard.jsp");
		}
        String accountNo = (String) session.getAttribute("accountNo");
        String type = request.getParameter("type");
        double amount = Double.parseDouble(request.getParameter("amount"));

        try {
            
            Connection con =DBConnection.getConnection();

            con.setAutoCommit(false); // Enable transaction

            // Get current balance
            PreparedStatement ps = con.prepareStatement("SELECT initial_balance FROM customer WHERE account_no=? FOR UPDATE");
            ps.setString(1, accountNo);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                double currentBalance = rs.getDouble("initial_balance");

                if (type.equals("Withdraw") && currentBalance < amount) {
                    response.sendRedirect("customer_dashboard.jsp?error=Insufficient funds");
                    con.rollback();
                    return;
                }

                // Update balance
                double newBalance = type.equals("Deposit") ? currentBalance + amount : currentBalance - amount;
                ps = con.prepareStatement("UPDATE customer SET initial_balance=? WHERE account_no=?");
                ps.setDouble(1, newBalance);
                ps.setString(2, accountNo);
                ps.executeUpdate();

                // Insert transaction record
                ps = con.prepareStatement("INSERT INTO transactions (account_no, type, amount) VALUES (?, ?, ?)");
                ps.setString(1, accountNo);
                ps.setString(2, type);
                ps.setDouble(3, amount);
                ps.executeUpdate();

                con.commit(); // Commit transaction
                response.sendRedirect("customer_dashboard.jsp?success=Transaction successful");
            } else {
                response.sendRedirect("customer_dashboard.jsp?error=Account not found");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	

}
