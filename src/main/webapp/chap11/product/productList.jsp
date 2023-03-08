<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="product" class="chap10.Product" scope="session"></jsp:useBean>

<%
	String [] productList = product.getProductList();
	String result = "";
	
	for(String prod : productList){
		result += "<option>" + prod + "</option>";
	}

%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>productList.jsp</title>
</head>

<body>
	<h2>EL Test</h2>
	<hr>
	
	<form action="productSel.jsp" method="POST">
		<fieldset>
			<select name = sel>
				<c:forEach items="${product.productList}" var="item">
					<option>${item}</option>
				</c:forEach>
			</select>
			<input type="submit" value="전송"/>
		</fieldset>
	</form>
</body>
</html>