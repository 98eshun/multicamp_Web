<%@ page contentType="text/html; charset=UTF-8"
			import="chap11.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL : set</title>
</head>

<body>
	<h2>JSTL c:set</h2>
	<hr>
	
	<c:set var = "msg" value="Hello, World!" scope="page"/> <!-- msg라는 이름의 변수를 만든거임 -->
	msg : ${msg}<br>	<!-- 아래 코드와 같다 -->
	msg : <%= pageContext.getAttribute("msg") %>
	
	<hr>
	
	<c:set target="${member}" property="email" value="changed@nate.com"/><!-- member 객체의 email 속성을 changed@~~ 로 변경하겠다 -->
	Member name : ${member.name }<br/>
	Member email : ${member.email }


</body>
</html>