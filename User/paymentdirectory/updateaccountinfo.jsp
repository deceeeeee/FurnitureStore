<%@ page language="java" import = "java.sql.*, java.io.*, java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<% 
	Cookie[] cookies = request.getCookies();
	Cookie cookie = cookies[1];
	String user = new String(cookie.getValue());
	
	String id = new String(request.getParameter("id"));
	
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
		
		String picklist = "SELECT * FROM ADDRESS_LIST WHERE ID = '"+id+"'";
		ResultSet pick = ps.executeQuery(picklist);
		System.out.println(user);	
		
		while(pick.next()){
			
			String list = "UPDATE ACCOUNT SET Name = '"+pick.getString("Name")+"', Address = '"+pick.getString("Address")+"', post_code = '"+pick.getString("post_code")+"', Phone = '"+pick.getString("Phone")+"' WHERE USERNAME = '"+user+"'";
			System.out.println("Syntax has been built");
			int result = ps.executeUpdate(list);
			out.println("<script> document.location.href='transaction.jsp'; </script>");
			
		}
		
		pick.close();
		ps.close();
		con.close();
	
		
		
		} catch (Exception e) {
		e.printStackTrace();
		}
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Connection Error</title>
</head>
<body>

</body>
</html>