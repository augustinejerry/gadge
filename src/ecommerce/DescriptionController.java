package ecommerce;

import java.util.ArrayList;

public class DescriptionController {
	ProductsController p;
	ArrayList<Specification> s;
	
	public ProductsController getP() {
		return p;
	}

	public void setP(ProductsController p) {
		this.p = p;
	}

	public ArrayList<Specification> getS() {
		return s;
	}

	public void setS(ArrayList<Specification> s) {
		this.s = s;
	}

	public DescriptionController(ProductsController p, ArrayList<Specification> s) {
		this.p = new ProductsController(p);
		this.s = s;
	}
}
