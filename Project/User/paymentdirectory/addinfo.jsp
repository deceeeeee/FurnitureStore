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
				<h2> Add Address </h2>
				<p> Please enter the required information </p>
				
					<form name="address" action="add_info.jsp" method="get">
						<p>Name:</p>
						<input type="text" name="name" value="">
						<p>Address:</p>
						<input type="text" name="address" value="">
						<p>Phone Number:</p>
						<input type="text" name="phone" value="">
						<p>Postal Code:</p>
						<input type="text" name="post_code" value="">
						<br>
						<br>
						<br>
						<button name="username" value="">Save</button>
					</form>

			</div>
		</div>
	</body>

</html>
