<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Registration</title>
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
        input[type="text"], input[type="email"], input[type="number"], input[type="date"], select {
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
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("admin")==null){
	response.sendRedirect("admin_login.jsp");
}
%>
    <div class="container">
        <h1 style="color: #333;">Customer Registration</h1>
        <form action="CustomerManagementServlet" method="post">
            <div>
                <label for="fullName">Full Name:</label>
                <input type="text" id="fullName" name="fullName" required>
            </div>
            <div>
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required>
            </div>
            <div>
                <label for="mobile">Mobile No:</label>
                <input type="text" id="mobile" name="mobile" required>
            </div>
            <div>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div>
                <label for="accountType">Account Type:</label>
                <select id="accountType" name="accountType" required>
                    <option value="saving">Saving</option>
                    <option value="current">Current</option>
                </select>
            </div>
            <div>
                <label for="initialBalance">Initial Balance:</label>
                <input type="number" id="initialBalance" name="initialBalance" min="1000" required>
            </div>
            <div>
                <label for="dateOfBirth">Date Of Birth:</label>
                <input type="date" id="dateOfBirth" name="dateOfBirth" required>
            </div>
            <div>
                <label for="idProof">ID Proof:</label>
                <input type="text" id="idProof" name="idProof">
            </div>
            <input type="hidden" name="action" value="register">
            <div>
                <input type="submit" value="Register">
            </div>
        </form>
    </div>
</body>

<%-- <body>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("admin")==null){
	response.sendRedirect("admin_login.jsp");
}
%>
    <form action="CustomerManagementServlet" method="post">
    FullName:<input type="text" name="fullName" required><br>
    Address :<input type="text" name="address" required><br>
    Mobile No:<input type="text" name="mobile" required><br>
    Email:<input type="email" name="email" required><br>
    Account Type:<select name="accountType" required>
    <option value="saving">Saving</option>
    <option value="curren">Current</option>
    </select><br>
    Initial Balance:<input type="number" name="initialBalance" min="1000" required><br>
    Date Of Birth:<input type="date" name="dateOfBirth" required><br>
    Id Proof:<input type="text" name="idProof"><br>
   <input type="hidden" name="action" value="register" required><br>
    <input type="submit" value="Register" > 
    </form>
</body> --%>
</html>