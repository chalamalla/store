<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.store.service.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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

<title>Cart</title>
</head>
<body>
	<jsp:useBean id="productService"
		class="com.store.service.ProductService" />
	<jsp:useBean id="loginService" class="com.store.service.LoginService" />
	<jsp:useBean id="wishlistService" class="com.store.service.WishListService" />

	<%
		String productName = request.getParameter("productname");
		Product product = productService.getProduct(productName);

		List<Product> plist = (List<Product>) session.getAttribute("wishList");
		int userid = loginService.getUserByName((String)session.getAttribute("username"));
		if (!(session.getAttribute("username") == null)) {
			if (plist == null) {
				plist = new ArrayList<Product>();
				plist.add(product);
				wishlistService.addProductList(userid, product.getId());
	%>
	<div class="alert alert-success alert-dismissable">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
		<strong>Success!</strong> Product Successfully Added to wishlist!!!
	</div>
	<jsp:include page="Success.jsp" />
	<%
			session.setAttribute("wishList", plist);
			} else {
				plist.add(product);
				wishlistService.addProductList(userid, product.getId());
	%>
	<div class="alert alert-success alert-dismissable">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
		<strong>Success!</strong> Product Successfully Added to wishlist!!!
	</div>
	<jsp:include page="Success.jsp" />
	<%
		}
		} else {
	%>
	<div class="alert alert-warning alert-dismissable">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
		<strong>Warning!</strong> SignIn required to add the product to
		wishlist!!!
	</div>
	<jsp:include page="FrontPage.jsp" />
	<%
		}
		/* 		String username = (String) session.getAttribute("username");
				System.out.println(username);
				int userid = loginService.getUserByName(username);
		 */
	%>
</body>
</html>