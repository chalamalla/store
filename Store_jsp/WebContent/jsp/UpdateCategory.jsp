<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.store.service.*"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Category</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet">
 <link href="../mystyle.css" rel="stylesheet">
 <link href="../font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
 <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<link href="font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
</head>
<body>
<jsp:useBean id="categoryService" class="com.store.service.CategoryService"/>

	<div class="conatiner">
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
	
	<div class="row">
		<div class="col-sm-10"></div>
		<div class="col-sm-2"><a href="AddCategory.jsp" class="btn btn-primary" role="button">Add Category</a></div>
	</div>
	<table class="table table-hover">
	<thead>
		<tr>
			<th>Category</th>
			<th>CategoryName</th>
			<th>Options</th>
		</tr>
	</thead>
	<tbody>
<% 
	List<Category> list = categoryService.getAll();
	for(int i=0;i<list.size();i++){
	%>
		<tr>
			<td><img src="../images/<%=list.get(i).getCategoryName()%>.jpg" height="100" width="100"></td>
			<td><%=list.get(i).getCategoryName()%></td>
			<td>
				<a href="UpdatingCategory.jsp?name=<%= list.get(i).getCategoryName()%>" name="<%=list.get(i).getCategoryName()%>" class="btn btn_primary" role="button"><i class="fa fa-pencil fa-lg" aria-hidden="true"></i></a>
				<a href="DeleteCatFromDB.jsp?name=<%= list.get(i).getCategoryName()%>" name="<%=list.get(i).getCategoryName()%>" class="btn btn_primary" role="button"><i class="fa fa-trash fa-lg" aria-hidden="true"></i></a>
			</td>
		</tr>			
	<% } %>		
	</tbody>
	</table>
</div>
</body>
</html>