<%@ page language="java" import = "java.sql.*, java.io.*, java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<% 
	Cookie[] cookies = request.getCookies();
	Cookie cookie = cookies[1];
	String user = new String(cookie.getValue());
	System.out.println(user);	
	
	String id = new String(request.getParameter("id"));
	String name = new String(request.getParameter("name"));
	String address = new String(request.getParameter("address"));
	String postalcode = new String(request.getParameter("post_code"));
	String phone = new String(request.getParameter("phone"));
	 
	
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
	
	try{ 
		con = DriverManager.getConnection(connectionUrl+dbName, dbuser, dbpw);
		ps = con.createStatement();
				
		String list = "UPDATE ADDRESS_LIST SET Name = '"+name+"', Address = '"+address+"', post_code = '"+postalcode+"', Phone = '"+phone+"' WHERE ID = '"+id+"'";
		int result = ps.executeUpdate(list);
		
		ps.close();
		con.close();
	
		out.println("<script> document.location.href='addresslist.jsp'; </script>");
		
		} catch (Exception e) {
		e.printStackTrace();
		}
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
