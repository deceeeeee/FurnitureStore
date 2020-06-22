<%@ page language="java" import = "java.sql.*, java.util.*, java.util.Date, java.text.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%

	String usertype = (String)session.getAttribute("usertype");
	System.out.println(usertype);

%>
<html>
	<head>
		<title> Gotz Furniture Store </title>
		<meta charset="utf-8"/>
		<link rel="stylesheet" href="../CSS/home.css">
	</head>
	
	<body>

		<%
			String driverName = "com.mysql.jdbc.Driver";
			String connectionUrl = "jdbc:mysql://localhost:3306/";
			String dbName = "furnituredb";
			String dbuser = "root";
			String dbpw = "";
			
			String id = new String(request.getParameter("id"));
			String user = new String(request.getParameter("username"));
			String product_id = new String(request.getParameter("product_id"));
			String comms = new String(request.getParameter("comms"));
			
			SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			Date date = new Date();
			String dates = new String(ft.format(date));
			
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
			String sql ="INSERT INTO COMMENT_LIST(PRODUCT_ID, IMAGE, USERNAME, COMMENTS, CREATED_AT) VALUES('"+product_id+"', (SELECT PROFPICS FROM ACCOUNT WHERE USERNAME = '"+user+"'), '"+user+"', '"+comms+"', '"+dates+"')";
			System.out.println("Lets see");
			int posted = ps.executeUpdate(sql);
			
			if(usertype.equals("customer")){
				
				response.sendRedirect("User/userprod.jsp?id="+id);	
				
			} else if(usertype.equals("seller")){
				
				response.sendRedirect("Vendor/sellerprod.jsp?id="+id);
				
			}
			
			
			
			ps.close();
			con.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
		%>
	</body>

</html>