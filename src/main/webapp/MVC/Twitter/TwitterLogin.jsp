<%@ page contentType="text/html; charset=UTF-8"
			import="mvc.twitter.*"
%>

<jsp:useBean id="loginDO" class="mvc.twitter.TwitterLoginDO" scope = "page"/> <!-- scope = 페이지 마다 만들어라 -->
<jsp:useBean id="twitterDAO" class="mvc.twitter.TwitterDAO" scope = "session"/> <!-- scope = 세션 마다 만들어라 -->
<jsp:setProperty name = "loginDO" property="*"/>

<%
	if(request.getMethod().equals("POST")){
		TwitterLoginDO result = twitterDAO.getLoginDO(loginDO);
		
		if(result != null){
			session.setAttribute("id", result.getId());
			session.setAttribute("name", result.getName());
			pageContext.forward("TwitterList.jsp");		//포워드 방식
			//response.sendRedirect("TwitterList.jsp");	// 리다이렉트 방식
		}
	}
	
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>twitterLogin.jsp</title>
</head>

<body>
	<h1>트위터 로그인</h1>
	<hr/>
	
	<form method = "POST">
	<fieldset>
		<legend>로그인</legend>
		<label for="id">ID</label>
		<input type="text" name ="id" id ="id"/>
		<label for ="passwd">Passwd</label>
		<input type ="password" name ="passwd" id ="passwd"/>
		<input type ="submit" value ="login"/>
	</fieldset>
	</form>
</body>
</html>