<%@ page language="java" import="java.sql.*, java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
		<title> Gotz Furniture Store </title>
		<meta charset="utf-8"/>
		<link rel="stylesheet" href="../../CSS/home.css">
		<style>
			
			.userinfo ul {
				list-style-type: none;
				font-style: italic;
			}
			.userinfo ul li {
				background-color: #fdf9bd;
				padding: 1em;
			}
			
		</style>
	</head>
	
	<body>
		<div id="content">
			<div id="products">
				<div class="userinfo">
				<h3 style='margin-top: 0'>Address List</h3>
				<table>
			<%
					Cookie[] cookies = request.getCookies();
					Cookie cookie = cookies[1];
					String user = new String(cookie.getValue());
					System.out.println(user);	
			
					
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
								
						String address = "SELECT * FROM ADDRESS_LIST WHERE USERNAME = '"+user+"' ";
						ResultSet result = ps.executeQuery(address);
						
						while(result.next()){
							
							%>
								<tr>
									<td>
										<p><a href="updateaccountinfo.jsp?id=<%=result.getString("id")%>">Choose this address</a></p>
										<p><a href="updateinfo.jsp?id=<%=result.getString("id")%>">Change address</a>
									</td>
									<td>
										<ul>
											<li> Name: <%=result.getString("name") %> </li>
											<li> Address: <%=result.getString("address") %>, <%=result.getString("post_code") %> </li>
											<li> Phone: <%=result.getString("phone") %> </li>
										</ul>
									</td>
								</tr>
							<%
							
						}
						
						%>
							</table>
							
							<form name="addbutton" action="addinfo.jsp" method="post">
								<button name="submit" value="">Add address</button>
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
		</div>
	</body>

</html>