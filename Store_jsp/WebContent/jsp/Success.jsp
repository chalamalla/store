<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.store.service.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.store.model.*"%>

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
	<jsp:useBean id="categoryService"
		class="com.store.service.CategoryService" />
	<jsp:useBean id="productService"
		class="com.store.service.ProductService" />
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
				<a href="DisplayCartContents.jsp"><i class="fa fa-shopping-cart fa-2x"
					aria-hidden="true"></i></a>
			</div>

			<div class="col-sm-1">
				<a href="DisplayWishlistContents.jsp"><i class="fa fa-heart fa-2x" aria-hidden="true"></i></a>
			</div>

			<div class="col-sm-1">
				<a href="AccountDetails.jsp" class="btn btn-primary" role="button">Account</a>
			</div>
		</div>

		<div class="row" style="margin: 20px;position:relative;">
			<div class="col-sm-3">
				<ul style="list-style: none;">
					<li style="padding: 10px; color: blue;"><b>List of
							Categories</b></li>
					<%
						List<Category> list = categoryService.getAll();
						for (int i = 0; i < list.size(); i++) {
					%>
					<li style="padding: 10px;"><a href="#"
						style="color: blue; text-decoration: none;"><%=list.get(i).getCategoryName()%></a></li>
					<%
						}
					%>
				</ul>
			</div>

			<div class="col-sm-8">
				<div class="input-group">
					<input type="text" class="form-control" /> <span
						class="input-group-addon"> <i class="fa fa-search"></i>
					</span>
				</div>
				<ul  class="list-inline" style="list-style: none; padding:10px;">
				<%
					List<Product> plist = productService.allProducts();
					for (Product p : plist) {
				%>
				<li><a style="text-decoration:none;" href="DisplayProduct.jsp?name=<%=p.getName()%>"><img src="../images/<%=p.getName()%>.jpg"
					alt="<%=p.getName()%>" style="height:150px;width:150px;"></img>
				<p style="text-align:center;"><b><%=p.getPrice()%></b></p></a></li>
				<%
					}
				%>
				</ul>
			</div>
		</div>

		<div class="row" style="position:absolute;">
			<div class="col-sm-6">
 			</div>
		</div>
	</div>
</body>
</html>