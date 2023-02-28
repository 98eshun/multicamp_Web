package calc;

public class calc2 {

	private int num1;
	private int num2;
	private String operator;
	
	public calc2(){
	}
	
	public void setNum1(int num1) {
		this.num1 = num1;
	}
	
	public void setNum2(int num2) {
		this.num2 = num2;
	}
	
	public int getNum1() {
		return this.num1;
	}
	
	public int getNum2() {
		return this.num2;
	}
	
	public void setOperator(String operator) {
		this.operator = operator;
	}
	
	public int calculate() {
		int result=0;
		if(this.operator != null) {
			if(this.operator.equals("+")){
				result = this.num1 + this.num2;
			}
			else if(this.operator.equals("-")){
				result = this.num1 - this.num2;
			}
			else if(this.operator.equals("*")){
				result = this.num1 * this.num2;
			}
			else if(this.operator.equals("/")){
				result = this.num1 / this.num2;
			}
		}
		return result;
	}
}
