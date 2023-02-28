package chap07;

public class loginBean {
	
	private String id;	// 필드 변수들은 private 이어야 한다.
	private String passwd; // 이 변수들과 form에 있는 파라미터 id가 같아야 Bean의 set,get을 자동으로 호출가능
	
	public loginBean() {		
	} 	//자동 생성을 위해서 매개변수가 없는 생성자를 만들어 주어야 함 
	
	public void setId(String id) {	// 필드 변수가 private이기 때문에 get,set 메서드를 만들어 주어야 함
		this.id = id;				// get,set 메서드는 다른곳에서 호출로 사용해야 하기 때문에 public
	}
	
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	public String getId() {
		return this.id;
	}
	
	public String getPasswd() {
		return this.passwd;
	}
	
	public boolean checkLogin() {
		final String ID = "longlee";
		final String PASSWD = "6789";
		boolean result = false;
		
		if(this.id != null && this.id.equals(ID) && this.passwd != null && this.passwd.equals(PASSWD)) {
			result = true;
		}
		
		return result;
	}
}
