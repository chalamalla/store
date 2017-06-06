<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.store.model.*" %>
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
a:hover{
	
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

<title><%=request.getParameter("name")%></title>
</head>
<body>
<jsp:useBean id="productService" class="com.store.service.ProductService" />

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
			<div class="col-sm-1">
				<a href="#"><i class="fa fa-shopping-cart fa-2x"
					aria-hidden="true"></i></a>
			</div>

			<div class="col-sm-1">
				<a href="#"><i class="fa fa-heart fa-2x" aria-hidden="true"></i></a>
			</div>

			<div class="col-sm-1">
				<a href="#" class="btn btn-primary" role="button">Account</a>
			</div>
		</div>

<div class="row">
<% 
	String productName = request.getParameter("name");
	Product product = productService.getProduct(productName);
	System.out.println(product);
%>
<div class="col-sm-3">
	<img src="../images/<%=product.getName()%>.jpg" style="height:200px;width:200px;">
</div>
<div class="col-sm-4">
	<p style="color:blue;"><b><%= product.getPrice()%></p></b>
	<p style="color:blue;"><b><%= product.getProductDesc()%></p></b>
	<p style="color:blue;"><b><%= product.getCategory().getCategoryName()%></p></b>
</div>
<div class="col-sm-2">
<a href="AddToCart.jsp?productname=<%=product.getName()%>" class="btn btn-primary" role="button">Add to Cart</a>
</div>
<div class="col-sm-2">
<a href="AddToWishlist.jsp?productname=<%=product.getName()%>" class="btn btn-primary" role="button">Add to Wishlist</a>
</div>
</div>	
</div>	
</body>
</html>