package chap12;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JdbcTestDAOEx {
	
	private DataSource ds = null;
	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement pstmt = null;	// 필요한 변수 private 선언
	private ResultSet rs = null;
	private String sql = null;
	
	public JdbcTestDAOEx() {	// 생성자에 서버 초기화 수행
		
		try {
			InitialContext context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracleXE");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	public int insertJdbcTest(JdbcTestDOEx testDO) { //DO를 매개변수로 넣어줌
		int rowCount = 0;
		this.sql = "insert into jdbc_test values(?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, testDO.getUsername());
			pstmt.setString(2, testDO.getEmail());
			pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(!pstmt.isClosed()) {
					pstmt.close();
				}
				if(!conn.isClosed()) {
					conn.close();
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return rowCount;
	}

	public ArrayList<JdbcTestDOEx> selectAllJdbcTest() {
		ArrayList<JdbcTestDOEx> list = new ArrayList<JdbcTestDOEx>();
		JdbcTestDOEx testDO = null;	//JdbcTestDOEx 에 대한 리스트 생성
		this.sql = "select * from jdbc_test";
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				testDO = new JdbcTestDOEx();	//testDO라는 새로운 DO객체 생성 (행)
				testDO.setUsername(rs.getString("username"));
				testDO.setEmail(rs.getString("email"));
				
				list.add(testDO);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(!stmt.isClosed()) {
					stmt.close();
				}
				if(!conn.isClosed()) {
					conn.close();
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public void closeConnection() {
		try {
			if(!conn.isClosed()) {
				conn.close();
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}




















