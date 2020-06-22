<%@ page language="java"  import="java.sql.*, java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%

	String user = (String)session.getAttribute("username");
	System.out.println(user);
%>
<html>

	<head>
		<title> Gotz Furniture Store </title>
		<meta charset="utf-8">
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
						String keyword = new String(request.getParameter("querysearch"));
						
						%>
						
						<h3> Search result for keyword: '<%=keyword %>'</h3>
								
						<div class="grid-container">
						
						<%
						
						String search = new String("%" + keyword + "%");
						String sql ="SELECT * FROM FURNITURE_PRODUCTS WHERE PRODUCT_ID LIKE (SELECT CODE FROM FURNITURE_CATEGORY WHERE CATEGORY LIKE '"+search+"') OR PRODUCT_NAME LIKE '"+search+"' OR PRODUCER LIKE '"+search+"' OR MATERIAL LIKE '"+search+"' OR COLOR LIKE '"+search+"' OR PRICE < '"+keyword+"' ORDER BY CLICKED DESC";
						result = ps.executeQuery(sql);
						
						while(result.next()){
						%>
						
							<div class="grid-item">

								<a href="userprod.jsp?id=<%=result.getString("id")%>&product_name=<%=result.getString("product_name")%>">
									<img src="../Pics/<%=result.getString("image") %>" width="100" height="100" alt="no pic"/>
								</a>
								<h5> <span class="name"><%=result.getString("product_name") %></span> </h5>
								<p>  <%=result.getInt("price") %> RMB </p><br>
								<p> By: <em><%=result.getString("producer") %></em> </p>

							</div>
						
						<% 
						
						}
						
						String put = "INSERT INTO KEYWORDS(USERNAME, KEYWORDS) VALUES('"+user+"', '"+keyword+"')";
						int update = ps.executeUpdate(put);
						
						if(update > 0){
							
							System.out.println("Successfully stored");
							
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
		</div>
	</body>

</html>