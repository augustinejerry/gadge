package ecommerce;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductsController {
	int product_id;
	String product_category;
	String product_name;
	String brand_name;
	float price;
	String description;
	int qty;
	
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public ProductsController() {
		this.product_id = 0;
		this.product_category = null;
		this.product_name = null;
		this.brand_name = null;
		this.price = 0;
		this.description = null;
		this.qty = 0;
	}
	public ProductsController(ProductsController p) {
		this.product_id = p.product_id;
		this.product_category = p.product_category;
		this.product_name = p.product_name;
		this.brand_name = p.brand_name;
		this.price = p.price;
		this.description = p.description;
		this.qty = p.qty;
	}
	public void productSetter(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String product = request.getParameter("productId");
		
		request.getSession().setAttribute("product", product);
		
	}
	
}
