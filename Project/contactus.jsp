<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<title> Contact Us </title>
		<meta charset="utf-8"/>
		<link rel="stylesheet" href="CSS/home.css">
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
				
				<form name="email" action="sendmail.jsp" method="post">
					
					<h4>Email:</h4>
						<input type="email" name="emails" onchange="return validate_email()" required>
					<br>
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
