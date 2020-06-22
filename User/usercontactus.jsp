<%@ page language="java" import="java.sql.*, java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<title> Contact Us </title>
		<meta charset="utf-8"/>
		<link rel="stylesheet" href="../CSS/home.css">
		<style>
			textarea {
				font-family: Verdana, Geneva, sans-serif;
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
				<h2> Contact Us </h2>
				<h3> Retail Manager: </h3>
				<ul>
					<li> Name: Mr. Chen </li>
					<li> Phone No.: 17630828352 </li>
					<li> Email: GotzRetail@yahoo.com </li>
				</ul>
				
				<h3> HRD Manager </h3>
				<ul>
					<li> Name: Mr. Huang </li>
					<li> Phone No.: 15040213327 </li>
					<li> Email: GotzHRD@yahoo.com </li>
				</ul>
				
					<h3> Sales Manager </h3>
				<ul>
					<li> Name: Mr. Liu </li>
					<li> Phone No.: 17201100504 </li>
					<li> Email: GotzSale@yahoo.com </li>
				</ul>
			</div>
			
			<div id="notice">
				
				<h2> SUGGESTION </h2>
				
				<p> We are open to suggestion! Please send us any suggestion for us to improve our service! </p>
				
				<form name="email" action="usersendmail.jsp" method="post">
					
					<h4>Suggestion:</h4>
						<textarea rows="4" cols="30" name="suggest"></textarea>
					<br>
					<br>
					<button type="submit" name="submit" value="ok">Send</button>
								
				</form>
			</div>
			
		</div>
	</body>
	
</html>