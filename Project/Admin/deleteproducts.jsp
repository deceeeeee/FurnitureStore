<%@ page language="java" import="java.sql.*, java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
		<title> Gotz Furniture Store </title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="../CSS/home.css">
	</head>
	
	<body>
		<div id="intro">
			<h1> Gotz Furniture Store </h1>
			<img src="../Logo/FurnitureLogo1.png" alt="Furniture Logo" width="300" height="179"/>
			<p> We can build anything! </p>
		</div>
		<div id="nav">
			<ul>
				<li> <a href="adminhomepage.jsp"> <em>Home</em> </a> </li>
				<li> <a href="adminproduct.jsp"> <em>Products</em> </a> </li>
				<li> <a href="adminsuggest.jsp"> <em>Subscription and Suggestion</em> </a> </li>
			</ul>
		</div>
		
		<div id="content">
			<div id="products">
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
							
							String prod = new String(request.getParameter("id"));
							
							String delpro = "DELETE FROM FURNITURE_PRODUCTS WHERE ID = '"+ prod + "'";
							
							int deletion = ps.executeUpdate(delpro);
							
							if(deletion > 0){
								
								%>
								
									<h2> Deleting Success</h2>
								
								<%
							}
							
							} catch (Exception e) {
							e.printStackTrace();
							}
			
					%>
					
					
				</div>
		</div>
	</body>

</html>
