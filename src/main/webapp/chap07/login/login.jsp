<%@ page contentType="text/html; charset=UTF-8"
		import = "chap07.loginBean"
%>

<jsp:useBean id = "loginBean" class="chap07.loginBean" scope = "page"/>
<!-- 아래의 주석으로 된 생성자와 같은 역할, 위의 코드는 JSP에 선언한것 -->
<%--
<jsp:setProperty name = "loginBean" property="id"/>
<jsp:setProperty name = "loginBean" property="passwd"/>
<!-- 아래의 setId() 와 setPasswd() 의 역할과 같은 코드 -->
--%>

<jsp:setProperty name = "loginBean" property="*"/>
<!-- property를 "*" 로 설정하면 모든 파라미터를 읽어서 로그인 빈에 이름이 같은 애들을 자동으로 넣어줌 -->

<%
	// loginBean loginBean = new loginBean();

	//loginBean.setId(request.getParameter("id"));
	//loginBean.setPasswd(request.getParameter("passwd"));
	String msg = "";
	
	if(loginBean.checkLogin()){
		msg += "<h4>" + loginBean.getId() + "님 환영합니다.</h4>";
		msg += "<h4>아이디 :" + loginBean.getId() + "패스워드 : " + loginBean.getPasswd() + "</h4>";
	}
	else{
		msg += "<h4>로그인을 실패했습니다</h4>";
		msg += "<a href = 'loginForm.html'>로그인</a>";
	}
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>

<body>
	<%= msg %>
	<h5>id: <jsp:getProperty name = "loginBean" property="id"/>, 
	passwd: <jsp:getProperty name = "loginBean" property="passwd"/></h5>
	<!-- getProperty도 똑같이 사용 이 자리에 값이 반환됨 -->
</body>
</html>