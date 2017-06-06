<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AddCategory</title>
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

	<div class="conatiner">
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


		<form action="AddCategoryToDB.jsp" method="POST">
			<table align="center">
				<tr>
					<th>CategoryName</th>
					<td><input type="text" name="categoryName"
						placeholder="Category Name"></td>
				</tr>
			</table>
			<div class="wrapper" style="text-align:center;">
			<button class="btn btn-primary" style="position: absolute;top:13%;right:30%">Add</button>
			</div>
		</form>
	</div>
</body>
</html>