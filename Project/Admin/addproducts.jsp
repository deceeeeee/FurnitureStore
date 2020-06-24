<%@ page language="java" import = "java.sql.*, java.io.*, java.util.*, javax.servlet.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<!DOCTYPE html>
<%
	
	String sessionuser = (String)session.getAttribute("usertype");

	if(session.getAttribute("username") == null || !sessionuser.equals("administrator")){
		
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
				<h2> Add products </h2>
				<p> Please enter the name and the details of the item </p>
				
				<form name="addprod" action="../FileUploadServlet" method="post" enctype="multipart/form-data">
					<input type="hidden" name="usertype" value="<%=sessionuser%>">
					<p>Picture:</p>
					<input type="file" name="image">
					<p>Product ID:</p>
					<input type="text" name="product_id">
					<p>Product:</p>
					<input type="text" name="product">
					<p>Material:</p>
					<input type="text" name="base">
					<p>Color:</p>
					<input type="text" name="color">
					<p>Size:</p>
					<input type="text" name="size">
					<p>Producer:</p>
					<input type="text" name="producer">
					<p>Price:</p>
					<input type="text" name="price">
					<p>Description:</p>
					<textarea style="font-family:Verdana, Geneva, sans-serif" name="comments" rows="5" cols="50"></textarea>
					<br>
					<br>
					<br>
					<input type="submit" value="Add Product">
				</form>
			
			</div>
		</div>
	</body>

</html>
