<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
		<title> Gotz Furniture Store </title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="CSS/home.css">
		<script src="Database/sign_up.js">
		</script>
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
				<h2> Furniture Category</h2>
				<table>
					<tr>
						<th> <a href="kitchen.jsp">Kitchen and Dining room</a> </th>
						<th> <a href="office.jsp">Office</a> </th>
					</tr>
					
					<tr>
						<td> <img src="Pics/Kitchen set.jpg" alt="Kitchen Set" width="375" height="300"/> </td>
						<td> <img src="Pics/officeroom.jpg" alt="Office" width="375" height="300"/> </td>
					</tr>
					
					<tr>
						<th> <a href="bedroom.jsp">Bedroom</a> </th>
						<th> <a href="livingroom.jsp">Living room</a> </th>
					</tr>
					 
					<tr>
						<td> <img src="Pics/Bedroom Set 2.jpg" alt="Bedroom Set" width="375" height="300"/> </td>
						<td> <img src="Pics/Living Room.jpg" alt="Living Room" width="375" height="300"/> </td>
					</tr>
				</table>
			</div>
			<div id="notice">
				<h2> COME AND JOIN US!</h2>
				<p> CREATE THE ACCOUNT FOR THIS WEBSITE AND YOU CAN START SHOPPING! </p>
				<h4> <a href="Database/sign_up.jsp">REGISTER NOW!</a> </h4>
			</div>
			<div id="emailsubs">
				
				<h2> JOIN OUR EMAIL LIST </h2>
				
				<p> JOIN AND YOU WILL GET SALES ALERTS, DESIGN TIPS AND WEB ONLY OFFERS! </p>
				
				<form name="email" action="feedback.jsp" method="post">
					
					<h4>Name:</h4>
						<input type="text" name="name" required>
					<br>
					<h4>Email:</h4>
						<input type="email" name="emails" onchange="return validate_email()" required>
					<br><br>
					<button type="submit" name="submit" value="ok">Subscribe</button>
								
				</form>
			</div>
		</div>
	</body>

</html>