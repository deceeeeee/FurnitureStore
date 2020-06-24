<%@ page language="java" import = "java.sql.*, java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
		<title> <%=request.getParameter("product_name") %></title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="CSS/home.css">
		<style>
			.pic {
				float: left;
				padding-top: 2em;
			}
			.prodinfo {
				padding-top: 1em;
				padding-left: 4em;
				padding-bottom: 3em;
				background-color: #FDF9BD;
				margin-left: 14em;
				margin-top: 2em;
			}
			
			.prodinfo h4 {
				text-transform: uppercase;
				color: #8F4320;
			}
			
			.prodinfo ul{
				list-style-type: none;
			}
			
			table th{
				background-color: #ECBE80;
				border-style: none;
			}
			
			.tabcontainer {
				width: 100%;
			}
			
			.tabcontainer ul li {
				width: 25%;
			}
			
			.tabcontainer ul li:target {
				border-bottom: 3px solid white;
			}
			
			#descriptions {
				padding: 0 1em 1em 1em;
			}
			
			.comments {
				
				padding-top: 0.5em;
				padding-left: 1em;
				padding-bottom: 0.5em;
				background-color: #FDF9BD;
				border-bottom: 3px solid white;
			}
			
			.comments h4 {
				text-transform: uppercase;
				color: #8F4320;
				font-size: 14px;
			}
			
			.comments p {
				font-size: 12px;
			}
			
			.comments img {
				float: left;
				padding-right: 2em;
			}
			
			.comments small	{
				opacity: 50%;
				font-size: 10px;
				font-style: italic;
			}
			
			#commentbox button {
				width: 60px;
				height: 40px;
			}
			
			#commentbox textarea {
				font-family: Verdana, Geneva, sans-serif;
				font-size:12px;
			}
			
			.grid-item {
			
				width: 25em;
			
			}
			
		</style>
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
			<form name="searchQuery" action="querypage2.jsp" method="get">
			<ol>
					<li> <input type="submit" value="Search"> </li>
					<li> <input type="text" name="querysearch"> </li>
					<li> <img src="Logo/search.png" alt="search" width="23" height="23"> </li>
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
				
					String id = new String(request.getParameter("id"));
					
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
					String sql ="SELECT * FROM FURNITURE_PRODUCTS WHERE ID = '"+id+"'";
					String[] desc = new String[3];
					int count = 0;
					
					result = ps.executeQuery(sql);
					
					while(result.next()){
						%>
							<span class="pic">
								<img src = "Pics/<%=result.getString("image") %>" alt="dresser" width="200" height="200">
							</span>
							<div class="prodinfo">
							<h4> <%=result.getString("product_name") %> </h4>
							<table>
								<tr>
									<th>Price</th>
									<td><%=result.getString("price") %> RMB</td>
								</tr>
								<tr>
									<th>Color</th>
									<td><%=result.getString("color") %></td>
								</tr>
								<tr>
									<th>Material</th>
									<td><%=result.getString("material") %></td>
								</tr>
								<tr>
									<th>Size</th>
									<td><%=result.getString("size") %></td>
								</tr>
								<tr>
									<th>Producer</th>
									<td><%=result.getString("producer") %></td>
								</tr>
							</table>
							</div>
					<%
						desc[0] = result.getString("comments");
						desc[1] = result.getString("product_name");
						desc[2] = result.getString("product_id");
						count = result.getInt("clicked") + 1;
					}
					
					String click = "UPDATE FURNITURE_PRODUCTS SET CLICKED = '"+count+"' WHERE PRODUCT_ID = '"+desc[2]+"' ";
					int clicked = ps.executeUpdate(click);
					
					%>
				
				<div class="tabcontainer">
					<ul>
						<li><a href="#descriptions">Description</a></li>
						<li><a href="#comments">Comments</a></li>
						<li><a href="#recommendations">Recommendation</a></li>
					</ul>
				</div>
				
				<br><br>
				
				<p id="descriptions"> 
					<%
						if(desc[0] == null) {
							
							out.println("  ");
							
						} else {
							
							out.println(desc[0]);
							
						}
					%> 
				</p>
				
				<h3 id="comments"> Comments </h3>
					<form id="commentbox" action="Database/login.jsp" method="post">
						
						<textarea rows="3" cols="70" name="comms" required></textarea>
						<br>
						<button name=username value="null">Post</button>
					</form>
					<br>
				<% 
				
					String comms = "SELECT * FROM COMMENT_LIST WHERE PRODUCT_ID = '"+desc[2]+"' ORDER BY CREATED_AT DESC";
					ResultSet comments = ps.executeQuery(comms);	
					
					while(comments.next()){
				%>
					<div class="comments">
						<img style='padding-top: 1.2em' src="Database/profilepics/<%=comments.getString("image") %>" width="60" height="60">
						<h4> <%=comments.getString("username") %> </h4>
						<p> <%=comments.getString("comments") %></p>
						<small>Comment created on: <%=comments.getString("created_at") %></small>
					</div>
				<%
				
					}
					

					comments.close();
				
				%>
				
				<h3 id="recommendations"> Recommendation </h3>
					<div class="grid-container">
				<% 
				
						String proid = desc[2].toString();
						String[] category = proid.split("0", 2);
						
						String keys = "SELECT KEYWORDS, COUNT(*) OCCURENCES FROM KEYWORDS GROUP BY KEYWORDS HAVING COUNT(*) > 1 ORDER BY `OCCURENCES` DESC";
						result = ps.executeQuery(keys);
						String[] array = new String[2];

						String rec = "SELECT * FROM FURNITURE_PRODUCTS WHERE PRODUCT_ID LIKE '"+category[0]+"%'";
						
						for(int i = 0;i<2;i++){
						
							if(result.next()){
								
								array[i] = result.getString("keywords"); 
								rec = rec + "OR PRODUCT_ID LIKE(SELECT CODE FROM FURNITURE_CATEGORY WHERE CATEGORY LIKE '%"+array[i]+"%') OR PRODUCT_NAME LIKE '%" +array[i] + "%' OR MATERIAL LIKE '%"+array[i]+"%' OR COLOR LIKE '%"+array[i]+"%' OR PRODUCER LIKE '%"+array[i]+"%'";	
								
							} else {
								
								break;
								
							}
							
						}
						
						rec = rec + "ORDER BY CLICKED DESC";
						System.out.println(rec);
						result = ps.executeQuery(rec);
						
						while(result.next()){
							
						%>	
							<div class="grid-item">
							
								<a href="prod.jsp?id=<%=result.getString("id")%>&product_name=<%=result.getString("product_name")%>">
									<img src="Pics/<%=result.getString("image") %>" width="100" height="100" alt="no pic"/>
								</a>
								<h5> <span class="name"><%=result.getString("product_name") %></span> </h5>
								<p>  <%=result.getInt("price") %> RMB </p>
								<br>
								<p> By: <em><%=result.getString("producer") %></em> </p>

							</div>
						
						<%
							
						}
						
						%>
						
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
