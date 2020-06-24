<%@ page language="java" import = "java.sql.*, java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	
	String sessionuser = (String)session.getAttribute("usertype");
	System.out.println(sessionuser);
	
	if(!sessionuser.equals("administrator")){
		
		response.sendRedirect("../Database/login.jsp");
		session.setAttribute("usertype", null);
		
	}
	
%>
<html>
	<head>
		<title> Add Products </title>
		<meta charset="utf-8"/>
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
					ResultSet result = null;
					
					%>
				<h2> Product Database </h2>
				<table id="shopie">
						
						<tr>
							<th> Option </th>
							<th> Product_ID </th>
							<th> Picture </th>
							<th> Item </th>
							<th> Producer </th>
							<th> Material </th>
							<th> Color </th>
							<th> Price </th>
						</tr>
						
						<%
						
						try{ 
						con = DriverManager.getConnection(connectionUrl+dbName, dbuser, dbpw);
						ps = con.createStatement();
						String sql ="SELECT * FROM FURNITURE_PRODUCTS";
						
						result = ps.executeQuery(sql);
						
						while(result.next()){
						%>
						<tr>
							
							<td>
								<p><a href="updateproducts.jsp?id=<%=result.getString("id") %>">Update</a></p>
								<p><a href="deleteproducts.jsp?id=<%=result.getString("id") %>" onclick="Do you want to remove this product?">Remove</a></p>
							</td>
							<td><%=result.getString("product_id") %></td>
							<td><img src="../Pics/<%=result.getString("image") %>" width="100" height="100" alt="No Pic"/></td>
							<td><%=result.getString("product_name") %></td>
							<td><%=result.getString("producer") %></td>
							<td><%=result.getString("material") %></td>
							<td><%=result.getString("color") %></td>
							<td><%=result.getString("price") %> RMB</td>
							
							
						</tr>
						
						<% 
						
						}
						result.close();
						ps.close();
						con.close();
						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
				</table>
				
				<div id="cartbtn">
					<form action="addproducts.jsp" method="post">
						
						<button type="submit">Add Products</button>
						
					</form>
				</div>
				
			</div>
		</div>
	</body>

</html>
