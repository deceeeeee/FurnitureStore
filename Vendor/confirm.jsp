<%@ page language="java"  import="java.sql.*, java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%	
		try {
			String driverName = "com.mysql.jdbc.Driver";
			String connectionUrl = "jdbc:mysql://localhost:3306/";
			String dbName = "furnituredb";
			String dbuser = "root";
			String dbpw = "";
			
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(connectionUrl+dbName, dbuser, dbpw);
			Statement ps = con.createStatement();
			System.out.print("Connected");
			
			ResultSet result = null;
			
			String invoiceno = new String(request.getParameter("invoiceno"));
			
			String acc = "UPDATE RECEIPT_LIST SET PROGRESS = 'Delivered' WHERE INVOICE_NO = '" +invoiceno+ "' ";
			int update = ps.executeUpdate(acc);
			System.out.println(update + "order has been sent");
			response.sendRedirect("sellerhomepage.jsp");

			
			} catch (Exception e) {
			e.printStackTrace();
						}
			
	%>

</body>
</html>