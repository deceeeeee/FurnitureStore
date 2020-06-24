<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	
	String sessionuser = (String)session.getAttribute("usertype");
	System.out.println(sessionuser);
	
	if(session.getAttribute("username") == null || !sessionuser.equals("administrator")){
		
		response.sendRedirect("../Database/login.jsp");
		session.setAttribute("usertype", null);
		
	}
	
%>
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
					<h2> Account List </h2>
					<h3> Customer </h3>
					<table id="shopie">
						
						<tr>
							<th> Option </th>
							<th> Username </th>
							<th> Name </th>
							<th> Country </th>
							<th> Furniture Preference </th>
						</tr>
						
						<%
						
						try{ 
						con = DriverManager.getConnection(connectionUrl+dbName, dbuser, dbpw);
						ps = con.createStatement();
						String sql ="SELECT ID, ACCOUNT_TYPE, USERNAME, NAME, COUNTRY, PREFERENCE FROM ACCOUNT WHERE account_type = 'customer' ";
						
						result = ps.executeQuery(sql);
						
						while(result.next()){
						%>
						<tr>
							
							<td> 
								<p><a href="delete_handle.jsp?id=<%=result.getString("id") %>" onclick="return confirm('Do you want to remove this account?');">Remove</a></p>
								<p><a href="adminaccount.jsp?id=<%=result.getString("id")%>">Open</a></p>
							</td>
							<td><%=result.getString("Username") %></td>
							<td><%=result.getString("Name") %></td>
							<td><%=result.getString("Country") %></td>
							<td><%=result.getString("Preference") %></td>
							
						</tr>
						
						<% 
						
						}
						
						%>
				
					</table>
					<h3> Seller </h3>
					<table id=shopie>
						<tr>
							<th> Option </th>
							<th> Username </th>
							<th> Company </th>
							<th> Country </th>
						</tr>
						
						<%
						
						String sql2 = "SELECT ID, ACCOUNT_TYPE, USERNAME, COUNTRY, COMPANY FROM ACCOUNT WHERE ACCOUNT_TYPE = 'seller'";
						result = ps.executeQuery(sql2);
						
						while(result.next()){
							%>
							<tr>
								
								<td> 
									<p><a href="delete_handle.jsp?id=<%=result.getString("id") %>" onclick="return confirm('Do you want to remove this account?');">Remove</a></p>
									<p><a href="adminaccountseller.jsp?id=<%=result.getString("id")%>">Open</a></p>
								</td>
								<td><%=result.getString("Username") %></td>
								<td><%=result.getString("Company") %></td>
								<td><%=result.getString("Country") %></td>
								
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
			</div>
			<div id="notice">
				<h2> HELLO, ADMINISTRATOR!</h2>
				<h4> <a href="../logout.jsp">CLICK HERE</a> TO LOG OUT </h4>
			</div>
		</div>
	</body>

</html>
