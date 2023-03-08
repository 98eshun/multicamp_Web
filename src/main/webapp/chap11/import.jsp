<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL : import</title>
</head>

<body>
	<h2>JSTL c:import</h2>
	<hr>
	
	<h3>다음은 set.jsp 를 import 한 결과입니다.</h3>
	<hr>
	
	<c:import url="set.jsp" var="resultSet"/>
	<c:out value="${resultSet}" escapeXml="false"/>
	
	<h3>다음은 chap10/el/product.jsp 를 import 한 결과입니다.</h3>
	<hr>
	
	<c:import url="/chap10/productList.jsp" var="resultProductList"/>
	<c:out value="${resultProductList}" escapeXml="false"/>
	
</body>
</html>