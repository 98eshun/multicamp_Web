<%@ page contentType="text/html; charset=UTF-8"
			import = "java.util.*, mvc.twitter.*"
%>

<%
if(request.getMethod().equals("POST")){
	request.setCharacterEncoding("UTF-8");
}
%>
	
<jsp:useBean id="TwitterDAO" class="mvc.twitter.TwitterDAO" scope = "session"/>
<jsp:useBean id="TwitterDO" class="mvc.twitter.TwitterDO"/>
<jsp:setProperty name="TwitterDO" property="message"/>

<%
	String command = request.getParameter("command");
	if(request.getMethod().equals("POST") && command !=null && command.equals("logout")){
		
		
		if(command.equals("TwitterInsert")){
			TwitterDO.setId((String)session.getAttribute("id"));
			TwitterDAO.insertTwitter(TwitterDO);
		}
		else if(command.equals("logout")){
			session.invalidate();
			response.sendRedirect("TwitterLogin.jsp");
		}
	}
	
	
	ArrayList<TwitterDO> list = TwitterDAO.getAllTwitter();
	String result = "";
	
	for(TwitterDO tDO : list){
		result += "<li>" + tDO.getId() + ":::" + tDO.getMessage() + ":::" + tDO.getDate() + "</li>";
	}
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