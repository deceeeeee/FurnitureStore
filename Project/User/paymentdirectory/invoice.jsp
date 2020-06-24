<%@ page language="java" import="java.sql.*, java.util.*, java.util.Date, java.text.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
		<title> Gotz Furniture Store </title>
		<meta charset="utf-8"/>
		<link rel="stylesheet" href="../../CSS/home.css">
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
			
			.right img {
				padding-left: 4em;
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
							
							String paymethod = new String(request.getParameter("payment"));
							String invoiceno = new String(request.getParameter("invoice"));
							
							SimpleDateFormat dt = new SimpleDateFormat("dd-MM-yyyy");
							SimpleDateFormat tm = new SimpleDateFormat("HH:mm:ss");
							Date date = new Date();
							//Date time = new Date();
							String dates = new String(dt.format(date));
							String times = new String(tm.format(date));
							System.out.println(dates);
							System.out.println(times);
							
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
											<li> <%=info.getString("Name") %> </li>
											<li> <%=info.getString("Address") %>, <%=info.getInt("post_code") %> </li>
											<li><br></li>
											<li> Phone: <%=info.getString("phone") %></li>
											<li><br><br></li>
									<%
									
								}
								
								
								%>
											<li><h4>Gotz Furniture Store</h4></li>
										</ul>
									</div>
									<!-- Right Side -->
									<div class="right">
										<img src="../../Logo/FurnitureLogo1.png" alt="LOGO" width="135" height="105">
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
								String displaycart = "SELECT PRODUCT_ID, PRODUCT_NAME, PRICE, QUANTITY FROM SHOPPING_CART WHERE USERNAME = '"+user+"' ";
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
												<td> <%=qty %></td>
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
										
										<%
												
											String transaction = "INSERT INTO TRANSACTION_LOG(INVOICE_NO, PRODUCT_ID, QUANTITY) SELECT '"+invoiceno+"' AS INVOICE_NO, PRODUCT_ID, QUANTITY FROM SHOPPING_CART WHERE USERNAME = '"+user+"'";
											int trans = ps.executeUpdate(transaction);
											System.out.println(trans);
											
											
											String saveinvoice = "INSERT INTO RECEIPT_LIST(INVOICE_NO, USERNAME, NAME, ADDRESS, POST_CODE, PHONE, ITEM_AMOUNT, PAYMENT_DATE, PAYMENT_TIME, PAYMENT_METHOD, PROGRESS) SELECT '"+invoiceno+"' AS INVOICE_NO, USERNAME, NAME, ADDRESS, POST_CODE, PHONE, '"+counter+"' AS ITEM_AMOUNT, '"+dates+"' AS PAYMENT_DATE, '"+times+"' AS PAYMENT_TIME,'"+paymethod+"' AS PAYMENT_METHOD, 'Pending' AS PROGRESS FROM ACCOUNT WHERE USERNAME = '"+user+"';";													
											int save = ps.executeUpdate(saveinvoice);
											
											
											String dropcart = "DELETE FROM SHOPPING_CART WHERE USERNAME = '"+user+"'";
											int drop = ps.executeUpdate(dropcart);
											System.out.println(drop);
											
											result.close();
											ps.close();
											con.close();
									
											
											} catch (Exception e) {
												e.printStackTrace();
											}
										%>
					<br>
					<br>
					<br>	
					
					<div class="buttons">	
	
						<button onclick="window.print()">Print Invoice</button>
						<br>
						<br>
						<form name="backbutton" action="../userhomepage.jsp" method="post">
							<button name="next" value="done">Continue Shopping</button>
						</form>
					</div>
				</div>
			</div>
		</body>
	</html>
