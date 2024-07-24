<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Login</title>
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
            margin: 15px 0;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #666;
        }
        input[type="text"], input[type="password"] {
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
    <div class="container">
        <h1 style="color: #333;">Customer Login</h1>
        <form action="CustomerLoginServlet" method="post">
            <div>
                <label for="accountNo">Account No:</label>
                <input type="text" id="accountNo" name="accountNo" required>
            </div>
            <div>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div>
                <input type="submit" value="Login">
            </div>
        </form>
        <form action="homepage.jsp" method="get">
            <input type="submit" value="HomePage">
        </form>
    </div>
</body>
<!-- <body>
<form action="CustomerLoginServlet" method="post">
        Account No: <input type="text" name="accountNo"><br>
        Password: <input type="password" name="password"><br>
        <input type="submit" value="Login">
    </form>
    <form action="homepage.jsp">
    <input type="submit" value="HomePage">
    </form>
    
</body> -->
</html>