<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.store.model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.store.service.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.center_div {
	align: center;
}

h1 {
	text-align: center;
}

body {
	background-image: url(../images/background.jpg);
}

a:hover {
	
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Welcome Page</title>
<link href="../font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

</head>

<body>
<jsp:useBean id="cartService" class="com.store.service.CartService" />
<jsp:useBean id="loginService" class="com.store.service.LoginService" />

	<div class="container">
		<div class="row">
			<div class="col-sm-5">
				<h5 style="color: blue;">
					Welcome!
					<%=session.getAttribute("username")%></h5>
			</div>
			<div class="col-sm-3">
				<ul class="list-inline">
					<li class="list-inline-item"><img
						src="../images/flying-bird-icon.png" alt="ICON" height="75"
						width="60" style="margin-bottom: -20px;" class="image"></li>
					<li class="list-inline-item"><p
							style="margin-left: -15px; font-size: 12px; color: blue; text-align: left"">
							<b>LOVABLE STORE</b>
						</p></li>
				</ul>
			</div>
		</div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Product</th>
					<th>Product Name</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Category</th>
					<th>Product Description</th>
					<th>Options</th>
				</tr>
			</thead>
			<tbody>
				<% 
					double count=0;
					if(session.getAttribute("username") == null){
					List<Product> list = (List<Product>)session.getAttribute("productList");
					for(int i=0;i<list.size();i++){
						count = count+list.get(i).getPrice();
				%>
				<tr>
					<td><img src="../images/<%=list.get(i).getName()%>.jpg" style="height:150px;width:150px;" alt="<%=list.get(i).getName()%>"></td>
					<td><%=list.get(i).getName() %></td>
					<td><%=list.get(i).getPrice() %></td>
					<td><%=list.get(i).getQuantity() %></td>
					<td><%=list.get(i).getCategory().getCategoryName()%></td>
					<td><%=list.get(i).getProductDesc() %></td>
					<td><a href="DeleteFromCart.jsp?productName=<%=list.get(i).getName()%>" class="btn btn-primary" role="button">Remove</a></td>
				</tr>
			<% 
					}
				}else{
					String username = (String)session.getAttribute("username");
					int userid = loginService.getUserByName(username);
					List<Product> plist = cartService.getProductList(userid);
					for(int i=0;i<plist.size();i++){
						count = count+plist.get(i).getPrice();
				%>
				<tr>
					<td><img src="../images/<%=plist.get(i).getName()%>.jpg" style="height:150px;width:150px;" alt="<%=plist.get(i).getName()%>"></td>
					<td><%=plist.get(i).getName() %></td>
					<td><%=plist.get(i).getPrice() %></td>
					<td><%=plist.get(i).getQuantity() %></td>
					<td><%=plist.get(i).getCategory().getCategoryName()%></td>
					<td><%=plist.get(i).getProductDesc() %></td>
					<td><a href="DeleteFromCart.jsp?productName=<%=plist.get(i).getName()%>" class="btn btn-primary" role="button">Remove</a></td>
				</tr>
			<% 
				}
				}
			%>	
			<tr><td>Total Price <b><%=count%></b></td></tr>
			<tr><td><a href="#" class="btn btn-primary" role="button">Pay</a></td></tr>		
			</tbody>
		</table>
	</div>
</body>
</html>