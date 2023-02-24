<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String name = "손흥민";
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
%>


<div id = "footer">
		<h1>Footer</h1>
		<h3>회사소개 <%=email %> <%= tel %></h3>
	</div>