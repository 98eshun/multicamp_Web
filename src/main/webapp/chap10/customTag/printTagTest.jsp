<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="myTag" %>
<!-- /WEB-INF/tags 이 경로 안에 있는 태그들을 myTag라는 이름으로 사용한다. -->

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>printTagTest</title>
</head>

<body>
	<h2>print 사용자 태그 예제</h2>
	<hr>
	
	<myTag:print/>
	<!-- myTag에 있는 print.tag 실행 -->
</body>
</html>