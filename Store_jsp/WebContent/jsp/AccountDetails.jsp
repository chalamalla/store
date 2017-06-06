<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
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

a:hover {
	
}
</style>
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
</head>
<body>
	<jsp:useBean id="categoryService"
		class="com.store.service.CategoryService" />
	<jsp:useBean id="productService"
		class="com.store.service.ProductService" />
	<div class="container">
	<div class="row">
	<div class="col-sm-5"></div>
		<div class="col-sm-3">
			<ul class="list-inline">
				<li class="list-inline-item"><img
					src="../images/flying-bird-icon.png" alt="ICON" height="75"
					width="60" style="margin-bottom: -20px;" class="image"></li>
				<li class="list-inline-item"><p
						style="margin-left: -15px; font-size: 12px; color: blue; text-align: left"">
						<b>LOVABLE STORE</b>
					</p></li>
			</ul>
		</div>
	</div>
	</div>
	<div class="row">
	</div>
</body>
</html>