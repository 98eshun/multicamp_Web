<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL : remove</title>
</head>

<body>
	<h2>JSTL c:remove</h2>
	<hr>
	
	<c:set var = "msg" value="Hello, World!" scope="page"/> <!-- msg라는 이름의 변수를 만든거임 -->
	msg(삭제 전) : ${msg}<br>
	
	<hr>
	
	<c:remove var="msg" /><!-- member 객체의 email 속성을 changed@~~ 로 변경하겠다 -->
	msg(삭제 후) : ${msg}<br>

</body>
</html>