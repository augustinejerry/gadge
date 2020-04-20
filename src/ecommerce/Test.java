package ecommerce;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

public class Test {
	int a;
	int b;
	String img;
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getA() {
		return a;
	}
	public void setA(int a) {
		this.a = a;
	}
	public int getB() {
		return b;
	}
	public void setB(int b) {
		this.b = b;
	}
	public Test(int a, int b, String img) {
		this.a = a;
		this.b = b;
		this.img = img;
	}
	public ArrayList<String> getCategory() {
		ArrayList<String> productCategory = new ArrayList<>();
		
		ResultSet rs = null;
		String query = null;
		
		query = "SELECT product_category\r\n" + 
				"FROM products\r\n" + 
				"GROUP BY product_category";
			
		DBConnection dbc = new DBConnection();
		rs = dbc.getResultSet(query);
		
		try {
			while (rs.next()) {
				productCategory.add(rs.getString("product_category"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			if (rs != null) try { rs.close(); } catch(Exception e) {}
		}
		Iterator<String> i = productCategory.iterator();
		while(i.hasNext()) {
			System.out.println(i.next());
		}
		return productCategory;
		
	}
}
