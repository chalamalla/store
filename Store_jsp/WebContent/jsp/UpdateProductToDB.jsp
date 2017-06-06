<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.store.service.ProductService" %>
<%@ page import="com.store.model.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="productService" class="com.store.service.ProductService"/>
<% 
	String pname = request.getParameter("productName");
	Double price = Double.parseDouble(request.getParameter("price"));
	int quantity = Integer.parseInt(request.getParameter("quantity"));
	
	String cname = request.getParameter("selection");
	
	String pdesc = request.getParameter("productDesc");
	
	Product product = productService.getProduct(pname);
	
	int count = productService.updateProduct(pname, price, quantity, cname, pdesc);
	if(count > 0){	
	%> 
	<div class="alert alert-success alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <strong>Success!</strong> Product Successfully Updated!!!</div>	
	<% } 
	else{	
	%>
	<div class="alert alert-warning alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <strong>Warning!</strong> Couldn't Update Product!!! Try Again!!!</div>				
	<% } %>
	<jsp:include page="UpdateProduct.jsp" />
</body>
</html>