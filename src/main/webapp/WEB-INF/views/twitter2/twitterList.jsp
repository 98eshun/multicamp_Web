<%@ page contentType="text/html; charset=UTF-8"
			import = "java.util.*, mvc.twitter.*" %>

<%
	@SuppressWarnings("unchecked")
	ArrayList<TwitterDO> list = (ArrayList<TwitterDO>)session.getAttribute("lsit"); // getAttribute는 오브젝트로 넘어오기 때문에 형변환
	String result = "";
	
	for(TwitterDO tDO : list ){
		result += "<li>" + tDO.getId() + ":::" + tDO.getMessage() + ":::" + tDO.getDate() + "</li>";
	}
%>

<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title>twitterList.jsp</title>
</head>

<body>

	<h2>My Simple Twitter!!</h2>
	<hr />
	
	<form method="POST">
		<fieldset>
			<label><%= session.getAttribute("id") %> @ <%= session.getAttribute("name") %></label>
			<input type="text" name="message" size="50" />
			<input type = "hidden" name="command" value="insertTwitter"/>
			<input type="submit" value="등록" />
		</fieldset>
	</form>	
	<hr />
	
	<h3>트위터 리스트</h3>
	<ul>
		<%= result %>
	</ul>

</body>
</html>