<%@ page contentType="text/html; charset=UTF-8"%>

<%
	if(request.getMethod().equals("POST")){
		request.setCharacterEncoding("UTF-8");
	}
%>

<jsp:useBean id="bean" class="mvc.cart.CartBean" scope="session"/>

<%
	if(request.getParameter("id") == null){
		
	}
	else{
		
	}
%>