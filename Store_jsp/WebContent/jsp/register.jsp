<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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

<script>
	function validate() {
		var flag = true;
		if (document.getElementById("name").value == " ") {
			document.getElementById("productError").style.display = "block";
			flag = false;
		}
		if (document.getElementById("username").value == " ") {
			document.getElementById("usernameError").style.display = "block";
			flag = false;
		}
		if (document.getElementById("password").value == " ") {
			document.getElementById("passwordError").style.display = "block";
			flag = false;
		}
		if (document.getElementById("email").value == " ") {
			document.getElementById("emailError").style.display = "block";
			flag = false;
		}
		return flag;
	}
</script>

</head>
<body>
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
		<div class="row">
			<form action="UserRegister.jsp" method="POST" onsubmit="return(validate());">
				<table class="table">
					<tr>
						<th>Name</th>
						<td><input type="text" name="name" id="name"
							placeholder="name"><span id="nameEror"
							style="display:none;color:red;">Please Enter the Name</span></td>
					</tr>
					<tr>
						<th>UserName</th>
						<td><input type="text" name="username" id="username"
							placeholder="username"><span id="usernameError"
							style="display:none; color:red;">Please Enter the
								username</span></td>
					</tr>
					<tr>
						<th>Password</th>
						<td><input type="text" name="password" id="password"
							placeholder="password"><span id="passwordError"
							style="display:none; color:red;">Please enter the
								password</span></td>
					</tr>
					<tr>
						<th>Email</th>
						<td><input type="text" name="email" id="email"
							placeholder="email"><span id="emailError"
							style="display:none; color:red;">Please Enter the Email
						</span></td>
					</tr>
					<tr><td><button type="submit" >Register</button></td></tr></button>
				</table>
			</form>
		</div>
	</div>
</body>
</html>