<%@page import="com.dbconnection.DBConnection,java.sql.*"%>
<%@ page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View transaction</title>
</head>
<body>
 <h1>Last 10 Transactions</h1>
    <%
        session = request.getSession(false);
        String accountNo = (String) session.getAttribute("accountNo");

        try {
            
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement("SELECT * FROM transactions WHERE account_no=? ORDER BY date DESC LIMIT 10");
            ps.setString(1, accountNo);
            ResultSet rs = ps.executeQuery();
            out.println("<table border='1' style='width: 100%; border-collapse: collapse;'>");
            out.println("<tr style='background-color: #f2f2f2;'>");
            out.println("<th style='padding: 8px; text-align: left; border: 1px solid #ddd;'>ID</th>");
            out.println("<th style='padding: 8px; text-align: left; border: 1px solid #ddd;'>Type</th>");
            out.println("<th style='padding: 8px; text-align: left; border: 1px solid #ddd;'>Amount</th>");
            out.println("<th style='padding: 8px; text-align: left; border: 1px solid #ddd;'>Date</th>");
            out.println("</tr>");
            while (rs.next()) {
                out.println("<tr style='border: 1px solid #ddd;'>");
                out.println("<td style='padding: 8px; border: 1px solid #ddd;'>" + rs.getInt("id") + "</td>");
                out.println("<td style='padding: 8px; border: 1px solid #ddd;'>" + rs.getString("type") + "</td>");
                out.println("<td style='padding: 8px; border: 1px solid #ddd;'>" + rs.getDouble("amount") + "</td>");
                out.println("<td style='padding: 8px; border: 1px solid #ddd;'>" + rs.getTimestamp("date") + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");
            /* out.println("<table border='1'>");
            out.println("<tr><th>ID</th><th>Type</th><th>Amount</th><th>Date</th></tr>");
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("id") + "</td>");
                out.println("<td>" + rs.getString("type") + "</td>");
                out.println("<td>" + rs.getDouble("amount") + "</td>");
                out.println("<td>" + rs.getTimestamp("date") + "</td>");
                out.println("</tr>");
            }
            out.println("</table>"); */

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</body>
</html>