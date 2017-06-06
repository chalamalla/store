<%@ page import="com.store.service.*"%>
	<jsp:useBean id="productService"
		class="com.store.service.ProductService" />

	<% 
	String productName = request.getParameter("name");
	if(productService.isProductExists(productName)){
%>
	<span style="color:red;">Product Already exists</span>
	<%
	}
	else
	{
	%>
	<span></span>
	<% }
%>
