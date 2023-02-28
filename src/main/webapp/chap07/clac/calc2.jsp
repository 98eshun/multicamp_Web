<%@ page contentType="text/html; charset=UTF-8"
			import = "calc.*"%>

    <jsp:useBean id="calc2" class="calc.calc2" scope = "page"/>
	<jsp:setProperty name = "calc2" property="*"/> 
	<!-- setProperty에서는 자동 형변환을 해줌 (기본형에 한해서) -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>clac2.jsp</title>
</head>
<body>

	<h2>JSP 프로그램 구현 유형 -2</h2>
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
	<h4>계산결과 : <%= calc2.calculate() %></h4>
	
</body>
</html>