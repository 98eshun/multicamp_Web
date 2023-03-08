<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>productSel.jsp</title>
</head>

<body>
	<h2>EL 결과</h2>
	<hr>
	
	1. 선택한 상품은 : ${param.sel} <br/>
	2. num1 + num2 : ${product.num1 + product.num2}
	<!-- 2. num1 + num2 : ${session.product.num1 + session.product.num2} session은 위와 같이 생략 가능-->
</body>
</html>