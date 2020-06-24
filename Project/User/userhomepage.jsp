<%@ page language="java" import="java.sql.*, java.util.*" contentType="text/html; charset=ISO-8859-1"
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
		<meta charset="utf-8">
		<link rel="stylesheet" href="../CSS/home.css">
		<script src="../Database/sign_up.js">
		</script>
	</head>
	
	<body>
		<div id="intro">
			<h1> Gotz Furniture Store </h1>
			<img src="../Logo/FurnitureLogo1.png" alt="Furniture Logo" width="300" height="179"/>
			<p> We can build anything! </p>
		</div>
		<div id="nav">
			<ul>
				<li> <a href="userhomepage.jsp"> <em>Home</em> </a> </li>
				<li> <a href="useraboutus.jsp"> <em>About Us</em> </a> </li>
				<li> <a href="shoppingcart.jsp"> <em>Shopping Cart</em></a> </li>
				<li> <a href="usercontactus.jsp"> <em>Contact Us</em> </a> </li>
				<li> <a href="usercustomerservice.jsp"> <em>Custom Service</em> </a> </li>
				<li> <a href="invoices.jsp"> <em>Purchase History</em> </a> </li>		
			</ul>
			<form name="searchQuery" action="querypage.jsp" method="post">
				<ol>
					<li> <input type="submit" value="Search"> </li>
					<li> <input type="text" name="querysearch"> </li>
					<li> <img src="../Logo/search.png" alt="search" width="23" height="23"> </li>
				</ol>
			</form>
		</div>
		
		<div id="content">
			<div id="products">
				<h2> Furniture Category </h2>
				<table>
					<tr>
						<th> <a href="userkitchen.jsp">Kitchen and Dining room</a> </th>
						<th> <a href="useroffice.jsp">Office</a> </th>
					</tr>
					
					<tr>
						<td> <img src="../Pics/Kitchen set.jpg" alt="Kitchen Set" width="375" height="300"/> </td>
						<td> <img src="../Pics/officeroom.jpg" alt="Office" width="375" height="300"/> </td>
					</tr>
					
					<tr>
						<th> <a href="userbedroom.jsp">Bedroom</a> </th>
						<th> <a href="userlivingroom.jsp">Living room</a> </th>
					</tr>
					 
					<tr>
						<td> <img src="../Pics/Bedroom Set 2.jpg" alt="Bedroom Set" width="375" height="300"/> </td>
						<td> <img src="../Pics/Living Room.jpg" alt="Living Room" width="375" height="300"/> </td>
					</tr>
				</table>
			</div>
			<div id="notice">
				<h2> WELCOME, <%=session.getAttribute("username") %>! </h2>
				<p> What are you going to buy today? </p>
				<br>
				<h4> <a href="../logout.jsp">CLICK HERE</a> TO LOG OUT </h4>
			</div>
			<br>
		</div>
	</body>

</html>
