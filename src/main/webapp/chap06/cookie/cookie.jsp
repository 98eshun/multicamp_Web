<%@ page contentType="text/html; charset=UTF-8"%>

<%
	Cookie cookie = new Cookie("product","p1234"); //name과 value
	response.addCookie(cookie); // 쿠키를 만들어서 응답의 해더에 저장
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>cookie.jsp</title>
</head>

<body>
	<h1>Cookie Example</h1>
	<hr/>
	
	<h4>브라우저의 개발자 도구를 이용해 저장된 쿠키</h4>
</body>
</html>