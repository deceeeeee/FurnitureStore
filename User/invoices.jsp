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
		<title> Purchase History </title>
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
			
			.progress {
				float: right;
				padding-right: 20px;
				text-transform: uppercase;
			}
			
			.asd {
				display: none;
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
			<form name="searchQuery" action="querypage.jsp" method="get">
			<ol>
					<li> <input type="submit" value="Search"> </li>
					<li> <input type="text" name="querysearch"> </li>
					<li> <img src="../Logo/search.png" alt="search" width="23" height="23"> </li>
			</ol>
			</form>
		</div>
		
		<div id="content">
			<div id="products">
				<h2> Purchase History </h2>
					
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
						
						String displaycart = "SELECT * FROM RECEIPT_LIST WHERE USERNAME = '"+user+"' ORDER BY ID DESC";
						ResultSet result = ps.executeQuery(displaycart);
						String progress = new String();
						
						while(result.next()){
							
							progress = result.getString("progress");
							
							%>
							
							<div class="choicebox">
							
								<h4> <%=result.getString("Item_amount") %> items </h4>
								<p> Transaction No.: <%=result.getString("Invoice_no") %> </p>
								<p> Transaction Date: <%=result.getString("payment_date") %> <p>
								
								<%
								
									if(progress.equals("Pending")){
										
										out.println("<h5><span class='progress' style='color: red'>"+progress+"</span></h5>");
										%>
										<p> <a href="userinvoice.jsp?invoiceno=<%=result.getString("Invoice_no")%>">See more...</a> </p>
										<%
									
									} else if(progress.equals("Delivered")) {
										
										out.println("<h5><span class='progress' style='color: green'>"+progress+"</span></h5>");
										%>
										<p> <a href="userinvoice.jsp?invoiceno=<%=result.getString("Invoice_no")%>">See more...</a> </p>
										<%
										
									} else if(progress.equals("Received")){
										
										out.println("<h5><span class='progress' style='color: #8F4230'>"+progress+"</span></h5>");
										%>
										<p> <a href="userinvoice.jsp?invoiceno=<%=result.getString("Invoice_no")%>">See more...</a> </p>
										<%
										
									} else if(progress.equals("Cancelled")){
										
										out.println("<h5><span class='progress' style='color: gray'>"+progress+"</span></h5>");
										%>
										<p> <a href="" onclick="alert('Order request has been rejected! Money will be refunded automatically')">See more...</a> </p>
										<%
										
									}
								
								
								%>
										
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
		</div>
	</body>

</html>