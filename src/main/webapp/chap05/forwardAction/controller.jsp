<%@ page contentType="text/html; charset=UTF-8"%>

<% String name = "lee"; %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>controller.jsp</title>
</head>

<body>
	
	<h1>forward action example</h1>
	<hr/>
	<h3>이 내용이 사용자에게 보일까요?</h3>
	
	<jsp:forward page = "main.jsp">
		<jsp:param value="son@daum.net" name="email"/>
		<jsp:param value="101-1234-5678" name="tel"/>
	</jsp:forward>
	
</body>
</html>