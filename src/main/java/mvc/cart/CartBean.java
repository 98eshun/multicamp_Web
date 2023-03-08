package mvc.cart;

import java.util.ArrayList;

public class CartBean {
	
	private final String ID = "a";
	private final String PASSWD = "6";
	ArrayList<String> productList;
	
	public CartBean() {
		productList  = new ArrayList<String>();	//CartBean�� �ҷ����� ����Ʈ�� �������
	}
	
	public boolean checkLogin(String id , String passwd) {
		boolean result = false;
		
		if(id != null && id.equals(this.ID) && passwd != null && passwd.equals(PASSWD) ){	// �α��� ���� ���� �˻�
			result = true;
		}
		
		return result;
	}
	
	public ArrayList<String> getProductList() {
		return this.productList;
	}
	
	public void addProduct(String product) {
		this.productList.add(product);
	}
	
	public void clearProductList() {
		this.productList.clear();
	}
	
}
