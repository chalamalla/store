<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.store.service.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Product</title>
</head>
<body>
	<jsp:useBean id="cartService" class="com.store.service.CartService" />
	<jsp:useBean id="loginService" class="com.store.service.LoginService" />
	<jsp:useBean id="productService"
		class="com.store.service.ProductService" />

	<% 
	String productName = request.getParameter("productName");	
	if(session.getAttribute("username") == null){
	List<Product> list = (List<Product>)session.getAttribute("productList");
	for(int i=0; i<list.size();i++){
		if(list.get(i).getName().equals(productName)){
			list.remove(i);
		%>
	<div class="alert alert-success alert-dismissable">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
		<strong>Success!</strong> Product Successfully removed!!!
	</div>
	<jsp:include page="DisplayCartContents.jsp" />
	<% }
		else{
	%>
	<div class="alert alert-warning alert-dismissable">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">x</a>
		<strong>Warning!</strong> Product can't be removed!!!
	</div>
	<jsp:include page="DisplayCartContents.jsp" />
	<% }
	}	
	}else{
		int userid = loginService.getUserByName((String)session.getAttribute("username"));
		Product p = productService.getProduct(productName);
		int id = cartService.deleteProductFromList(userid, p.getId());
		System.out.println(id);
		if(id > 0){
			
			System.out.println("In If statement");
		%>
	<div class="alert alert-success alert-dismissable">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">x</a>
		<strong>Success!</strong> Product successfully removed!!!
	</div>
	<jsp:include page="DisplayCartContents.jsp" />
	<% 
		}
		else{
			System.out.println("In else loop");
	%>
	<div class="alert alert-warning alert-dismissable">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">x</a>
		<strong>Warning!</strong> Product can't be removed!!!
	</div>
	<jsp:include page="DisplayCartContents.jsp" />
	<% 
		}
	}
%>
</body>
</html>