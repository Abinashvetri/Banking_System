<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogOut</title>
</head>
<body>

<% 
session.removeAttribute("accountNo");
session.invalidate();
response.sendRedirect("customer_login.jsp");
%>
</body>
</html>