<%@ page language="java" import="java.sql.*, java.util.*" contentType="text/html; charset=ISO-8859-1"
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
			
			.container {
				padding: 0 1em 1em;
			}
			
			.item {
				background-color: #FDF9BD;
				padding: 0.5em;
				padding-left: 2em;
				border-bottom: 3px solid white;
			}
			
			.item h4 {
				text-transform: uppercase;
				color: #8F4230;
				font-size: 16px;
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
			
				<h2> Subscriber and Suggestion </h2>
					
					<h3> Email Subscriber </h3>
						<table id="shopie">
							<tr>
								<th> Option </th>
								<th> Name </th>
								<th> Email </th>
							</tr>
							
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
						
							
							try{ 
							con = DriverManager.getConnection(connectionUrl+dbName, dbuser, dbpw);
							ps = con.createStatement();
							String sql ="SELECT * FROM EMAIL_LIST";
							
							result = ps.executeQuery(sql);
							
							while(result.next()){
							
						%>
							
							<tr>
								<td> <a href="mailto:<%=result.getString("email")%>?subject=promotion&body=asd">Send Email</a> </td>
								<td> <%=result.getString("name") %> </td>
								<td>  <%=result.getString("email") %> </td>
							</tr>
							
						<%						
							}
						%>
						
								</table>
					
					<h3> Suggestion </h3>
					<div class="container">
						<p> <a href="clearsuggest.jsp">Clear All</a> </p>
						
						<%
							
							String sql2 = "SELECT * FROM SUGGESTION_BOX";
							result = ps.executeQuery(sql2);
							String message = "Thanks for your suggestion! We will take your suggestion to our consideration and improve our service";
						
									
							while(result.next()){
								
						%>
						
							<div class="item">
								<p style="font-size: 14px;border-bottom: 1px solid">From: <%=result.getString("email") %> </p>
								<p style="font-size: 12px"> <%=result.getString("suggestion") %> </p>
								<p style="font-size: 12px"> <a href="mailto:<%=result.getString("email")%>?subject=Suggestion%20Feedback&body=<%=message%>">Send Feedback</a> </p>
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
		</div>
	</body>

</html>
