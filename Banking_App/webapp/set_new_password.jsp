<%@ page language="java" contentType="text/html; charset=UTF-8"
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
        form {
            margin: 0;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #666;
        }
        input[type="password"] {
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
        <h1 style="color: #333;">Set New Password</h1>
        <form action="SetNewPasswordServlet" method="post">
            <div>
                <label for="newPassword">New Password:</label>
                <input type="password" id="newPassword" name="newPassword" required>
            </div>
            <div>
                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>
            <div>
                <input type="submit" value="Set Password">
            </div>
        </form>
    </div>
</body>
<!-- <body>
<form action="SetNewPasswordServlet" method="post">
        New Password: <input type="password" name="newPassword"><br>
        Confirm Password: <input type="password" name="confirmPassword"><br>
        <input type="submit" value="Set Password">
    </form>
</body> -->
</html>