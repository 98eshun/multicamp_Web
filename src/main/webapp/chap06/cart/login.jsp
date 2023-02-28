<%@ page contentType="text/html; charset=UTF-8"%>
 
<%
	// 로그인 화면은 로그인 하지 않은 사용자에게만 보여야 한다.
	// 로그인 한 사용자가 로그인을 요청하면 selProduct로 이동
	final String ID = "longlee";
	final String PASSWD = "6789";
	boolean isLogin = false;
	String YN = (String)session.getAttribute("Login");
	
	if(YN == "false"){
		if(request.getMethod().equals("POST")){
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			
			if(isLogin = false && id != null && id.equals(ID) && passwd != null && passwd.equals(PASSWD)){
				session.setAttribute("userId", id);
				session.setAttribute("Login", isLogin);
				response.sendRedirect("selProduct.jsp");
			}
	
		}
	}
	else{
		response.sendRedirect("selProduct.jsp");
	}
%>

<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title>login.jsp</title>
</head>

<body>

	<h1>로그인</h1>
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
