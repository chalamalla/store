<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.store.service.LoginService" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AdminLogin</title>
</head>
<body>
	<jsp:useBean id="loginService" class="com.store.service.LoginService" />

<% 
		String uname = request.getParameter("username");
		String pass = request.getParameter("password");

	if(loginService.getAdmin(uname,pass)){
		response.sendRedirect("successAdmin.jsp");
	}
	else{
		response.sendRedirect("../index.html");
	}
%>
</body>
</html>