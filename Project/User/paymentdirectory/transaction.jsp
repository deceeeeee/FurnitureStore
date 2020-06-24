<%@ page language="java" import="java.sql.*, java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
		<title> Gotz Furniture Store </title>
		<meta charset="utf-8"/>
		<link rel="stylesheet" href="../../CSS/home.css">
		<style>
			
			.userinfo {
				background-color: #fdf9bd;
				padding: 1em;
			}
			
			.userinfo p{
				font-style: italic;
			}
			
			.transaction table {
				text-align: center;
			}
			
			
		</style>
	</head>
	
	<body>
		<div id="content">
			<div id="products">
				<h2> Order Confirmation </h2>
				<div class="userinfo">
				<h3 style='margin-top: 0'>Delivery Information</h3>
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
						
						String userinfo = "SELECT NAME, ADDRESS, POST_CODE, PHONE FROM ACCOUNT WHERE USERNAME = '"+user+"' ";
						
						ResultSet info = ps.executeQuery(userinfo);
						
						while(info.next()){
								
							%>			
														
								<p> Name: <%=info.getString("Name") %></p>
								<p> Phone: <%=info.getString("Phone") %></p>
								<p> Address: <%=info.getString("Address") + ", " + info.getString("post_code")  %></p>
											
							<%
							
						}
						
						info.close();
						
						String displaycart = "SELECT * FROM SHOPPING_CART WHERE USERNAME = '"+user+"' ";
						ResultSet result = ps.executeQuery(displaycart);
						int total = 0;
						
						%>
						<br>
						<form name="updateaddress" action="addresslist.jsp" method="post">
							<button name="edit" value="">Change Address</button>
						</form>
						</div>
						
						<h3>Item List</h3>
						<div class="transaction">
						<table>
						
						<%
						
						while(result.next()){
							int qty = result.getInt("price")*result.getInt("quantity");
							
							System.out.println(qty);
							%>
							
							<tr>	
								<td><img src="../../Pics/<%=result.getString("image") %>" width="100" height="100" alt="no pic"/></td>
								<td><%=result.getString("product_name") %></td>
							</tr>
							
							<tr>
								<td><%=result.getString("price") %> RMB</td>
								<td>x<%=result.getString("quantity") %></td>
							</tr>
							<%
							total = total + qty;
						}
						
						System.out.println(total);
						
						%>
							</table>
							</div>
							<h4>Total: <%=total %> RMB</h4>
							<h3> Payment Method </h3>
							<form name="pay" action="invoice.jsp" method="post">
							
						<%
							
							while(result.next()){
								
								System.out.println(result.getString("product_name"));
								
							}
						
						%>
								
								<input type="radio" name="payment" value="Unionpay" required> <img src="../../Logo/unionlogo.png" alt="Unionpay" width="50" height="36"><br>
								<input type="radio" name="payment" value="Paypal" required> <img src="../../Logo/paypal.png" alt="Paypal" width="50" height="50"><br>
								<input type="radio" name="payment" value="Wechatpay" required> <img src="../../Logo/wechatlogo.png" alt="wechatpay" width="50" height="50"><br>
								<input type="radio" name="payment" value="Alipay" required> <img src="../../Logo/alipay.jpg" alt="alipay" width="35" height="35"><br>
								
								<button style='float: right' name="invoice" value="<%=(int) (1000000000 + Math.random() * 999999999) %>">Confirm Order</button>
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
