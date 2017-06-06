<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@ page import="java.util.*"%>
<%@ page import="com.store.model.Category"%>
<%@ page import="com.store.service.CategoryService"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Product</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../mystyle.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="../font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

<script>
		function validate(){
		var flag = true;
		if(document.getElementById("productname").value == ""){
				document.getElementById("productError").style.display= "block" ;
			flag = false;;
		}
		if(document.getElementById("price").value == ""){
			document.getElementById("priceError").style.display= "block" ;
			flag = false;;
		}
		if(document.getElementById("quantity").value == ""){
			document.getElementById("quantityError").style.display= "block" ;
			flag= false;
		}
		if(document.getElementById("productDesc").value == ""){
			document.getElementById("productDescError").style.display= "block" ;
			flag = false;
		}
		if(document.getElementById("selection").value == ""){
			document.getElementById("categoryError").style.display= "block" ;
		}
		return flag;
		}
		
		function removeError(){
			document.getElementById("productError").style.display= "none" ;		
		} 
		function removepriceError(){
			document.getElementById("priceError").style.display= "none" ;		
		} 	
		function removequantityError(){
			document.getElementById("quantityError").style.display= "none" ;		
		} 	
		function removeselectionError(){
			document.getElementById("categoryError").style.display= "none" ;		
		} 	
		function removeprodDesc(){
			document.getElementById("productDescError").style.display= "none" ;		
		} 	
		
		function checkData(){
			if(!document.getElementById("productname") == ""){
				document.getElementById("check").style.display="block";
			}
		}
</script>
<script>
$(document).ready(function(){
	$("#productname").blur(function(){
		console.log(document.getElementById("productname").value),
		$.ajax({
			url:"FindProduct.jsp?name="+document.getElementById("productname").value,
			success:function(data){
				console.log(data);
				$("#spanElement").html(data);
			}		
		});
	});	
});

</script>

 </head>
<body>
<jsp:useBean id="categoryService" class="com.store.service.CategoryService" />	
		
	<div class="container">
	<div class="row">
	<div class="col-sm-5"></div>
	<div class="col-sm-3">
	<ul class="list-inline"><li class="list-inline-item"><img src="../images/flying-bird-icon.png" alt="ICON" height="75" width="60" style="margin-bottom:-20px;" class="image"></li>
	<li class="list-inline-item"><p style="margin-left:-20px;font-size:12px;color:blue;text-align:left"><b>LOVABLE STORE</b></p></li>
	</ul>
	</div>
	</div>
	
	<div class="row">		
	<form action="AddProductToDB.jsp" method="POST" onsubmit="return(validate());">
		<table align="center">
			<tr> 
			<th>ProductName</th>
			<td id="tableTag"><input type="text" name="productname" id="productname" placeholder="ProductName" style="width:350px;" onfocus="removeError()"><span id="spanElement"></span>
			<span id="productError" style="color:red;display:none;"> Please Enter the Product Name </span><i class="fa fa-check" aria-hidden="true" id="check" style="display:none;"></i></td>
			</tr>
			<tr><th>Price</th>
			<td><input type="text" name="price" id="price" placeholder="Price" style="width:350px;" onfocus="removepriceError()">
			<span id="priceError" style="color:red;display:none;"> Please Enter the Price</span><i class="fa fa-check" aria-hidden="true" ></i></td></tr><br>
			<tr><th>Quantity</th>
			<td><input type="text" name="quantity" id="quantity" placeholder="Quantity" style="width:350px;" onfocus="removequantityError()">
			<span id="quantityError" style="color:red;display:none;"> Please Enter the Quantity</span><i class="fa fa-check" aria-hidden="true"></i></td></tr><br>
			<tr><th>Category</th>
			<td>
				<select style="width:350px;" name="selection" id="selection" onfocus="removeselectionError()">
			<%	
				List<Category> list = categoryService.getAll();
				for(int i=0;i<list.size();i++){
			%>
				<option value=<%= list.get(i).getCategoryName()%>><%= list.get(i).getCategoryName()%></option>
			<% } %>
			</select>
			<span id="categoryError" style="color:red;display:none;"> Please Enter the Category</span>
			</td>
			</tr><br>
			<tr><th>Product Description</th>
			<td>
			<textarea rows="8" cols="47" name="productDesc" id="productDesc" onfocus="removeprodDesc()"></textarea>
			<span id="productDescError" style="color:red;display:none;"> Please Enter the Product Desc</span><i class="fa fa-check" aria-hidden="true"></i></td></tr>
			<tr><td><button type="submit" id="addProduct">Submit</button></td></tr>
		</table>
	</form>
	</div>
	<div class="row"> 
		<a href="successAdmin.jsp" class="btn btn-primary" role="button">Back</a>
	</div>
	</div>
</body>
</html>