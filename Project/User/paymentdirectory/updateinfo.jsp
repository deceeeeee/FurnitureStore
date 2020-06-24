<%@ page language="java" import = "java.sql.*, java.io.*, java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>

	<head>
		<title> Gotz Furniture Store </title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="../../CSS/home.css">
		<style>
			
			
		</style>
	</head>
	
	<body>
		<div id="content">
			<div id="products">
				<h2> Address Update </h2>
				<p> Please enter the required information </p>
				
				<%
					Cookie[] cookies = request.getCookies();
					Cookie cookie = cookies[1];
					String user = new String(cookie.getValue());
					System.out.println(user);	
					
					String id = new String(request.getParameter("id"));
			
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
								
						String address = "SELECT * FROM ADDRESS_LIST WHERE ID = '"+id+"' ";
						ResultSet result = ps.executeQuery(address);
						
						
						while(result.next()){
							
							%>
								<form name="changeaddress" action="info_handle.jsp" method="get">
									<p>Name:</p>
									<input type="text" name="name" value="<%=result.getString("Name")%>">
									<p>Address:</p>
									<input type="text" name="address" value="<%=result.getString("Address")%>">
									<p>Phone Number:</p>
									<input type="text" name="phone" value="<%=result.getString("Phone")%>">
									<p>Postal Code:</p>
									<input type="text" name="post_code" value="<%=result.getString("post_code")%>">
									<br>
									<input type="hidden" name="id" value="<%=result.getString("id") %>">
									<br>
									<br>
									<button name="username" value="<%=result.getString("username") %>">Save</button>
								</form>
							<%
							
						}
						
						
						result.close();
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
