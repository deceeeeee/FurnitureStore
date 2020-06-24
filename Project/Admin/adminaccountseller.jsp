<%@ page language="java" import="java.sql.*, java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
		<title> Gotz Furniture Store </title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="../CSS/home.css">
		<style>
			
			#products a:link {
				color: #8F4230;
			}
			#products a:visited {
			    color: #000;
			}
			#products a:focus {
				color:#8F4230;
			}
			#products a:hover {
			    color: #fc6;
			}
			#products a:active {
				color:#F00;
			}
			
			.tidy {
				padding-left: 1.5em;
			}
			
		</style>
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
			
				<h2> User Information </h2>
					<%
					
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
							ResultSet result = null;
							
							try{ 
							con = DriverManager.getConnection(connectionUrl+dbName, dbuser, dbpw);
							ps = con.createStatement();
							String sql ="SELECT * FROM ACCOUNT WHERE ID = '"+id+"'";
							
							result = ps.executeQuery(sql);
							
							while(result.next()){
							%>
							
								<img src="../Database/profilepics/<%=result.getString("profpics") %>" width="150" height="150">
					
								
								<h3> Company Information </h3>
									
									<div class="tidy">
										<p> Company Name: <%=result.getString("company") %> </p>
										<p> Country: <%=result.getString("country") %> </p>
										<p> Address: <%=result.getString("address") %>, <%=result.getString("post_code") %>  </p>
										<p> Phone Number: <%=result.getString("phone") %> </p>
										<p> Email: <%=result.getString("email") %>  <a href="mailto: <%=result.getString("email") %>">Send Email</a></p>
									</div>
										
								<h3> Account Rating Information</h3>
									<div class="tidy">
										<p> Username: <%=result.getString("username") %> </p>
										<p> Account Type: <%=result.getString("account_type") %> </p>
										<p> Rating: 3.8/5.0
									</div>
									
								<h3> Sale Record</h3>
									<div class="tidy">
										<p> Product sold: 140 item(s) </p>
										<p> Trending: Office Desk </p>
										<p> <img src="../Pics/officedesk2.jpg" width="200" height="200">
									</div>
							
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
