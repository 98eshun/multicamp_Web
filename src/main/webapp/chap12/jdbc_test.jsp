<%@ page contentType="text/html; charset=UTF-8"
		import = "java.sql.*,javax.naming.*, javax.sql.*"
%>

<%
	DataSource ds = null;
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	String addSql = null;
	String list = "";
	
	try {
		InitialContext context = new InitialContext();
		ds = (DataSource)context.lookup("java:comp/env/jdbc/oracleXE");
	}
	catch (Exception e) {
		e.printStackTrace();
	}	
	
	if(request.getMethod().equals("POST")){
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		sql = "insert into jdbc_test values(?,?)";
		
		try{
			conn = ds.getConnection(); // 하나의 커넥션 객체를 빌려오는것 (conn 초기화)
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,request.getParameter("username"));
			pstmt.setString(2,request.getParameter("email"));
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
				if(!conn.isClosed()){
					conn.close(); 	// 연결을 반납하는 것
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
}
	sql = "select * from jdbc_test";
	
	try{
		conn = ds.getConnection();	// 하나의 커넥션 객체를 빌려오는것 (conn 초기화) 이렇게 객체마다 커넥션을 빌려와서 사용
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		while(rs.next()){
			list += "<li>" + rs.getString("username") + "|" + rs.getString("email") + "</li>";
		}
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	finally{
		try{
			if(!stmt.isClosed()){
				stmt.close();
			}
			if(!conn.isClosed()){	// 연결을 반납하는 것
				conn.close();
			}
		}
		catch (Exception e) {
			e.printStackTrace();
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
	<h1>JDBC Test v1</h1>
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