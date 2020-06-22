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
		<title> Shopping Cart </title>
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
				<h2> Shopping Cart </h2>
					<table id="shopie">
						
						<tr>
							<th> Option</th>
							<th> Picture </th>
							<th> Item </th>
							<th> Color </th>
							<th> Size </th>
							<th> Price </th>
							<th> Quantity </th>
						</tr>
						
						<%
			
			String driverName = "com.mysql.jdbc.Driver";
			String connectionUrl = "jdbc:mysql://localhost:3306/";
			String dbName = "furnituredb";
			String dbuser = "root";
			String dbpw = "";
			
			Cookie[] cookies = request.getCookies();
			Cookie cookie = cookies[1];
			String user = new String(cookie.getValue());
			System.out.println(user);
			
			try {
			Class.forName(driverName);
			} catch (ClassNotFoundException e) {
			e.printStackTrace();
			}
			
			Connection con = null;
			Statement ps = null;
			
			try{ 
				con = DriverManager.getConnection(connectionUrl+dbName, dbuser, dbpw);
				ps = con.createStatement();
				
				String displaycart = "SELECT * FROM SHOPPING_CART WHERE USERNAME = '"+user+"' ";
				ResultSet result = ps.executeQuery(displaycart);
				int total = 0;
				
				while(result.next()){
					int qty = result.getInt("price")*result.getInt("quantity");
					
					System.out.println(qty);
					%>
					<tr>
						<td> 
							<a href="DeleteItem.jsp?id=<%=result.getString("id") %>" onclick="alert('Do you want to remove this item from the cart?')">Remove from cart</a>
						</td>
						<td><img src="../Pics/<%=result.getString("image") %>" width="100" height="100" alt="no pic"/></td>
						<td><%=result.getString("product_name") %></td>
						<td><%=result.getString("color") %></td>
						<td><%=result.getString("size") %></td>
						<td><%=result.getString("price") %> RMB</td>
						<td><%=result.getString("quantity") %></td>
						
					</tr>
					<%
					total = total + qty;
				}
				
				System.out.println(total);
				
				%>
					</table>
					<h4>Total: <%=total %> RMB</h4>
					<br>
					<form name="pay" action="paymentdirectory/transaction.jsp" method="post">
						<button style='float: right' name="transaction" value="">Pay Now!</button>
					</form>
				<%
				
				result.close();
				ps.close();
				con.close();
		
				
				} catch (Exception e) {
				e.printStackTrace();
				}
					%>
						
					
			</div>
		</div>
	</body>

</html>