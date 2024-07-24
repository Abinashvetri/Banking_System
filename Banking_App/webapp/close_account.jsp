<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Close Account</title>
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
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            color: white;
            background-color: #dc3545;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
<div class="container">
        <h1 style="color: #333;">Close Account</h1>
        <form action="CloseAccountServlet" method="post">
            <input type="submit" value="Close Account">
        </form>
    </div>
 <!-- <form action="CloseAccountServlet" method="post">
        <input type="submit" value="Close Account">
    </form> -->
</body>
</html>