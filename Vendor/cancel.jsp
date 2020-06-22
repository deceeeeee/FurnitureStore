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
			String productid = new String(request.getParameter("product_id"));
			String qty = new String(request.getParameter("qty"));
			
			String cancel = "DELETE FROM TRANSACTION_LOG WHERE INVOICE_NO = '" +invoiceno+ "' AND PRODUCT_ID = '"+productid+"' ";
			int deletion = ps.executeUpdate(cancel);
			System.out.println(deletion + "row(s) has been deleted from transaction_log table since transaction " +invoiceno+ " has been cancelled");
			
			String check = "SELECT * FROM TRANSACTION_LOG WHERE INVOICE_NO = '" +invoiceno+ "' ";
			result = ps.executeQuery(check);
			
			if(result.next()){
				
				response.sendRedirect("sellerhomepage.jsp");
				
			} else {
				
				String notransact = "UPDATE RECEIPT_LIST SET PROGRESS = 'Cancelled' WHERE INVOICE_NO = '" +invoiceno+ "' ";
				int update = ps.executeUpdate(notransact);
				System.out.println("Updated:" + update);
				response.sendRedirect("sellerhomepage.jsp");
				
			}
			
			} catch (Exception e) {
			e.printStackTrace();
						}
			
	%>

</body>
</html>