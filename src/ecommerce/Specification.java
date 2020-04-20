package ecommerce;

public class Specification {
	int product_id;
	String spec;
	String val;
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getSpec() {
		return spec;
	}
	public void setSpec(String spec) {
		this.spec = spec;
	}
	public String getVal() {
		return val;
	}
	public void setVal(String val) {
		this.val = val;
	}
	public Specification() {
		this.product_id = 0;
		this.spec = null;
		this.val = null;
	}
	public Specification(Specification s) {
		this.product_id = s.product_id;
		this.spec = s.spec;
		this.val = s.val;
	}
}
