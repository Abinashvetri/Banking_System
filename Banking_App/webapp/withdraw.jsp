<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Withdraw</title>
</head>
<!-- <body>
 <form action="TransactionServlet" method="post">
        Amount: <input type="number" name="amount" required><br>
        <input type="hidden" name="type" value="Withdraw">
        <input type="submit" value="Withdraw">
    </form>
</body> -->
<body style="font-family: Arial, sans-serif; text-align: center; background-color: #f0f0f0; margin: 0; padding: 0;">
    <div style="max-width: 400px; margin: 50px auto; padding: 20px; background-color: #fff; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); border-radius: 10px;">
        <h1 style="color: #333;">Transaction Form</h1>
        <form action="TransactionServlet" method="post">
            <div style="margin-bottom: 15px;">
                <label for="amount" style="display: block; color: #666; margin-bottom: 5px;">Amount:</label>
                <input type="number" id="amount" name="amount" required style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
            </div>
            <input type="hidden" name="type" value="Withdraw">
            <div>
                <input type="submit" value="Withdraw" style="width: 100%; padding: 10px; color: #fff; background-color: #007BFF; border: none; border-radius: 5px; cursor: pointer;">
            </div>
        </form>
    </div>
</body>
</html>