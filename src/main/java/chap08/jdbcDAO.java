package chap08;

import java.sql.*;
import java.util.ArrayList;

public class jdbcDAO {
	
	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	private String addSql = null;
	private String list = "";
	
	public jdbcDAO(){
		
		String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
		String jdbc_url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "scott";
		String pwd = "tiger";
		
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, user, pwd);
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		
	}

	public String selectAll() {
		jdbcDO testDO = new jdbcDO();
		sql = "select * from jdbc_test";
		
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				list += "<li>" + testDO.getUsername() + "|" + testDO.getEmail() + "</li>";
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
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public void insertJdbc() {
		jdbcDO DO = testDO;
		
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		sql = "insert into jdbc_test values(?,?)";
		
		try{
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
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void close() {
		
		try{
			if(!conn.isClosed()){
				conn.close();
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
