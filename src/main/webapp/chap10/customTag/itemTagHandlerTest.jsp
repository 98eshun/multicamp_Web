<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/ItemTag.tld" prefix="myTag" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title>itemTagHandlerTest.jsp</title>
	<style>
	table, th, td {
		border: 2px solid gray;
		border-collapse: collapse;
	}
	th, td {
		padding: 10px;
	}
	
	</style>
</head>

<body>
	
	<myTag:item title="상품 재고 현황" colName="상품명"></myTag:item>
	
</body>
</html>