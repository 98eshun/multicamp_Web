<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String script = "";
// isNew() = 최초의 요청이면 true 재사용이면 false
	if(session.isNew()){
		script += "<script>alert('세션 객체가 생성되었습니다')</script>";
		
		session.setAttribute("userName","김연아");
	}

%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>session.jsp</title>
	<script>
		<%= script %>
	</script>
</head>

<body>
	<h1>session 예제</h1>
	<hr/>
	
	<h4><%=session.getAttribute("userName") %> 님의 방문을 환영합니다.</h4>
	<h4>세션 유휴 시간 : <%= session.getMaxInactiveInterval() %></h4>
	<h4>세션 ID : <%= session.getId() %></h4>
</body>
</html>