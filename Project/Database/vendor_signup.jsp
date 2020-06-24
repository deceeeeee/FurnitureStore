<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
		<title> Gotz Furniture Store </title>
		<meta charset="utf-8"/>
		<link rel="stylesheet" href="../CSS/home.css">
		<style>
			textarea {
				font-family: Verdana, Geneva, sans-serif;
			}
		</style>
		<script src="sign_up.js">
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
				<li> <a href="../index.jsp"> <em>Home</em> </a> </li>
				<li> <a href="../aboutus.jsp"> <em>About Us</em> </a> </li>
				<li> <a href="login.jsp"> <em>Shopping Cart</em></a> </li>
				<li> <a href="../contactus.jsp"> <em>Contact Us</em> </a> </li>
				<li> <a href="../customerservice.jsp"> <em>Custom Service</em> </a> </li>
			</ul>
		</div>
		
		<div id="content">
			<div class="tabcontainer">
				<ul>
					<a href="sign_up.jsp"><li style='border-bottom: 3px solid white'>Customer</li></a>
					<li>Seller</li>
				</ul>
			</div>
			<div class="register">
				<h1> SIGN UP </h1>
				<form name="furnitureform"  action="sign_up_handle.jsp"  method="post">
					<p> Username : </p>
					<input id="usname" type="text" name="username" required>
					<p> Password : </p>
					<input id="pwd" type="password" name="password" maxlength="8" required>
					<p> Confirmed password : </p>
					<input id="confirmpwd" type="password" name="confirmpassword" onblur="return passwordValidation()" maxlength="8" required>
					<p> Mobile phone : </p>
					<input id="mobphone" type="text" name="phone" onchange="return phone_validation()" required>
					<p> Company Name : </p>
					<textarea id="compname" name="compname" rows="2" required></textarea>
					<p> Country : </p>
					<input id="cname" type="text" name="country" required>
					<p> Current Address: </p>
					<textarea id="loc" name="address"  rows="4" cols="100" required></textarea>
					<p> Postal Code: </p>
					<input id="poscode" type="text" name="postalcode" required>
					<p> Email :</p>
					<input type="text" name="email" id="imel" onchange="return validate_email()" required>
					
					<input type="hidden" name="account" value="seller">
					<input type="hidden" name="birthday" value="">
					<input type="hidden" name="preference" value="">
					<input type="hidden" name="realname" value="">

					<br><br><br>

					<input type="submit" name="submit" value="Register">

					<div class="output" >
					<p id="warning1" style="color:red"></p>
					<p id="warning2" style="color:red"></p>
					<p id="warning3" style="color:red"></p>
					</div>

					<p> Already have an account? <a href="login.jsp">Click here</a> to sign in! </p>
	
				</form>
			</div>
		</div>
	</body>

</html>
