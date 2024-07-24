<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
</head>
<body style="font-family: Arial, sans-serif; text-align: center; background-color: #f0f0f0; margin: 0; padding: 0;">
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("admin")==null){
	response.sendRedirect("admin_login.jsp");
}
%>
    <div style="max-width: 600px; margin: 50px auto; padding: 20px; background-color: #fff; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); border-radius: 10px;">
        <h1 style="color: #333;">Admin Dashboard</h1>
        <nav style="margin-bottom: 20px;">
            <a href="view_customers.jsp" style="display: inline-block; margin: 10px 0; padding: 10px 20px; color: #fff; background-color: #007BFF; text-decoration: none; border-radius: 5px;">View Customers</a>
            <br>
            <a href="register_customer.jsp" style="display: inline-block; margin: 10px 0; padding: 10px 20px; color: #fff; background-color: #28A745; text-decoration: none; border-radius: 5px;">Register Customer</a>
            <br>
            <a href="logout.jsp" style="display: inline-block; margin: 10px 0; padding: 10px 20px; color: #fff; background-color: #DC3545; text-decoration: none; border-radius: 5px;">Logout</a>
        </nav>
    </div>
</body>

</html>