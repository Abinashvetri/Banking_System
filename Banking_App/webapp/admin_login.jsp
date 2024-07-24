<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
</head>

<body style="font-family: Arial, sans-serif; text-align: center; background-color: #f0f0f0; margin: 0; padding: 0;">

    <div style="max-width: 400px; margin: 50px auto; padding: 20px; background-color: #fff; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); border-radius: 10px;">
        <h1 style="color: #333;">Admin Login</h1>
        <div style="margin-bottom: 20px;">
            <a href="homepage.jsp" style="display: inline-block; margin-right: 10px; padding: 10px 20px; color: #fff; background-color: #007BFF; text-decoration: none; border-radius: 5px;">Home</a>
             
        </div>
        <form action="AdminLoginServlet" method="post">
            <div style="margin-bottom: 15px;">
                <label for="username" style="display: block; color: #666; margin-bottom: 5px;">Username</label>
                <input type="text" id="username" name="username" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
            </div>
            <div style="margin-bottom: 15px;">
                <label for="password" style="display: block; color: #666; margin-bottom: 5px;">Password</label>
                <input type="password" id="password" name="password" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
            </div>
            <div>
                <button type="submit" style="width: 100%; padding: 10px; color: #fff; background-color: #007BFF; border: none; border-radius: 5px; cursor: pointer;">Login</button>
            </div>
        </form>
    </div>
</body>
</html>