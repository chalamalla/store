<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="com.store.service.*"%>
 <%@ page import="java.util.*"%> 
 <%@ page import="com.store.model.*"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AdminPage</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../mystyle.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="../script.js"></script>

  
<!--  <script>
 $(document).onready(function(){
	$("#btn_category").click(function(){
		$.ajax({
			url:"DisplayCategories.jsp"
		})
	});
	$("#btn_product").click(function(){
		$.ajax({
			url:"UpdateProduct.jsp"
		})
	});
 });
 </script>
 -->
 </head>
<body>

<jsp:useBean id="CategoryService" class="com.store.service.CategoryService" />
			
	<div class="container">
	<div class="row">
	<div class="col-sm-5"></div>
	<div class="col-sm-3">
	<ul class="list-inline"><li class="list-inline-item"><img src="../images/flying-bird-icon.png" alt="ICON" height="75" width="60" style="margin-bottom:-20px;" class="image"></li>
	<li class="list-inline-item"><p style="margin-left:-20px;font-size:12px;color:blue;text-align:left"><b>LOVABLE STORE</b></p></li>
	</ul>
	</div>
	</div>
		<div class="row">
			<div class="col-sm-5"></div>
			<div class="col-sm-4">
	<!-- 		<button class="btn btn-primary" id="btn_category">Category</button>
			<button class="btn btn-primary" id="btn_product">Product</button>
	 -->		
	 		<a href="UpdateCategory.jsp" class="btn btn-primary" role="button">Category</a>
			<a href="UpdateProduct.jsp" class="btn btn-primary" role="button">Product</a>	 		
	 	</div>
		</div>
		
	<!-- 	<br><br><br>
		
		<div class="row" id="product">
		<div class="col-sm-3"></div>
		<div class=" col-sm-8 ">
				<a href="AddProduct.jsp" class="btn btn-primary" role="button">Add Product</a>
				<a href="UpdateProduct.jsp" class="btn btn-primary" role="button">Update Product</a>
				<a href="GetProduct.jsp" class="btn btn-primary" role="button">Get Product</a>
				<a href="GetProducts.jsp" class="btn btn-primary" role="button">Get All Products</a>
				<a href="DeleteProduct.jsp" class="btn btn-primary" role="button">Delete Product</a>							
		</div>
		</div>
		
		<br><br><br>
		
		<div class="row" id="category">
		<div class="col-sm-3"></div>
		<div class=" col-sm-8 ">
				<a href=" " class="btn btn-primary" role="button">Add Category</a>
				<a href=" " class="btn btn-primary" role="button">Update Category</a>
				<a href=" " class="btn btn-primary" role="button">Get Category</a>
				<a href=" " class="btn btn-primary" role="button">Get All Categories</a>
				<a href=" " class="btn btn-primary" role="button">Delete Category</a>							
		</div>
		</div>	
 -->	
  </div>	
 </body>
</html>