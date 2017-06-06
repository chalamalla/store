<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.store.service.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AddProduct</title>
</head>
<body>

<jsp:useBean id="productService" class="com.store.service.ProductService" />
<jsp:useBean id="categoryService" class="com.store.service.CategoryService"/>
 
 <% 
 	String pname = request.getParameter("productname");
 	double price = Double.parseDouble(request.getParameter("price"));
 	int quantity  =Integer.parseInt(request.getParameter("quantity"));
 	String cname = request.getParameter("selection");
 	String pdesc = request.getParameter("productDesc");
 	
 	if(productService.addProduct(pname,price,quantity,cname,pdesc) > 0){
 %>		
 	<div class="alert alert-success alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <strong>Success!</strong> Product Successfully Added!!!</div>	
<%
 	}
else{
	%>
 	<div class="alert alert-warning alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <strong>Warning!!!</strong> Couldn't Add the Product!! Try Again!!</div>		
<% } %>

<jsp:include page="UpdateProduct.jsp" />
</body>
</html>