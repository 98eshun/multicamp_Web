<%@ page contentType="text/html; charset=UTF-8"%>

<%--JSP 주석입니다. 브라우저에서 보이지 않아요 --%>

<!-- HTML 주석입니다. 브라우저에서 보여요 -->

<% //자바 한 줄 주석입니다. 

	/*
	자바 여러 줄 주석입니다.
	*/
	
	int num1 =10, num2 =20;
	int result = num1 * num2;
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script>
	//자바 한 줄 주석입니다. 

	/*
	자바 여러 줄 주석입니다.
	*/
	
	alert('알림 창');
	</script>
	<style>
		/* 스타일 주석입니다 */
		
		#target{
		border: 2px solid gray;
		padding : 20px;
		text-align: center;
		}
		
	</style>
</head>

<body>
	<div id = "target">
		<h2>JSP 주석 예제</h2>
		<hr/>
		<h3>계산결과 : <%= result %></h3>
	</div>
	
</body>
</html>