<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.store.service.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Product</title>
</head>
<body>
	<jsp:useBean id="cartService" class="com.store.service.CartService" />
	<jsp:useBean id="productService"
		class="com.store.service.ProductService" />
	<jsp:useBean id="loginService" class="com.store.service.LoginService" />

	<% 
	String productName = request.getParameter("productName");
	if(session.getAttribute("username") == null){
		List<Product> list = (List<Product>)session.getAttribute("productList");
		
		%>
		
	<% 
	}
	
	else{
		
	}
	%>
</body>
</html>