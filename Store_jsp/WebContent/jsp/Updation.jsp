<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.store.service.ProductService"%>
<%@ page import="com.store.service.CategoryService"%>
<%@ page import="com.store.model.Product"%>
<%@ page import="com.store.model.Category"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
 -->
 <link href="../mystyle.css" rel="stylesheet">
 <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<link href="font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="productService"
		class="com.store.service.ProductService" />
	<jsp:useBean id="categoryService"
		class="com.store.service.CategoryService" />

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
	
	<form action="UpdateProductToDB.jsp" method="POST" >
	<table class="table">
		<thead>
			<tr>
				<th>Product</th>
				<th>Product Name</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Category</th>
				<th>Product Description</th>
			</tr>
		</thead>
		<tbody>
			<% 

	String selection = request.getParameter("selection");
			System.out.println(selection);
			
    List<Product> list = productService.allProducts();
	for(int i=0;i<list.size();i++){
		if(list.get(i).getName().equals(selection)){
			
	%>
			<tr>
				<td><img src="../images/<%=list.get(i).getName()%>.jpg"
					height="100" width="100" alt="<%=list.get(i).getName()%>" /></td>
				<td><input type="text" value="<%=list.get(i).getName()%>"
					name="productName"></td>
				<td><input type="text" value="<%=list.get(i).getPrice()%>"
					name="price"></td>
				<td><input type="text" value="<%=list.get(i).getQuantity()%>"
					name="quantity"></td>
				<% 
					Category c = categoryService.getCategory(list.get(i).getCategory().getCategoryId()); 
				%>
				<td><select style="width: 350px;" name="selection">
				<%	
				List<Category> clist = categoryService.getAll();
				for(int j=0;j<clist.size();j++){
				%>
				<option value="<%=clist.get(j).getCategoryName()%>"			
				<% 					
					if(list.get(i).getCategory().getCategoryName().equals(clist.get(j).getCategoryName())){
					System.out.println(list.get(i).getCategory().getCategoryName());
				%>		
				selected
				<% 	
				}
				%>
				><%= clist.get(j).getCategoryName()%></option>
				<% } %>
				</select>
				</td>
				<td>
				<textarea rows="5" cols="20" name="productDesc"><%=list.get(i).getProductDesc()%></textarea>
 				</tr>
		<% } 
	} %>
	</table>
	<button class="btn btn-primary">Update</button>
</form>
</body>
</html>