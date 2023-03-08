package mvc.twitter;

import java.sql.*;
import java.util.ArrayList;

import chap08.JdbcTestDOEx;

public class TwitterDAO {
	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement pstmt = null;	// 필요한 변수 private 선언
	private ResultSet rs = null;
	private String sql = null;
	
	public TwitterDAO() {	// 생성자에 서버 초기화 수행
		String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
		String jdbc_url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "scott";
		String pwd = "tiger";
		
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, user, pwd);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	public TwitterLoginDO getLoginDO(TwitterLoginDO loginDO) {	//null값을 반환하면 로그인 실패 
		TwitterLoginDO result = null;
		sql = "select * from twitter_login where id = ? and passwd = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginDO.getId());
			pstmt.setString(2, loginDO.getPasswd());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = new TwitterLoginDO();
				result.setId(rs.getString("id"));
				result.setPasswd(rs.getString("passwd"));
				result.setName(rs.getString("name"));
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}

	public ArrayList<TwitterDO> getAllTwitter(){
		ArrayList<TwitterDO> list = new ArrayList<TwitterDO>();
		TwitterDO twitterDO = null;
		sql = "select Twitter.id || '@' ||  name as id_name, message, to_char(create_date, 'YYYY/MM/DD HH24:MI:SS') as cdatetime\r\n"
				+ "from Twitter inner join Twitter_login\r\n"
				+ "	on Twitter.id= Twitter_login.id order by no;";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				twitterDO = new TwitterDO();
				twitterDO.setId(rs.getString("id_name"));	//테이블의 열 이름으로 해야함
				twitterDO.setMessage(rs.getString("message"));
				twitterDO.setDate(rs.getString("cdatetime"));
				list.add(twitterDO);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally {
			try {
				if(!stmt.isClosed()) {
					stmt.close();
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
		return list;
	}

	public int insertTwitter(TwitterDO twitterDO) {
		int rowCount = 0;
		sql = "insert into twitter(no, id, message) values(twitter_seq.nextval,?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, twitterDO.getId());
			pstmt.setString(2, twitterDO.getMessage());
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally {
			try {
				if(!stmt.isClosed()) {
					stmt.close();
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
		return rowCount;
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

