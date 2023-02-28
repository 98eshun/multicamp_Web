<%@ page contentType="text/html; charset=UTF-8"
		import = "java.sql.*"
%>
<jsp:useBean id="connectionTest" class="chap08.connectionTest" scope = "page"/>
<jsp:setProperty name = "connectionTest" property="*"/>
<%
	String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
	String jdbc_url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "scott";
	String pwd = "tiger";
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	String addSql = null;
	String list = ""; 
	
	try {
		Class.forName(jdbc_driver);
		conn = DriverManager.getConnection(jdbc_url, user, pwd);
		
		System.out.println(conn.isClosed() ? "연결 실패!" : "연결 성공!");
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	
	if(request.getMethod().equals("POST")){
		sql = "insert into jdbc_test values(?,?)";
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,connectionTest.getName());
			pstmt.setString(2,connectionTest.getEmail());
			pstmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			try{
				if(!pstmt.isClosed()){
					pstmt.close();
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>jdbc_test.jsp</title>
</head>

<body>
	<h1>JDBC Test v2</h1>
	<hr>
	
	<form method="POST" >
	<fieldset>
		<legend>사용자 등록</legend>
		<label for= "username">이름</label>
		<input type = "text" name= "username" id="username"/>
		<label for= "email">이메일</label>
		<input type = "text" name= "email" id="email"/>
		<input type = "submit" value="등록"/>
	</fieldset>
	</form>
	
	<hr/>
	
	<h3>등록 목록</h3>
	
	<ol>
		<!-- jdbc_test 테이블의 모든 행 정보를 읽어서 출력 -->
		<%= list %>
	</ol>
</body>
</html>