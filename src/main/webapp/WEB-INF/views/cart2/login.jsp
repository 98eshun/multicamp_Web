<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Main.jsp</title>
</head>

<body>
	<h2>학생 성적 관리 프로그램</h2>
	<hr>
	
	<form method="POST">
		<fieldset>
		<label for="insert">1.학생 정보 입력</label>
		<input type="button" name="insert" id="insert"/><br/>
		<label for="list">2.학생 정보 조회</label>
		<input type="button" name="list" id="list"/><br/>
		<label for="modify">3.성적 변경</label>
		<input type="button" name="modify" id="modify"/><br/>
		<label for="delete">4.학생 정보 삭제</label>
		<input type="button" name="delete" id="delete"/><br/>
		<label for="off">5.프로그램 종료</label>
		<input type="button" name="off" id="off"/><br/>
		</fieldset>
	</form>
</body>
</html>