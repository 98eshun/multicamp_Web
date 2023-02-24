<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		table, td {
		border : 2px solid gray;
		border-collapse: collapse;
		}
		
		td{
		padding: 5px;
		text-align: center;
		}
	</style>
</head>

<body>

	<table>
		<%
		for (int i=2; i<10; i++){ 
		%>
		<tr><td><%= i+"단" %></td></tr>
		<% 
			for(int j=1; j <10; j++){
		%>
		<tr><td><%= i*j %></td></tr>
		<%
			}
		}
		%>
	</table>
	
</body>
</html>