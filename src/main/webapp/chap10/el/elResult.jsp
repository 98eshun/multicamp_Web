<%@ page contentType="text/html; charset=UTF-8"%>


<%
	String myName="연아";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>elResult</title>
</head>

<body>
	<h2>EL Result</h2>
	<hr>
	
	${pageScope.pageElTest} <br/>
	${requestScope.reqElTest} <br/>
	${sessionScope.sesElTest} <br/>
	${applicationScope.appElTest} <br/>
	${param.userName}
	${paramValues.favorite[0]} / ${paramValues.favorite[1]}
	<!-- paramValues의 반환값은 배열이다 그러므로 favorit[0] 해주어야 함 -->
	${cookie.elCookie.name} = ${cookie.elCookie.value}
	adminID : ${initParam.adminID} / admin passwd: ${initParam.adminPasswd }
	<!-- web.xml에 <context-param> (웹 어플리케이션 초기화)에 설정해 놓은 admin의 ID 와 passwd 출력 -->
	사용자 이름 : ${myName}
	<!-- El 표현식은 로컬 변수를 사용할 수 없다. -->

</body>
</html>