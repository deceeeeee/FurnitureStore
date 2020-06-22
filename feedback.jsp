<%@ page language="java" import="java.sql.*, java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
		<title> Gotz Furniture Store </title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="CSS/home.css">
		<script src="Database/sign_up.js">
		</script>
		<style>
			.invisible{
				visibility: hidden;
			}
		</style>
	</head>
	
	<body>
		<div id="intro">
			<h1> Gotz Furniture Store </h1>
			<img src="Logo/FurnitureLogo1.png" alt="Furniture Logo" width="300" height="179"/>
			<p> We can build anything! </p>
		</div>
		<div id="nav">
			<ul>
				<li> <a href="index.jsp"> <em>Home</em> </a> </li>
				<li> <a href="aboutus.jsp"> <em>About Us</em> </a> </li>
				<li> <a href="Database/login.jsp"> <em>Shopping Cart</em></a> </li>
				<li> <a href="contactus.jsp"> <em>Contact Us</em> </a> </li>
				<li> <a href="customerservice.jsp"> <em>Custom Service</em> </a> </li>
			</ul>
			<form name="searchQuery" action="querypage2.jsp" method="post">
				<ol>
					<li> <input type="submit" value="Search"> </li>
					<li> <input type="text" name="querysearch"> </li>
					<li> <img src="Logo/search.png" alt="search" width="23" height="23"> </li>
				</ol>
			</form>
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
							
							String name = new String(request.getParameter("name"));
							String email = new String(request.getParameter("emails"));
							
							String emaillist = "INSERT INTO EMAIL_LIST(NAME, EMAIL) VALUE('"+name+"', '"+email+"')";
							
							int save = ps.executeUpdate(emaillist);
	
							if(save > 0) {
								
								%>
								
									<h2> Thanks for subscribing!</h2>
									<p> Your email has been added to our list! </p>
									<div class="invisible">
									<p> Your email has been added to our list! Your email has been added to our list!  Your email has been added to our list!  Your email has been added to our list!  Your email has been added to our list!  Your email has been added to our list!  Your email has been added to our list!  Your email has been added to our list! </p>
									<p> Your email has been added to our list! Your email has been added to our list!  Your email has been added to our list!  Your email has been added to our list!  Your email has been added to our list! Your email has been added to our list!</p>
									</div> 	
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