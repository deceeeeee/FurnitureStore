<%@ page language="java" import="java.util.*,java.sql.*,java.io.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Gotz Furniture Store</title>
		<link rel="stylesheet" href="../CSS/home.css">
		<script src="sign_up.js">
		</script>
	</head>
	<body>
				
		<% 
				try{
					String dbuser="root";
					String dbpw="";
					
					String dbName="furnituredb";
					
					System.out.print(dbName);
					
					String classname = "com.mysql.jdbc.Driver";
					String server = "jdbc:mysql://localhost/"+dbName +"?useUnicode=true&characterEncoding=utf8";
					
					Class.forName(classname);
					Connection con = DriverManager.getConnection(server, dbuser, dbpw);
					Statement ps = con.createStatement();
					System.out.print("Connected");
					
				
					String Uname = new String(request.getParameter("username"));
					String Pw = new String(request.getParameter("password"));
					if(Uname.equals("")|Pw.equals("")){
						%>
						<h1> Login error </h1>
						<%
					}
				
				    String sql="SELECT account_type, Username, Password FROM account WHERE Username = '"+ Uname + "' ";
				    ResultSet result = ps.executeQuery(sql);
				    
				    if(result.next())
				    {
				  
				    	String acctype = result.getString("account_type");
				    	
				    	if(Pw.equals(result.getString("password"))) {
				    	   
				    		session.setAttribute("username", Uname );
							session.setAttribute("usertype", acctype); 	
							  
						  	Cookie user = new Cookie("username", Uname);
							user.setPath("/");
							
							response.addCookie(user);
				    		
				    	   if(acctype.equals("administrator"))
				    	   {
				    		   
				    		   %>
									<script>
										document.location.href='../Admin/adminhomepage.jsp';
									</script>
									<%
				    		   
				    	   }
				    	   else
				    	   {
				    		   
				    		   if(acctype.equals("customer")){
				    			   
				    			   %>
									<script>
										document.location.href='../User/userhomepage.jsp';
									</script>
									<%
				    			   
				    		   } else if(acctype.equals("seller")){
				    			   
				    			   %>
									<script>
										document.location.href='../Vendor/sellerhomepage.jsp';
									</script>
									<%
				    			   
				    		   }
				
				    	   }
   
				       
					  }else {
						  %>
							<h1> Login error </h1>
							<%
						  }
				    }
					result.close();
					ps.close();
					con.close();
				}catch(Exception e){ e.printStackTrace();} 
				%>
	</body>
</html>
