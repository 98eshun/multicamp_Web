<%@ page contentType="text/html; 
charset=UTF-8" isErrorPage = "true"%> 
<!-- 에러를 받을 수 있음 -->

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>error.jsp</title>
	<style >
		#target{
		border: 2px solid gold;
		background-color:yellow;
		color:red;
		text-align:center;
		padding: 20px;
		}
	</style>
</head>

<body>
	<div id = "target">
		<%= exception %>
		<hr/>
	</div>
</body>
</html>