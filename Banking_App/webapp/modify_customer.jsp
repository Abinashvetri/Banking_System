<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modifying Customer</title>
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
        form {
            margin: 0;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #666;
        }
        input[type="text"], input[type="email"], input[type="date"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            color: white;
            background-color: #007BFF;
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
<%
String customerId=request.getParameter("customerId");
String fullName = "", address = "", mobileNo = "", emailId = "", accountType = "", dateOfBirth = "", idProof = "";
try{
	Connection con=com.dbconnection.DBConnection.getConnection();
	PreparedStatement ps=con.prepareStatement("Select full_name,address,mobile_no,email_id,account_type,date_of_birth,id_proof from customer where id=?");
	ps.setString(1,customerId);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		fullName=rs.getString("full_name");
		address=rs.getString("address");
		mobileNo=rs.getString("mobile_no");
		emailId=rs.getString("email_id");
		accountType=rs.getString("account_type");
		dateOfBirth=rs.getString("date_of_birth");
		idProof=rs.getString("id_proof");
	}
	con.close();
}catch(Exception e){
	e.printStackTrace();
}
%>
<div class="container">
        <h1 style="color: #333;">Modify Customer</h1>
        <form action="CustomerManagementServlet" method="post">
            <div>
                <label for="fullName">Full Name:</label>
                <input type="text" id="fullName" name="fullName" value="<%= fullName %>" required>
            </div>
            <div>
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" value="<%= address %>" required>
            </div>
            <div>
                <label for="mobileNo">Mobile No:</label>
                <input type="text" id="mobileNo" name="mobileNo" value="<%= mobileNo %>" required>
            </div>
            <div>
                <label for="email">Email ID:</label>
                <input type="email" id="email" name="email" value="<%= emailId %>" required>
            </div>
            <div>
                <label for="accountType">Account Type:</label>
                <select id="accountType" name="accountType" required>
                    <option value="Saving" <%= "Saving".equals(accountType) ? "selected" : "" %>>Saving</option>
                    <option value="Current" <%= "Current".equals(accountType) ? "selected" : "" %>>Current</option>
                </select>
            </div>
            <div>
                <label for="dateOfBirth">Date of Birth:</label>
                <input type="date" id="dateOfBirth" name="dateOfBirth" value="<%= dateOfBirth %>" required>
            </div>
            <div>
                <label for="idProof">ID Proof:</label>
                <input type="text" id="idProof" name="idProof" value="<%= idProof %>" required>
            </div>
            <input type="hidden" name="customerId" value="<%= customerId %>">
            <input type="hidden" name="action" value="modify">
            <div>
                <input type="submit" value="Modify">
            </div>
        </form>
    </div>
<%-- <form action="CustomerManagementServlet" method="post">
        Full Name: <input type="text" name="fullName" value="<%= fullName %>" required><br>
        Address: <input type="text" name="address" value="<%= address %>" required><br>
        Mobile No: <input type="text" name="mobileNo" value="<%= mobileNo %>" required><br>
        Email ID: <input type="email" name="email" value="<%= emailId %>" required><br>
        Account Type: 
        <select name="accountType" required>
            <option value="Saving" <%= "Saving".equals(accountType) ? "selected" : "" %>>Saving</option>
            <option value="Current" <%= "Current".equals(accountType) ? "selected" : "" %>>Current</option>
        </select><br>
        Date of Birth: <input type="date" name="dateOfBirth" value="<%= dateOfBirth %>" required><br>
        ID Proof: <input type="text" name="idProof" value="<%= idProof %>" required><br>
        <input type="hidden" name="customerId" value="<%= customerId %>">
        <input type="hidden" name="action" value="modify">
        <input type="submit" value="Modify">
    </form>
 --%>
</body>
</html>