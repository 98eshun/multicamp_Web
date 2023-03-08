<%@ page contentType="text/html; charset=UTF-8"
			import = "java.util.*, mvc.twitter.*"
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>TwitterList.jsp</title>
</head>

<body>

	<h2>My Simple Twitter!!</h2>
	<hr/>
	
	<form method = "POST">
	<fieldset>
		<label><%= session.getAttribute("id") %>@<%=session.getAttribute("name") %></label>
		<input type = "text" name = "message"/>
		<input type = "hidden" name = "command" value="TwitterInsert"/>
		<input type = "submit" value="등록"/>
	</fieldset>
	</form>
	
	<hr/>
	
	<h3>트위터 리스트</h3>
	<ul>
		<%= result %>
	</ul>
	<form method = "POST">
		<input type = "hidden" name = "command" value="logout"/>
		<input type = "submit" value="로그아웃"/>
	</form>
</body>
</html>