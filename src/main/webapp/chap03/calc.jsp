<%@ page contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	int result = 0;

	if(request.getMethod().equals("POST")){
		int num1 = Integer.parseInt(request.getParameter("num1")); //getParameter�� ���ڿ��� �������Ƿ� integer�� ��ȯ
		String operator = request.getParameter("operator");
		int num2 = Integer.parseInt(request.getParameter("num2")); //getParameter�� ���ڿ��� �������Ƿ� integer�� ��ȯ
		
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

	<h2>JSP ���α׷� ���� ���� -1</h2>
	<hr/>
	
	<form method = "POST">
	<fieldset>
		<legend>���� ����</legend>
		
		<input type = "number" name = "num1" value="0"/>
		<select name = "operator">
			<option selected>+</option>
			<option>-</option>
			<option>*</option>
			<option>/</option>
		</select>
		<input type = "number" name = "num2" value="0"/>
		
		<input type = "submit" value = "���">
		<input type = "reset" value = "�ʱ�ȭ">
	</fieldset>		
	</form>
	
	<hr/>
	<h4>����� : <%= result %></h4>
	
</body>
</html>