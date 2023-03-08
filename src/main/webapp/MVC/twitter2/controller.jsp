<%@ page contentType="text/html; charset=UTF-8"%>

<%
	if(request.getMethod().equals("POST")) {
		request.setCharacterEncoding("UTF-8");
}
%>

<jsp:useBean id="loginDO" class="mvc.twitter.TwitterLoginDO" scope = "page"/>
<jsp:useBean id="twitterDO" class="mvc.twitter.TwitterDO" scope = "page"/> <!-- scope = 페이지 마다 만들어라 -->
<jsp:useBean id="twitterDAO" class="mvc.twitter.TwitterDAO" scope = "session"/> <!-- scope = 세션 마다 만들어라 -->
<jsp:setProperty name = "loginDO" property="*"/>
<jsp:setProperty name = "twitterDO" property="message"/>

<%
	String viewPath = "/WEB_INF/views/twitter2/";
	String command = request.getParameter("command");

	if(session.getAttribute("id")== null){	//로그인이 안된 상태
		if(request.getMethod().equals("GET")){
			pageContext.forward(viewPath + "twitterLogin.jsp");
		}
		else if(request.getMethod().equals("POST")){
			TwitterLoginDO tDO = twitterDAO.getLoginDO(loginDO);
			
			if(tDO != null){
				session.setAttribute("id", tDO.getId());
				session.setAttribute("name", tDO.getName());
				
				response.sendRedirect("controller.jsp");
				//session.setAttribute("list". twitterDAO.getAllTwitter());
				// pageContext.forward(viewPath + "twitterList.jsp")
			}
			else{	// 로그인 실패
				pageContext.forward(viewPath + "twitterLogin.jsp");
			}
		}
	}
	else{	// 로그인이 된 상태
		if(command != null && command.equals("logout")){	// 로그아웃을 실행
			session.invalidate();	//세션 비우기
			response.sendRedirect("controller.jsp");	// 컨트롤러 재요청
		}
		else{	// 로그아웃아닌 리스트를 띄워줌
			if(command != null && command.equals("insertTwitter")){
				twitterDO.setId((String)session.getAttribute("id"));
				twitterDAO.insertTwitter(twitterDO);
			}
		
			session.setAttribute("list",twitterDAO.getAllTwitter());
			pageContext.forward(viewPath + "twitterList.jsp");
		}
	}
%>