<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.store.service.ProductService"%>
<%@ page import="java.util.*"%>
<%@ page import="com.store.model.Product"%>
<%@ page import="com.store.model.Category"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet">
 <link href="../mystyle.css" rel="stylesheet">
 <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<link href="../font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

<title>Update Product</title>
</head>
<body>

	<div class="row">
		<div class="col-sm-5"></div>
		<div class="col-sm-3">
			<ul class="list-inline">
				<li class="list-inline-item"><img
					src="../images/flying-bird-icon.png" alt="ICON" height="75" width="60"
					style="margin-bottom: -20px;" class="image"></li>
				<li class="list-inline-item"><p
						style="margin-left: -15px; font-size: 12px; color: blue; text-align: left"">
						<b>LOVABLE STORE</b>
					</p></li>
			</ul>
		</div>
	</div>

	<jsp:useBean id="productService"
		class="com.store.service.ProductService" />
	<jsp:useBean id="categoryService"
		class="com.store.service.CategoryService" />
	<div class="container">
	<div class="row"></div>
	<div class="col-sm-10"></div>
	<div class="col-sm-2">
		<a href="AddProduct.jsp" class="btn btn-primary" role="button">Add Product</a>
	</div>
	<div >
		<div class="row">
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
						List<Product> list = productService.allProducts();
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><img src="../images/<%=list.get(i).getName()%>.jpg" height="100" width="100" alt="<%=list.get(i).getName()%>" /></td>
						<td><%=list.get(i).getName()%></td>
						<td><%=list.get(i).getPrice()%>
						<td><%=list.get(i).getQuantity()%> 
						<% 
							Category c = categoryService.getCategory(list.get(i).getCategory().getCategoryId()); 
						%>
						<td><%=c.getCategoryName()%></td>
						<td><%=list.get(i).getProductDesc()%></td>
					<td>
					<a href="Updation.jsp?selection=<%= list.get(i).getName()%>" name="<%=list.get(i).getName()%>" class="btn btn_primary" role="button"><i class="fa fa-pencil fa-lg" aria-hidden="true"></i></a>
					<a href="DeleteProFromDB.jsp?name=<%= list.get(i).getName()%>" name="<%=list.get(i).getName()%>" class="btn btn_primary" role="button"><i class="fa fa-trash fa-lg" aria-hidden="true"></i></a>
					</td>
					</tr>
					<% } %>
				</tbody>
			</table>
 </div>
</div>
</div>
</body>
</html>	