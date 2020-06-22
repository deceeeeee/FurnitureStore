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
				System.out.println("Connected");
				
				
				
				
				String Username = new String(request.getParameter("username"));
				String Password = new String(request.getParameter("password"));
				String confirm_password = new String(request.getParameter("confirmpassword"));
				String name = new String(request.getParameter("realname"));
				String country = new String(request.getParameter("country"));
				String address = new String(request.getParameter("address"));
				String postalcode = new String(request.getParameter("postalcode"));
				String Mobilephone = new String(request.getParameter("phone"));
				String Birthday = new String(request.getParameter("birthday"));
				String CompName = new String(request.getParameter("compname"));
				String Email = new String(request.getParameter("email"));
				String Pref = new String(request.getParameter("preference"));
				String Acctype = new String(request.getParameter("account"));
				
				System.out.println(Acctype);
				
				if(Username.equals("")|Password.equals("")|confirm_password.equals("")|Email.equals("")){
					response.sendRedirect("sign_up.jsp");
				}
				else {
				 
					 if(confirm_password.equals(Password)) 
					{
						 session.setAttribute("username",Username);
						 session.setAttribute("password",Password);
						 String sql="insert into Account(account_type, profpics, Username, Password, Name, Country, Address, post_code, Phone,Email,Birthday,Preference,Company) values('"+Acctype+"','default-profile.png','"+Username+"','"+Password+"', '"+name+"', '"+country+"', '"+address+"', '"+postalcode+"', '"+Mobilephone+"','"+Email+"','"+Birthday+"','"+Pref+"','"+CompName+"')";
						 ps.executeUpdate(sql);
						 if(Acctype == "customer"){
							 
							 String sqladdress="insert into address_list(Username, Name, Address, post_code, Phone) select Username, Name, Address, post_code, Phone from Account where Username = '"+Username+"'";
							 System.out.print(sqladdress);
							 ps.executeUpdate(sqladdress);
							 	 
							 
						 }
						 
						 ps.close();
						 %>
						 <h1> Registration Succeed</h1>
						 <p> <a href="login.jsp"> Login Page </a> </p>
						 <%
					}
					else {%>
					<h1>Registration failed</h1> 
					<%}
			 } 
			}
			catch(Exception e){ e.printStackTrace();}
		%>
	</body>
</html>