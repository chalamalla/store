<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.store.service.*"%>
<%@ page import="com.store.model.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="wishlistService"
		class="com.store.service.WishListService" />
	<jsp:useBean id="loginService" class="com.store.service.LoginService" />
	<jsp:useBean id="productService"
		class="com.store.service.ProductService" />

	<% 
	String productName = request.getParameter("productName");
	Product p = productService.getProduct(productName);
	int userid = loginService.getUserByName((String)session.getAttribute("username"));
	int count = wishlistService.deleteProductFromList(userid, p.getId());
	
	if(count > 0){
	%>
	<div class="alert alert-success alert-dismissable">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
		<strong>Success!</strong> Product Successfully Deleted from
		wishlist!!!
	</div>
	<% 	
	}else{
	%>
	<div class="alert alert-warning alert-dismissable">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
		<strong>Success!</strong> Product can't be deleted from wishlist!!!
	</div>
	<% 	
	}
%>
<jsp:include page="DisplayWishlistContents.jsp" />
</body>
</html>