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
				<h2> Added to cart </h2>
						
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
							
							String productid = new String(request.getParameter("product_id"));
							String productname = new String(request.getParameter("product_name"));
							String color = new String(request.getParameter("color"));
							String size = new String(request.getParameter("size"));
							String image = new String(request.getParameter("image"));
							String price = new String(request.getParameter("price"));
							
							Cookie[] cookies = request.getCookies();
							Cookie cookie = cookies[1];
							String user = new String(cookie.getValue());
							
							String isthere = "SELECT ID FROM SHOPPING_CART WHERE USERNAME = '"+user+"' AND PRODUCT_NAME = '"+productname+"' ";
							String addcart = "INSERT INTO SHOPPING_CART(USERNAME, PRODUCT_ID, PRODUCT_NAME, COLOR, SIZE, IMAGE, PRICE, QUANTITY) VALUES('"+user+"', '"+productid+"', '"+productname+"', '"+color+"', '"+size+"', '"+image+"', '"+price+"', '1')";
//							String putimage = "UPDATE SHOPPING_CART SET IMAGE = (SELECT IMAGE FROM FURNITURE_PRODUCTS WHERE PRODUCT_NAME = '"+productname+"') WHERE PRODUCT_NAME = '"+productname+"'";
							
							ResultSet check = ps.executeQuery(isthere);
							
							while(check.next()){

								String id = check.getString("id");
								String addqty = "SELECT QUANTITY FROM SHOPPING_CART WHERE ID = '"+id+"' ";
								ResultSet qty = ps.executeQuery(addqty);
								while(qty.next()){
									
									int count = qty.getInt("quantity");
									int i = count + 1;
									PreparedStatement newqty = con.prepareStatement("UPDATE SHOPPING_CART SET QUANTITY = '"+i+"' WHERE ID = '"+id+"'");
									int shopcart = newqty.executeUpdate();
									
								}
							
							}
	
							int add = ps.executeUpdate(addcart);
	//						int addimage = ps.executeUpdate(putimage);

							
							} catch (Exception e) {
							e.printStackTrace();
							}
			
					%>
			</div>
		</div>
	</body>

</html>