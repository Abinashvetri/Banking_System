<%@page import="com.dbconnection.DBConnection"%>
<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        a {
            display: block;
            margin: 10px 0;
            padding: 10px;
            color: white;
            background-color: #007BFF;
            text-decoration: none;
            border-radius: 5px;
            cursor: pointer;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
 <h1>Welcome, Customer</h1>
 <%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("accountNo")==null){
	response.sendRedirect("admin_login.jsp");
}
%>
    <%
         session = request.getSession(false);
        String accountNo = (String) session.getAttribute("accountNo");

        try {
            
            Connection con =DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement("SELECT * FROM customer WHERE account_no=?");
            ps.setString(1, accountNo);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String fullName = rs.getString("full_name");
                double balance = rs.getDouble("initial_balance");

                out.println("<p>Account No: " + accountNo + "</p>");
                out.println("<p>Full Name: " + fullName + "</p>");
                out.println("<p>Balance: " + balance + "</p>");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    <!-- <a href="view_transactions.jsp">View Transactions</a><br>
    <a href="deposit.jsp">Deposit</a><br>
    <a href="withdraw.jsp">Withdraw</a><br>
    <a href="close_account.jsp">Close Account</a><br>
    <a href="customer_logout.jsp">Logout</a> -->
     <div class="container">
        <h1 style="color: #333;">Customer Dashboard</h1>
        <a href="view_transactions.jsp">View Transactions</a>
        <a href="deposit.jsp">Deposit</a>
        <a href="withdraw.jsp">Withdraw</a>
        <a href="close_account.jsp">Close Account</a>
        <a href="customer_logout.jsp">Logout</a>
    </div>
</body>
</html>