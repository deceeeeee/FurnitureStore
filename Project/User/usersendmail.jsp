<%@ page language="java" import="java.sql.*, java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	
	String suggest = new String(request.getParameter("suggest"));
	String user = (String)session.getAttribute("username");
	
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
	
	String getmail = "SELECT EMAIL FROM ACCOUNT WHERE USERNAME = '"+user+"' ";
	ResultSet result = ps.executeQuery(getmail);
	String[] container = new String[2];
	String mail = container[0];
	
	while(result.next()){
		
		mail = result.getString("email");
		
	}
	
	String sql ="INSERT INTO SUGGESTION_BOX(EMAIL, SUGGESTION) VALUES('"+mail+"', '"+suggest+"')";
	
	int suggest_box = ps.executeUpdate(sql);
	System.out.println(suggest_box);
	
	
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		
		if(suggest_box > 0){
				
			response.sendRedirect("usercontactus.jsp");
				
		} else{
			
			%>
			
				<h1> INPUT ERROR </h1>
			
			<%
			
		}
	
		ps.close();
		con.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		
	%>
</body>
</html>
