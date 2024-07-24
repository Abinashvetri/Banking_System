<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Deposit</title>
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
        input[type="number"] {
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
        <h1 style="color: #333;">Deposit Form</h1>
        <form action="TransactionServlet" method="post">
            <div>
                <label for="amount">Amount:</label>
                <input type="number" id="amount" name="amount" required>
            </div>
            <input type="hidden" name="type" value="Deposit">
            <div>
                <input type="submit" value="Deposit">
            </div>
        </form>
    </div>
</body>
<!-- <body>
 <form action="TransactionServlet" method="post">
        Amount: <input type="number" name="amount" required><br>
        <input type="hidden" name="type" value="Deposit">
        <input type="submit" value="Deposit">
    </form>
</body> -->
</html>