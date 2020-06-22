<%@ page language="java" import = "java.sql.*, java.io.*, java.util.*, javax.servlet.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<!DOCTYPE html>
<%
	
	String usertype = (String)session.getAttribute("usertype");
	String user = (String)session.getAttribute("username");
	String category = new String(request.getParameter("category"));
	
	if(session.getAttribute("username") == null || !usertype.equals("seller")){
		
		response.sendRedirect("../Database/login.jsp");
		session.setAttribute("usertype", null);
		
	}

	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "furnituredb";
	String dbuser = "root";
	String dbpw = "";
	
	int counter = 0;
	String industry = new String();
	String productid = new String();
	String code = new String();
	
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
	String produce = "SELECT COMPANY FROM ACCOUNT WHERE USERNAME = '"+user+"' ";
	result = ps.executeQuery(produce);
	
	while(result.next()){
		
		industry = result.getString("company");
		
	}
	
	String fetch = "SELECT CODE FROM FURNITURE_CATEGORY WHERE CATEGORY = '"+category+"' ";
	result = ps.executeQuery(fetch);
	
	while(result.next()){
		
		code = result.getString("code");
		
	}
	
	String sql ="SELECT * FROM FURNITURE_PRODUCTS WHERE PRODUCT_ID LIKE '"+code+"' ";
	
	result = ps.executeQuery(sql);
	
	
	while(result.next()){
	 
		counter++;
		
	}
	
	System.out.println("Product Qty:" + counter);
	
	int serialno = counter + 1;
	System.out.println("Next Product Serial No:" + serialno);
	System.out.println("Producer:" + industry);
	
	String[] splitter = code.split("%");
	code = splitter[0];
	
	System.out.println("Category Code:" + code);
	
	int i = 0;
	int temp = serialno;
	
	while(temp > 0){
		
		temp = temp/10;
		i++;
		
	}
	
	if(i == 1){
		productid = code + "00" + serialno;	
	} else if(i == 2){
		productid = code + "0" + serialno;
	} else if(i == 3){
		productid = code + serialno;
	} else {
		System.out.println("ERROR 404");
	}
	
	System.out.println(productid);
	
%>
<html>

	<head>
		<title> Gotz Furniture Store </title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="../CSS/home.css">
		<style>
			
			
			
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
				<h2> Add <%=category %> Products </h2>
				<p> Please enter the name and the details of the item </p>
				
				<form name="addprod" action="../FileUploadServlet" method="post" enctype="multipart/form-data">
					<input type="hidden" name="usertype" value="<%=usertype%>">
					<p>Picture:</p>
					<input type="file" name="image">
					
					<input type="hidden" name="product_id" value="<%=productid%>">
					
					<p>Product:</p>
					<input type="text" name="product">
					<p>Material:</p>
					<input type="text" name="base">
					<p>Color:</p>
					<input type="text" name="color">
					<p>Size:</p>
					<input type="text" name="size">
					
					<input type="hidden" name="producer" value="<%=industry%>">
					
					<p>Price:</p>
					<input type="text" name="price">
					<p>Description:</p>
					<textarea style="font-family:Verdana, Geneva, sans-serif" name="comments" rows="5" cols="50"></textarea>
					<br>
					<br>
					<br>
					<input type="submit" value="Add Product">
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