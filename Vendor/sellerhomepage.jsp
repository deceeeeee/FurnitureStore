<%@ page language="java" import="java.util.*, java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	
	String sessionuser = (String)session.getAttribute("usertype");	
	String logger = (String)session.getAttribute("username");

	if(session.getAttribute("username").equals(null) || !sessionuser.equals("seller")){
		
		response.sendRedirect("../Database/login.jsp");
		session.setAttribute("usertype", null);
		
	}
	
%>
<html>

	<head>
		<title> Gotz Furniture Store </title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="../CSS/home.css">
		<style>
		
			.choicebox {
				
				padding-top: 0.5em;
				padding-left: 1em;
				padding-bottom: 0.5em;
				background-color: #FDF9BD;
				border-bottom: 3px solid white;
			}
			
			.choicebox h4 {
				text-transform: uppercase;
				color: #8F4320;
			}
			
			.choicebox p {
				font-size: 12px;
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
				<li> <a href="sellerhomepage.jsp"> <em>Home</em> </a> </li>
				<li> <a href="selleraboutus.jsp"> <em>About Us</em> </a> </li>
				<li> <a href="sellercatalog.jsp#bedroom"> <em>Catalog</em></a> </li>
				<li> <a href="sellercontactus.jsp"> <em>Contact Us</em> </a> </li>
			</ul>
		</div>
		
		<div id="content">
			<div id="products">
				
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
					ResultSet result = null;
					
					try{ 
						con = DriverManager.getConnection(connectionUrl+dbName, dbuser, dbpw);
						ps = con.createStatement();
						
						String order = "SELECT * FROM RECEIPT_LIST INNER JOIN TRANSACTION_LOG INNER JOIN FURNITURE_PRODUCTS ON receipt_list.Invoice_no = transaction_log.Invoice_no AND transaction_log.product_id = furniture_products.product_id WHERE PROGRESS = 'PENDING' AND PRODUCER = (SELECT COMPANY FROM ACCOUNT WHERE USERNAME = '"+session.getAttribute("username")+"') ORDER BY receipt_list.id DESC";
						System.out.println(order);
						result = ps.executeQuery(order);
						
					%>
					
						<h3> Placed Orders </h3>
						
					<%
						
						while(result.next()){
							
					%>
							<div class="choicebox">
							
								<h4> <%=result.getString("Name") %> </h4>
								<p> Ordered Product: (<%=result.getString("product_id") %>)<%=result.getString("product_name") %> x<%=result.getString("quantity") %> </p>
								<p> Ordered Date: <%=result.getString("payment_date") %> <p>
								<p> Address: <%=result.getString("address") %>, <%=result.getString("post_code") %> </p>
								<p> <a href="confirm.jsp?invoiceno=<%=result.getString("Invoice_no")%>">Confirm</a> | <a href="cancel.jsp?invoiceno=<%=result.getString("Invoice_no")%>&product_id=<%=result.getString("product_id")%>&qty=<%=result.getString("Item_amount")%>">Reject</a> </p>
						
							</div>
							
						
						
					<%
						}
					
						String delivered = "SELECT * FROM RECEIPT_LIST INNER JOIN TRANSACTION_LOG INNER JOIN FURNITURE_PRODUCTS ON receipt_list.Invoice_no = transaction_log.Invoice_no AND transaction_log.product_id = furniture_products.product_id WHERE PROGRESS = 'Delivered' AND PRODUCER = (SELECT COMPANY FROM ACCOUNT WHERE USERNAME = '"+session.getAttribute("username")+"') ORDER BY receipt_list.id DESC";
						System.out.println(delivered);
						result = ps.executeQuery(delivered);
						
					%>
					
						<h3> Confirmed Orders </h3>
						
					<%
						
						while(result.next()){
							
					%>
							<div class="choicebox">
							
								<h4> <%=result.getString("Name") %> </h4>
								<p> Transaction No.: <%=result.getString("invoice_no") %> <p>
								<p> Ordered Product: (<%=result.getString("product_id") %>)<%=result.getString("product_name") %> x<%=result.getString("quantity") %> </p>
								<p> Address: <%=result.getString("address") %>, <%=result.getString("post_code") %> </p>
								
							</div>
						
					<%
					
					
						}
						result.close();
						ps.close();
						con.close();
				
						
						} catch (Exception e) {
							e.printStackTrace();
						}
					
					%>
				
			</div>
			<div id="notice">
				<h2> WELCOME, <%=session.getAttribute("username")%>! </h2>
				<h4> CLICK HERE TO <a href="../logout.jsp">LOG OUT</a> </h4>
			</div>
		</div>
	</body>
	
</html>