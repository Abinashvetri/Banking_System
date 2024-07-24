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
import java.util.UUID;

/**
 * Servlet implementation class CustomerManagementServlet
 */
public class CustomerManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("admin_login.jsp");
            return;
        }

        String action = request.getParameter("action");
        if ("register".equals(action)) {
            registerCustomer(request, response);
        } else if ("delete".equals(action)) {
            deleteCustomer(request, response);
        } else if ("modify".equals(action)) {
            modifyCustomer(request, response);
        }
    }

    private void registerCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String mobileNo =request.getParameter("mobile");
        String emailId = request.getParameter("email");
        String accountType = request.getParameter("accountType");
        String initialBalance = request.getParameter("initialBalance");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String idProof = request.getParameter("idProof");
        String accountNo = UUID.randomUUID().toString().substring(0,10);
        String password = UUID.randomUUID().toString().substring(0, 8);

        try {
            
            Connection con =com.dbconnection.DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO customer (full_name, address, mobile_no, email_id, account_type, initial_balance, date_of_birth, id_proof, account_no, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, fullName);
            ps.setString(2, address);
            ps.setString(3, mobileNo);
            ps.setString(4, emailId);
            ps.setString(5, accountType);
            ps.setString(6, initialBalance);
            ps.setString(7, dateOfBirth);
            ps.setString(8, idProof);
            ps.setString(9, accountNo);
            ps.setString(10, password);
            ps.executeUpdate();

            con.close();
            response.sendRedirect("admin_dashboard.jsp?message=Customer registered successfully. Account No: " + accountNo + " Temporary Password: " + password);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register_customer.jsp?error=Registration failed. Please try again.");
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerId = request.getParameter("customerId");
        String account_no=request.getParameter("account_no");
        

        try {
            
            Connection con =com.dbconnection.DBConnection.getConnection();
            PreparedStatement cs = con.prepareStatement("DELETE FROM transactions WHERE account_no=?");
            cs.setString(1, account_no);
            cs.executeUpdate();
            PreparedStatement ps = con.prepareStatement("DELETE FROM customer WHERE id=?");
            ps.setString(1,customerId );
            ps.executeUpdate();
           

            con.close();
            response.sendRedirect("view_customers.jsp?message=Customer deleted successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("view_customers.jsp?error=Deletion failed. Please try again.");
        }
    }

    private void modifyCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerId = request.getParameter("customerId");
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String mobileNo = request.getParameter("mobileNo");
        String emailId = request.getParameter("email");
        String accountType = request.getParameter("accountType");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String idProof = request.getParameter("idProof");

        try {
           
            Connection con = com.dbconnection.DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE customer SET full_name=?, address=?, mobile_no=?, email_id=?, account_type=?, date_of_birth=?, id_proof=? WHERE id=?");
            ps.setString(1, fullName);
            ps.setString(2, address);
            ps.setString(3, mobileNo);
            ps.setString(4, emailId);
            ps.setString(5, accountType);
            ps.setString(6, dateOfBirth);
            ps.setString(7, idProof);
            ps.setString(8, customerId);
            ps.executeUpdate();

            con.close();
            response.sendRedirect("view_customers.jsp?message=Customer modified successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("modify_customer.jsp?error=Modification failed. Please try again.");
        }
	}

	
}
