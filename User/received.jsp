<%@ page language="java" import="java.sql.*, java.util.*, java.util.Date, java.text.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	
	String sessionuser = (String)session.getAttribute("usertype");	
	
	if(session.getAttribute("username") == null || !sessionuser.equals("customer")){
		
		response.sendRedirect("../Database/login.jsp");
		session.setAttribute("usertype", null);
		
	}
	
%>
<html>

	<head>
		<title> Gotz Furniture Store </title>
		<meta charset="utf-8"/>
		<link rel="stylesheet" href="../CSS/home.css">
	</head>
	
	<body>
		<div id="content">
			<div id="products">
				<h2 align="center"> Invoice </h2>
						<%
							Cookie[] cookies = request.getCookies();
							Cookie cookie = cookies[1];
							String user = new String(cookie.getValue());
							System.out.println(user);	
							
							String invoiceno = new String(request.getParameter("invoiceno"));
							
							String driverName = "com.mysql.jdbc.Driver";
							String connectionUrl = "jdbc:mysql://localhost:3306/";
							String dbName = "furnituredb";
							String dbuser = "root";
							String dbpw = "";
							
							try {
							Class.forName(driverName);
							} catch (ClassNotFoundException e) {
							e.printStackTrace();
							}
							
							Connection con = null;
							Statement ps = null;
							
							try{ 
								con = DriverManager.getConnection(connectionUrl+dbName, dbuser, dbpw);
								ps = con.createStatement();
								
								
								String update = "UPDATE RECEIPT_LIST SET PROGRESS = 'Received' WHERE INVOICE_NO = '"+invoiceno+"'";
								
								int result = ps.executeUpdate(update);
								
								response.sendRedirect("invoices.jsp");
								
								ps.close();
								con.close();
						
								
								} catch (Exception e) {
									e.printStackTrace();
								}
						%>
				</div>
			</div>
		</body>
	</html>