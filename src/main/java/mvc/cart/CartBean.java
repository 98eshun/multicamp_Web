package mvc.cart;

import java.util.ArrayList;

public class CartBean {
	
	private final String ID = "a";
	private final String PASSWD = "6";
	ArrayList<String> productList;
	
	public CartBean() {
		productList  = new ArrayList<String>();	//CartBean을 불러오면 리스트가 만들어짐
	}
	
	public boolean checkLogin(String id , String passwd) {
		boolean result = false;
		
		if(id != null && id.equals(this.ID) && passwd != null && passwd.equals(PASSWD) ){	// 로그인 성공 여부 검사
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
