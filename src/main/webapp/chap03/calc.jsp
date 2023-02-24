<%@ page contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	int result = 0;

	if(request.getMethod().equals("POST")){
		int num1 = Integer.parseInt(request.getParameter("num1")); //getParameter는 문자열로 가져오므로 integer로 변환
		String operator = request.getParameter("operator");
		int num2 = Integer.parseInt(request.getParameter("num2")); //getParameter는 문자열로 가져오므로 integer로 변환
		
		if(operator.equals("+")){
			result = num1 + num2;
		}
		else if(operator.equals("-")){
			result = num1 - num2;
		}
		else if(operator.equals("*")){
			result = num1 * num2;
		}
		else if(operator.equals("/")){
			result = num1 / num2;
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>clac.jsp</title>
</head>
<body>

	<h2>JSP 프로그램 구현 유형 -1</h2>
	<hr/>
	
	<form method = "POST">
	<fieldset>
		<legend>간단 계산기</legend>
		
		<input type = "number" name = "num1" value="0"/>
		<select name = "operator">
			<option selected>+</option>
			<option>-</option>
			<option>*</option>
			<option>/</option>
		</select>
		<input type = "number" name = "num2" value="0"/>
		
		<input type = "submit" value = "계산">
		<input type = "reset" value = "초기화">
	</fieldset>		
	</form>
	
	<hr/>
	<h4>계산결과 : <%= result %></h4>
	
</body>
</html>