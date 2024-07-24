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
            margin: 0;
            padding: 0;
            text-align: center;
        }
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        form {
            display: inline;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
</style>
</head>
<body>
<h1>Customer List</h1>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("admin")==null){
	response.sendRedirect("admin_login.jsp");
}
%>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Address</th>
            <th>Mobile No</th>
            <th>Email ID</th>
            <th>Account Type</th>
            <th>Initial Balance</th>
            <th>Date of Birth</th>
            <th>ID Proof</th>
            <th>Actions</th>
            
        </tr>
        <%
            try {
              
                Connection con =com.dbconnection.DBConnection.getConnection();

                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT id, full_name, address, mobile_no, email_id, account_type, initial_balance, date_of_birth, id_proof,account_no FROM customer");

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("full_name") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("mobile_no") %></td>
            <td><%= rs.getString("email_id") %></td>
            <td><%= rs.getString("account_type") %></td>
            <td><%= rs.getDouble("initial_balance") %></td>
            <td><%= rs.getDate("date_of_birth") %></td>
            <td><%= rs.getString("id_proof") %></td>
            
            
            <td>
                <form action="CustomerManagementServlet" method="post" style="display:inline;">
                    <input type="hidden" name="customerId" value="<%= rs.getInt("id") %>">
                    <input type="hidden" name="account_no" value="<%= rs.getString("account_no") %>">
                    <input type="hidden" name="action" value="delete">
                    <input type="submit" value="Delete">
                </form>
                <form action="modify_customer.jsp" method="get" style="display:inline;">
                    <input type="hidden" name="customerId" value="<%= rs.getInt("id") %>">
                    <input type="submit" value="Modify">
                </form>
            </td>
        </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
    <form action="admin_dashboard.jsp">
    <input type="submit" value="Home">
    </form>
</body>
</html>