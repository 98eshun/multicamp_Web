package chap08;

import java.sql.*;

public class connectionTest {
	String username;
	String email;
	
	public connectionTest() {
	}

	public static void main(String[] args) {

		String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
		String jdbc_url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "scott";
		String pwd = "tiger";
		Connection conn = null;
		
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, user, pwd);
			
			System.out.println(conn.isClosed() ? "���� ����!" : "���� ����!");
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(!conn.isClosed()) {
					conn.close();
					System.out.println(conn.isClosed() ? "���� ����" : "");
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void setName(String username) {
		this.username = username;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getEmail() {
		return this.email;
	}
	
	public String getName() {
		return this.username;
	}
}