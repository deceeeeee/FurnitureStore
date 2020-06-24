<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<title> Customer Service </title>
		<meta charset="utf-8"/>
		<link rel="stylesheet" href="../CSS/home.css">
		<style>
			
			.grid-container{
				grid-template-columns: auto auto auto auto;
				text-align: center;
				align-content: space-evenly;
			}
			
			.grid-item {
				border: 1px solid brown;
			}
			
			#delivery {
				display: none;
			}
			
			#delivery:target {
				display: block;
			}
			
			#assembly {
				display: none;
			}
			
			#assembly:target {
				display: block;
			}
			
			#order {
				display: none;
			}
			
			#order:target {
				display: block;
			}
			
			#refund {
				display: none;
			}
			
			#refund:target {
				display: block;
			}
			
		</style>
	</head>
	
	<body>
		<div id="intro">
			<h1> Gotz Furniture Store </h1>
			<img src="../Logo/FurnitureLogo1.png" alt="Furniture Logo" width="300" height="179"/>
			<p> We can build anything! </p>
		</div>
		<div id="nav">
			<ul>
				<li> <a href="userhomepage.jsp"> <em>Home</em> </a> </li>
				<li> <a href="useraboutus.jsp"> <em>About Us</em> </a> </li>
				<li> <a href="shoppingcart.jsp"> <em>Shopping Cart</em></a> </li>
				<li> <a href="usercontactus.jsp"> <em>Contact Us</em> </a> </li>
				<li> <a href="usercustomerservice.jsp"> <em>Custom Service</em> </a> </li>
				<li> <a href="invoices.jsp"> <em>Purchase History</em> </a> </li>		
			</ul>
			<form name="searchQuery" action="querypage.jsp" method="post">
				<ol>
					<li> <input type="submit" value="Search"> </li>
					<li> <input type="text" name="querysearch"> </li>
					<li> <img src="../Logo/search.png" alt="search" width="23" height="23"> </li>
				</ol>
			</form>
		</div>
		
		<div id="content">
			<div id="products">
				<h2> Customer Service </h2>
				<div class="grid-container">
					<div class="grid-item">
						<a href="#delivery">
							<img src="../Logo/delivery.png" alt="Delivery" width="100" height="100"/>
						</a>
						<h4> Delivery Service </h4>
					</div>
					<div class="grid-item">
						<a href="#assembly">
							<img src="../Logo/build.png" alt="Craft" width="90" height="90"/>
						</a>
						<h4> Assembly Service </h4>
					</div>
					<div class="grid-item">
						<a href="#order">
							<img src="../Logo/shoppingcart.png" alt="How to buy" width="90" height="90"/>
						</a>
						<h4> How To Order </h4>
					</div>
					<div class="grid-item">
						<a href="#refund">
							<img src="../Logo/refund.png" alt="Refund Regulation" width="100" height="100"/>
						</a>
						<h4> Refund Service </h4>
					</div>
				</div>
				<br>
				<div id="delivery">
					<h3> Delivery Service</h3>
					<p> The procedure of delivery service: </p>
					<ol>
						<li> We offer a flat rate online delivery service to your home or business starting at
							63 yuan for small item shipping and 270 yuan for large item delivery. </li>
							
						<li> Online delivery dates vary depending on your zip code. You will be provided with 
							an estimated delivery date when you are checking out, even before the order is completed. </li>
							
						<li> The delivery company will contact you they day before your scheduled delivery date to provide
							you with four hour time frame. </li>
						
						<li> If a part is missing in the package, you can send us message through email that is
							put on the <a href="usercontactus.jsp">contact us</a> page. </li>
					</ol>
				</div>
				
				<div id="assembly">
					<h3> Assembling Service</h3>
					<p> The procedure of assembling service: </p>
					<ol>
						<li> We offer assembly service if you have a problem with the furniture assembling. Assembly service pricing starts
							at 620 yuan when delivery is purchased and are based on value of merchandise, excluding sales tax. </li>
							
						<li> Assembly is not available for online orders </li>
						
						<li> If there is an issue about your assembly, make sure your receipt and order number are kept well and contact us 
							for help.</li>
					</ol>
				</div>
				
				<div id="order">
					<h3> How to Order</h3>
					<p> The procedure of online order: </p>
					<ol>
						
						<li> Open our website to look for the furniture item you desire. </li>
						
						<li> Put the furniture you choose to the shopping cart. </li>
						
						<li> After all of the items you choose are in the cart, you can proceed to the transaction page. </li>
					
						<li> Place an order with credit card is available. If you use foreign credit card, please contact
							our customer service. </li>
							
					</ol>
				</div>
				
				<div id="refund">
					<h3> Refund Regulation</h3>
					<p> Refund policy: </p>
					<ol>
						
						<li> Your purchase can be returned within 120 days after purchase date. </li>
						
						<li> Refund is available if you have the proof of purchase, photo ID, merchandise, 
							and the card that was used for purchase.  </li>
						
						<li> We are unable to refund or exchange your items if your merchandise is 
							found to be dirty, stained, damaged, or abused. </li>
							
					</ol>
				</div>
				
			</div>
		</div>
		
	</body>

</html>
