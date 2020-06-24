<html>

	<head>
		<title> Gotz Furniture Store </title>
		<meta charset="utf-8"/>
		<link rel="stylesheet" href="../CSS/home.css">
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
				<li> <a href="../shoppingcart.jsp"> <em>Shopping Cart</em></a> </li>
				<li> <a href="../contactus.jsp"> <em>Contact Us</em> </a> </li>
				<li> <a href="../customerservice.jsp"> <em>Custom Service</em> </a> </li>
			</ul>
		</div>
		
		<div id="content">
			<div id="products">
				<h1> SIGN IN </h1>
					<form name="furnitureform" onsubmit="" action="login_handle.jsp" method="post">
						<p>Username:</p>
						<input type="text" name="username">
						<p>password:</p>
						<input type="password" name="password">
						<br>
						<br>
						<br>
						<input type="submit" value="Login">
					</form>
				<p id="demo"></p>

				<p> Don't have account? <a href="sign_up.jsp">Click here</a> to sign up!
			</div>
		</div>
	</body>

</html>
