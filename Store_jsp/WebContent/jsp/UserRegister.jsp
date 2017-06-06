<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.store.service.*"%>
<%@ page import="com.store.model.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
	<jsp:useBean id="loginService" class="com.store.service.LoginService" />

	<% 
	String name = request.getParameter("name");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	
	User user = new User(name,username,password,email);
	
	int count = loginService.addUser(user);
	
	if(count > 0){
	%>
	<div class="alert alert-success alert-dismissable">
		<a href="#" class="close" data-dismiss="alert" aria-hidden="close">x</a>
		<strong>Success!</strong>Registration Successful!!!
	</div>
	<% 	
	}else{
	%>
	<div class="alert alert-warning alert-dismissable">
		<a href="#" class="close" data-dismiss="alert" aria-hidden="close">x</a>
		<strong>Warning!</strong>Registration not Successful!!! Try Again!
	</div>
	<% 	
	}
%>
<jsp:include page="../login.html" />
</div>
</body>
</html>