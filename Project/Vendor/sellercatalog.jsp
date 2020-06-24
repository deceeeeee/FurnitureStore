<%@ page language="java" import="java.sql.*, java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%

	String sessionuser = (String)session.getAttribute("usertype");
	System.out.println(sessionuser);
	
	if(session.getAttribute("username") == null || !sessionuser.equals("seller")){
		
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
			.grid-container {
			  display: grid;
			  grid-template-columns: auto auto;
			  background-color: #fdf9bd;
			  padding: 20px;
			  grid-gap: 20px;
			}
			
			button {
				width: 7.5em;
				height: 2em;
				float: right;
			}
			
			.grid-item {
			  background-color: rgba(255, 255, 255, 0.8);
			  border: 2px solid brown;
			  width: 25em;
			  padding: 10px;
			  font-size: 12px;
			  overflow: hidden;
			  font-weight: normal;
			}
			
			.grid-item:hover {
				opacity: 0.5;
			}
			
			.grid-item img{
				float: left;
				padding-top: 1em;
				padding-right: 2em;
			}
			
			.name {
				color: #8F4230;
				font-size: 14px;
			}
			
			#bedroom{
				
				display: none;
				
			}
			
			#bedroom:target{
			
				display: block;
			
			}
			
			#kitchen{
				
				display: none;
				
			}
			
			#kitchen:target{
			
				display: block;
			
			}
			
			#livingroom{
				
				display: none;
				
			}
			
			#livingroom:target{
			
				display: block;
			
			}
			
			#office{
				
				display: none;
				
			}
			
			#office:target{
			
				display: block;
			
			}
			
			.tabcontainer {
			
				width: 100%;
				display: block;
				padding-top: 0.2em;
			
			}
			
			.tabcontainer ul {
			
				display: block;
			
			}
			
			.tabcontainer ul li{
			
				width: 11em;
				text-align: center;
			
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
				<h2> Product Catalog </h2>
				
				<div class="tabcontainer">
				
					<ul>
						
						<li>
							<a href="#bedroom">Bedroom</a>
						</li>
						<li>
							<a href="#livingroom">Living Room</a>
						</li>
						<li>
							<a href="#kitchen">Kitchen and Dining</a>
						</li>
						<li>
							<a href="#office">Office</a>
						</li>
						
					</ul>
				
				</div>
			<%
			
			String driverName = "com.mysql.jdbc.Driver";
			String connectionUrl = "jdbc:mysql://localhost:3306/";
			String dbName = "furnituredb";
			String dbuser = "root";
			String dbpw = "";
			
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
			String bed = "SELECT * FROM FURNITURE_PRODUCTS WHERE PRODUCT_ID LIKE 'C%' AND PRODUCER = (SELECT COMPANY FROM ACCOUNT WHERE USERNAME = '"+session.getAttribute("username")+"')";
			String office = "SELECT * FROM FURNITURE_PRODUCTS WHERE PRODUCT_ID LIKE 'D%' AND PRODUCER = (SELECT COMPANY FROM ACCOUNT WHERE USERNAME = '"+session.getAttribute("username")+"')";
			String living = "SELECT * FROM FURNITURE_PRODUCTS WHERE PRODUCT_ID LIKE 'A%' AND PRODUCER = (SELECT COMPANY FROM ACCOUNT WHERE USERNAME = '"+session.getAttribute("username")+"')";
			String kitchen = "SELECT * FROM FURNITURE_PRODUCTS WHERE PRODUCT_ID LIKE 'B%' AND PRODUCER = (SELECT COMPANY FROM ACCOUNT WHERE USERNAME = '"+session.getAttribute("username")+"')";
			
			result = ps.executeQuery(bed);
			
			%>
			
				<div id="bedroom">
					<div class="grid-container">
			
			<%
			
			while(result.next()){
			%>
			
						<div class="grid-item">
		
							<a href="sellerprod.jsp?id=<%=result.getString("id")%>&product_name=<%=result.getString("product_name")%>">
								<img src="../Pics/<%=result.getString("image") %>" width="100" height="100" alt="no pic"/>
							</a>
							<h5> <span class="name"><%=result.getString("product_name") %></span> </h5>
							<p>  <%=result.getInt("price") %> RMB </p>
							<p> Code: <em><%=result.getString("product_id") %></em> </p>
		
						</div>
			
			<% 
			
			} 
			
			%>
					</div><br>
					<form action="selleradd.jsp" method="get">
						<button name="category" value="Bedroom">Add Product</button>
					</form>
				</div>
				
				<div id="livingroom">
					<div class="grid-container">
							
			<%
			
			result = ps.executeQuery(living);
			
			while(result.next()){
				%>
				
							<div class="grid-item">
			
								<a href="sellerprod.jsp?id=<%=result.getString("id")%>&product_name=<%=result.getString("product_name")%>">
									<img src="../Pics/<%=result.getString("image") %>" width="100" height="100" alt="no pic"/>
								</a>
								<h5> <span class="name"><%=result.getString("product_name") %></span> </h5>
								<p>  <%=result.getInt("price") %> RMB </p>
								<p> Code: <em><%=result.getString("product_id") %></em> </p>
			
							</div>
				
				<% 
				
				}
				
				%>
						</div><br>
						<form action="selleradd.jsp" method="get">
							<button name="category" value="Living Room">Add Product</button>
						</form>
					</div>
					
					<div id="office">
						<div class="grid-container">
					
				<%
				
				result = ps.executeQuery(office);
				
				while(result.next()){
					%>
					
							<div class="grid-item">
			
								<a href="sellerprod.jsp?id=<%=result.getString("id")%>&product_name=<%=result.getString("product_name")%>">
									<img src="../Pics/<%=result.getString("image") %>" width="100" height="100" alt="no pic"/>
								</a>
								<h5> <span class="name"><%=result.getString("product_name") %></span> </h5>
								<p>  <%=result.getInt("price") %> RMB </p>
								<p> Code: <em><%=result.getString("product_id") %></em> </p>
			
							</div>
					
					<% 
					
				}
				
				%>
						</div><br>
						<form action="selleradd.jsp" method="get">
							<button name="category" value="Office">Add Product</button>
						</form>
					</div>
					
					<div id="kitchen">
						<div class="grid-container">
					
				<%
				
				result = ps.executeQuery(kitchen);
				
				while(result.next()){

				%>
				
							<div class="grid-item">
			
								<a href="sellerprod.jsp?id=<%=result.getString("id")%>&product_name=<%=result.getString("product_name")%>">
									<img src="../Pics/<%=result.getString("image") %>" width="100" height="100" alt="no pic"/>
								</a>
								<h5> <span class="name"><%=result.getString("product_name") %></span> </h5>
								<p>  <%=result.getInt("price") %> RMB </p>
								<p> Code: <em><%=result.getString("product_id") %></em> </p>
			
							</div>
				
				<% 
					
				}
				
				%>
					</div>
					<form action="selleradd.jsp" method="get">
						<button name="category" value="Kitchen and Dining">Add Product</button>
					</form>
				</div>	
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
