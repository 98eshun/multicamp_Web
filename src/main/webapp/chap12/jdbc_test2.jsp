<%@ page contentType="text/html; charset=UTF-8"
		 import="chap12.*, java.util.*"
%>

<%
	if(request.getMethod().equals("POST")) {
		request.setCharacterEncoding("UTF-8");
	}
%>

<jsp:useBean id="dao" class="chap12.JdbcTestDAOEx" scope="session" />
<jsp:useBean id="testDO" class="chap12.JdbcTestDOEx" scope="page" />
<jsp:setProperty name="testDO" property="*" />

<%
	if(request.getMethod().equals("POST")) {
		dao.insertJdbcTest(testDO);
	}

	ArrayList<JdbcTestDOEx> list = dao.selectAllJdbcTest();
	String result = "";
	
	for(JdbcTestDOEx tdo: list) {	//이거는 암기하는게 좋을 듯 이해하거나
		result += "<li>" + tdo.getUsername() + " | " + tdo.getEmail() + "</li>";
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>jdbc_test2.jsp</title>
</head>

<body>

	<form method="POST">
	<fieldset>
		<legend>정보 등록</legend>
		<label for="username">이름</label>
		<input type="text" name="username" id="username" /> /
		<label for="email">이메일</label>
		<input type="text" name="email" id="email" />
		<input type="submit" value="등록" />
	</fieldset>
	</form>
	<hr>
	
	<h2>리스트</h2>
	<%= result %>
</body>
</html>