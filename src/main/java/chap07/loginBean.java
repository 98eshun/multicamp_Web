package chap07;

public class loginBean {
	
	private String id;	// �ʵ� �������� private �̾�� �Ѵ�.
	private String passwd; // �� ������� form�� �ִ� �Ķ���� id�� ���ƾ� Bean�� set,get�� �ڵ����� ȣ�Ⱑ��
	
	public loginBean() {		
	} 	//�ڵ� ������ ���ؼ� �Ű������� ���� �����ڸ� ����� �־�� �� 
	
	public void setId(String id) {	// �ʵ� ������ private�̱� ������ get,set �޼��带 ����� �־�� ��
		this.id = id;				// get,set �޼���� �ٸ������� ȣ��� ����ؾ� �ϱ� ������ public
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
