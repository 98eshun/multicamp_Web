<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL : choose</title>
</head>

<body>
	<h2>JSTL c:choose</h2>
	<hr>
	
	<form action="">
		<select name="sel">
		<option>-</option>
		<option ${param.sel == 'a' ? 'selected' : '' }>a</option>	<!-- EL에도 조건 연산자 사용가능 -->
		<option ${param.sel == 'b' ? 'selected' : '' }>b</option>	<!-- option을 선택했을 때 b항목이 selected가 됨 -->
		<option ${param.sel == 'c' ? 'selected' : '' }>c</option>
		<option ${param.sel == 'd' ? 'selected' : '' }>c</option>
		</select>
		<input type = "submit" value="전송"/>
	</form>
	
	<hr>
	
	<c:choose>
		<c:when test="${param.sel == 'a' }">a를 선택</c:when>
		<c:when test="${param.sel == 'b' }">b를 선택</c:when>
		<c:when test="${param.sel == 'c' }">c를 선택</c:when>
		<c:otherwise>a,b,c, 이외의 값 선택</c:otherwise>
		
	</c:choose>
	
	

</body>
</html>