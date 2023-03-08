<%@ page contentType="text/html; charset=UTF-8"%>


<%
	// 이 화면이 보였다는 이야기는 request가 수행되고 끝났다는 의미 
	// request는 서버에게 요청을 하고 사라짐
	pageContext.setAttribute("pageElTest", "pageContext storage value!");
	request.setAttribute("reqElTest","request storage value!");
	session.setAttribute("sesElTest","session storage value!");
	application.setAttribute("appElTest","application storage value!");
			
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>elTest</title>
	<script>
		document.cookie = "elCookie=EL_CookieTest";
	</script>
	<!-- 자바스크립트는 서버가 브라우저에게 제공하는 것 -->
</head>

<body>
	<h2>EL Test</h2>
	<hr>
	
	<form action="elResult.jsp" method="GET">
	<label for="userName">이름</label>
		<input type="text" name= "username" id="username" />
		
		[관심분야]
		<label for = "favorite1">정치</label>
		<input type = "checkbox" name = "favorite" id = "favorite1" value = "정치"/>
		<label for = "favorite2">경제</label>
		<input type = "checkbox" name = "favorite" id = "favorite2" value = "경제"/>
		<label for = "favorite3">사회</label>
		<input type = "checkbox" name = "favorite" id = "favorite3" value = "사회"/>
		<label for = "favorite4">문화</label>
		<input type = "checkbox" name = "favorite" id = "favorite4" value = "문화"/> <br/>
		
		<input type="submit" value="전송"/>
	</form>
</body>
</html>