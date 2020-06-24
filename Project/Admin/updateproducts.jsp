<%@ page language="java" import = "java.sql.*, java.io.*, java.util.*, javax.servlet.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<!DOCTYPE html>
<html>

	<head>
		<title> Gotz Furniture Store </title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="../CSS/home.css">
		<style>
			
			.msg{
				color: green;
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
				<li> <a href="adminhomepage.jsp"> <em>Home</em> </a> </li>
				<li> <a href="adminproduct.jsp"> <em>Products</em> </a> </li>
				<li> <a href="adminaccountdeletion.jsp"> <em>Account and Logistic Control</em> </a> </li>
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
					
					String id = new String(request.getParameter("id"));
					String usertype = (String)session.getAttribute("usertype");
					
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
					String sql ="SELECT * FROM FURNITURE_PRODUCTS WHERE ID = '"+id+"' ";
					
					result = ps.executeQuery(sql);
					String[] container = new String[10];
					
					while(result.next()){
					 
						container[0] = result.getString("product_id");
						container[1] = result.getString("product_name");
						container[2] = result.getString("material");
						container[3] = result.getString("color");
						container[4] = result.getString("size");
						container[5] = result.getString("producer");
						container[6] = result.getString("price");
						container[7] = result.getString("comments");
						container[8] = result.getString("image");
						
					}
				
					%>

						<h2> Update products </h2>
						<p> Please enter the name and the details of the item </p>
						
						<form name="updateprod" action="../UpdateServlet" method="post" enctype="multipart/form-data">
							<input type="hidden" name="usertype" value="<%=usertype%>">
							<p>Picture:</p>
							<input type="file" name="image">
							<input type="hidden" name="id" value="<%=id%>">
							<input type="hidden" name="current" value="<%=container[8]%>">
							<p>Product ID:</p>
							<input type="text" name="product_id" value="<%=container[0]%>">
							<p>Product:</p>
							<input type="text" name="product" value="<%=container[1]%>">
							<p>Material:</p>
							<input type="text" name="base" value="<%=container[2]%>">
							<p>Color:</p>
							<input type="text" name="color" value="<%=container[3]%>">
							<p>Size:</p>
							<input type="text" name="size" value="<%=container[4]%>">
							<p>Producer:</p>
							<input type="text" name="producer" value="<%=container[5]%>">
							<p>Price:</p>
							<input type="text" name="price" value="<%=container[6]%>">
							<p>Description:</p>
							<textarea style="font-family:Verdana, Geneva, sans-serif" name="comments" rows="5" cols="50"><%=container[7] %></textarea>
							<br>
							<br>
							<br>
							<input type="submit" value="Update Product">
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
