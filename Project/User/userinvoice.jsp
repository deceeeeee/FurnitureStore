<%@ page language="java" import="java.sql.*, java.util.*, java.util.Date, java.text.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	
	String sessionuser = (String)session.getAttribute("usertype");	
	
	if(session.getAttribute("username") == null || !sessionuser.equals("customer")){
		
		response.sendRedirect("../Database/login.jsp");
		session.setAttribute("usertype", null);
		
	}
	
%>
<html>

	<head>
		<title> Gotz Furniture Store </title>
		<meta charset="utf-8"/>
		<link rel="stylesheet" href="../CSS/home.css">
		<style>
		
			.upper {
				overflow: hidden;
				width: 100%;
			}
			.left {
				float: left;
				font-weight: normal;
				width: 42%;
			}
			
			.left ul {
				list-style-type: none;
			}
			
			.right {
				float: right;
				font-weight: normal;
				width: 42%;
			}
			
			th{
				background-color:#FDF9BD;
				border: 1px solid white;
			}
			
			.invoicetable table{
				width: 100%;
			}
			
			.invoicetable table td{
				text-align: center;
			}
			
			.buttons {
				float: right;
			}
			
			@media print {
				.buttons {
					display: none;
				}
			}
			
		</style>
	</head>
	
	<body>
		<div id="content">
			<div id="products">
				<h2 align="center"> Invoice </h2>
					<div class="upper">
					<!-- Left Side -->
						<div class="left">
						<ul>
						<%
							Cookie[] cookies = request.getCookies();
							Cookie cookie = cookies[1];
							String user = new String(cookie.getValue());
							System.out.println(user);	
							
							String invoiceno = new String(request.getParameter("invoiceno"));
							
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
								
								String userinfo = "SELECT * FROM RECEIPT_LIST WHERE INVOICE_NO = '"+invoiceno+"' ";
								ArrayList<String> temp = new ArrayList<String>();
								String progress = new String();
								
								ResultSet info = ps.executeQuery(userinfo);
								
								while(info.next()){
										
									%>
											<li> <%=info.getString("Name") %> </li>
											<li> <%=info.getString("Address") %>, <%=info.getInt("post_code") %> </li>
											<li><br></li>
											<li> Phone: <%=info.getString("phone") %></li>
											<li><br><br></li>
									<%
									
									temp.add(info.getString("payment_date"));
									temp.add(info.getString("payment_method"));
									progress = info.getString("progress");
									
								}
								
								String[] temparr = new String[temp.size()];
								temparr = temp.toArray(temparr);
								
								String dates = new String(temparr[0]);
								String paymethod = new String(temparr[1]);
								
								
								%>
											<li><h4>Gotz Furniture Store</h4></li>
										</ul>
									</div>
									<!-- Right Side -->
									<div class="right">
										<center>
											<img src="../Logo/FurnitureLogo1.png" alt="LOGO" width="135" height="105">
										</center>
										<br><br>
										<br><br>
										<table>
											<tr>
												<th> Invoice No. </th>
												<td> <%=invoiceno %> </td>
											</tr>
											<tr>
												<th> Date </th>
												<td> <%=dates %> </td>
											</tr>
											<tr>
												<th> Payment Method </th>
												<td> <%=paymethod %> </td>
											</tr>
										</table>
									</div>
								</div>
								<br><br><br>
							<%
								String displaycart = "SELECT transaction_log.product_id, furniture_products.product_name, furniture_products.price, transaction_log.quantity FROM furniture_products INNER JOIN transaction_log ON furniture_products.product_id = transaction_log.product_id WHERE Invoice_no = '"+invoiceno+"'";
								ResultSet result = ps.executeQuery(displaycart);
								int total = 0;
								int counter = 0;
								
							%>
								
								<!-- Item Table in the Invoice -->
										<div class="invoicetable">
										<table>
											<tr>
												<th> Item </th>
												<th> Unit Cost </th>
												<th> Quantity </th>
												<th> Price </th>
											</tr>
								
								<%
								
								while(result.next()){
									int price = result.getInt("price")*result.getInt("quantity");
									String prodname = new String(result.getString("product_name"));
									String cost = new String(result.getString("price"));
									String qty = new String(result.getString("quantity"));
									
									
									%>
											<tr>
												<td> <%=prodname %> </td>
												<td> <%=cost %> </td>	
												<td> <%=qty %> </td>
												<td> <%=price %> </td>
											</tr>
											
									<%
									
									
									counter++;
									
									total = total + price;

								}
					
										%>
										</table>
										</div>
										<br>
										<br>
										<br>
										<table style='float: right; width: 45%;border:1px solid #8F4230;overflow: hidden'>
											<tr>
												<td></td>
												<td></td>
												<td> Total </td>
												<td> <%=total %> </td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td> Delivery Fee </td>
												<td> <%=total * 0.01 %> </td>
											</tr>
										</table>
										
										<br>
										<br>
										<br>	
										
										<div class="buttons">	
						
											<button onclick="window.print()">Print Invoice</button>
										<%
										
											if(progress.equals("Delivered")){
										
										%>
											<form name="received" action="received.jsp" method="post">
												<button name="invoiceno" value="<%=invoiceno %>">Receive</button>
											</form>
										<%
										
										}
										
										%>
											<form name="backbutton" action="invoices.jsp" method="post">
												<button name="next" value="done">Go back</button>
											</form>
											
										</div>
										
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
