<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.store.service.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="categoryService" class="com.store.service.CategoryService" />

<% 
	String categoryName = request.getParameter("categoryName");
	
	if(categoryService.addcategory(categoryName)>0){
	%>		
	<div class="alert alert-success alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">�</a>
    <strong>Success!</strong> Category Successfully Added!!!</div>	
<% 
	}
	else{			
%>	
	<div class="alert alert-warning alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">�</a>
    <strong>Warning!</strong> Couldn't add the category!!Try Again!!</div>	
<% } %>	
<jsp:include page="UpdateCategory.jsp" />
</body>
</html>