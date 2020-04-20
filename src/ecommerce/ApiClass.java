package ecommerce;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ApiClass {
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
		
		return productCategory;
		
	}
	public ArrayList<ProductsController> getProducts(String category) {
		ArrayList<ProductsController> products = new ArrayList<>();
		
		ResultSet rs = null;
		String query = null;
		System.out.println(category.equals("ShowAll") ? "product_category" : "'" + category + "'");
		query = "SELECT product_id\r\n" + 
				"	 , product_category\r\n" + 
				"	 , product_name\r\n" + 
				"	 , brand_name\r\n" + 
				"	 , price\r\n" + 
				"	 , product_description\r\n" + 
				"	FROM products\r\n" + 
				"	WHERE product_category = " + (category.equals("ShowAll") ? "product_category" : "'" + category + "'");
			
		DBConnection dbc = new DBConnection();
		rs = dbc.getResultSet(query);
		
		
		try {
			while (rs.next()) {
				ProductsController p = new ProductsController();
				p.setProduct_id(rs.getInt("product_id"));
				p.setProduct_category(rs.getString("product_category"));
				p.setProduct_name(rs.getString("product_name"));
				p.setBrand_name(rs.getString("brand_name"));
				p.setPrice(rs.getFloat("price"));
				p.setDescription(rs.getString("product_description"));
				products.add(p);	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			if (rs != null) try { rs.close(); } catch(Exception e) {}
		}
		
		return products;
		
	}
	public DescriptionController getProdDesc(String productId){
		ArrayList<Specification> spec = new ArrayList<>();
	
		ResultSet rs = null;
		String productQuery = null;
		
		productQuery = "SELECT product_id\r\n" + 
				"	 , product_category\r\n" + 
				"	 , product_name\r\n" + 
				"	 , brand_name\r\n" + 
				"	 , price\r\n" + 
				"	 , product_description\r\n" + 
				"	FROM products\r\n" + 
				"	WHERE product_id = " + productId;
			
		DBConnection dbc = new DBConnection();
		rs = dbc.getResultSet(productQuery);
		ProductsController p = new ProductsController();
		
		try {
			while (rs.next()) {
				p.setProduct_id(rs.getInt("product_id"));
				p.setProduct_category(rs.getString("product_category"));
				p.setProduct_name(rs.getString("product_name"));
				p.setBrand_name(rs.getString("brand_name"));
				p.setPrice(rs.getFloat("price"));
				p.setDescription(rs.getString("product_description"));
						
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			if (rs != null) try { rs.close(); } catch(Exception e) {}
		}
		
		//retrieving specification
		String specQuery = null;
		
		specQuery = "SELECT product_id\r\n" + 
				" , specification\r\n" + 
				" , value\r\n" + 
				"FROM specification\r\n" + 
				"WHERE product_id = " + productId;
			
		rs = dbc.getResultSet(specQuery);
		
		
		try {
			while (rs.next()) {
				Specification s = new Specification();
				s.setProduct_id(rs.getInt("product_id"));
				s.setSpec(rs.getString("specification"));
				s.setVal(rs.getString("value"));
				spec.add(s);		
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			if (rs != null) try { rs.close(); } catch(Exception e) {}
		}
		
		DescriptionController prodDesc = new DescriptionController(p, spec);
		return prodDesc;
	}
	public ArrayList<ProductsController> getList(int userId, String type) {
		ArrayList<ProductsController> products = new ArrayList<>();
		System.out.println(userId + "api");
		ResultSet rs = null;
		String query = null;
		
		query = "SELECT p.product_id\r\n" + 
				" , p.product_category\r\n" + 
				" , p.product_name\r\n" + 
				" , p.brand_name\r\n" + 
				" , p.price\r\n" + 
				" , p.product_description \r\n" + 
				" , l.quantity \r\n" + 
				"FROM list l\r\n" + 
				"JOIN products p\r\n" + 
				"ON l.product_id = p.product_id\r\n" + 
				"WHERE userid = " + userId + "\r\n" + 
				"AND active = 'Y'\r\n" + 
				"AND type = '" + type + "'";
			
		DBConnection dbc = new DBConnection();
		rs = dbc.getResultSet(query);
		
		
		try {
			while (rs.next()) {
				ProductsController p = new ProductsController();
				p.setProduct_id(rs.getInt("product_id"));
				p.setProduct_category(rs.getString("product_category"));
				p.setProduct_name(rs.getString("product_name"));
				p.setBrand_name(rs.getString("brand_name"));
				p.setPrice(rs.getFloat("price"));
				p.setDescription(rs.getString("product_description"));
				p.setQty(rs.getInt("quantity"));
				products.add(p);	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			if (rs != null) try { rs.close(); } catch(Exception e) {}
		}
		
		return products;
		
	}
	public ArrayList<OrderController> getOrders(int userId){
		ArrayList<OrderController> orders = new ArrayList<>();
		
		ResultSet rs = null;
		String query = null;
		
		query = "SELECT order_id\r\n" + 
				" , userid\r\n" + 
				" , ISNULL(feedback, '') feedback\r\n" + 
				" , address_id\r\n" + 
				" , payment_method\r\n" + 
				" , order_date\r\n" + 
				" , status\r\n" + 
				"FROM orders o\r\n" + 
				"WHERE userid = " + userId + "\r\n" + 
				"ORDER BY order_date DESC, order_id";
			
		DBConnection dbc = new DBConnection();
		rs = dbc.getResultSet(query);
		
		
		try {
			while (rs.next()) {
				OrderController c = new OrderController();
				c.setOrderId(rs.getInt("order_id"));
				c.setUserId(rs.getInt("userId"));
				c.setFeedback(rs.getString("feedback"));
				c.setAddressId(rs.getInt("address_id"));
				c.setPaymentMethod(rs.getString("payment_method"));
				c.setStatus(rs.getString("status"));
				c.setOrdeDate(rs.getString("order_date"));
				orders.add(c);	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			if (rs != null) try { rs.close(); } catch(Exception e) {}
		}
		
		return orders;
	}
	public ArrayList<ProductsController> getOrderDetails(int userId, String orderId) {
		ArrayList<ProductsController> products = new ArrayList<>();
		System.out.println(userId + "api odeatails");
		ResultSet rs = null;
		String query = null;
		
		query = "SELECT p.product_id\r\n" + 
				" , p.product_category\r\n" + 
				" , p.product_name\r\n" + 
				" , p.brand_name\r\n" + 
				" , p.price\r\n" + 
				" , p.product_description \r\n" + 
				" , l.quantity \r\n" + 
				"FROM orders o\r\n" +
				"JOIN order_lines l\r\n" + 
				"ON o.order_id = l.order_id\r\n" + 
				"JOIN products p\r\n" + 
				"ON l.product_id = p.product_id\r\n" + 
				"WHERE o.userid = " + userId + "\r\n" +
				"AND o.order_id = '" + orderId + "'";
			
		DBConnection dbc = new DBConnection();
		rs = dbc.getResultSet(query);
		
		
		try {
			while (rs.next()) {
				ProductsController p = new ProductsController();
				p.setProduct_id(rs.getInt("product_id"));
				p.setProduct_category(rs.getString("product_category"));
				p.setProduct_name(rs.getString("product_name"));
				p.setBrand_name(rs.getString("brand_name"));
				p.setPrice(rs.getFloat("price"));
				p.setDescription(rs.getString("product_description"));
				p.setQty(rs.getInt("quantity"));
				products.add(p);	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			if (rs != null) try { rs.close(); } catch(Exception e) {}
		}
		
		return products;
		
	}
	public AddressController getAddress(int userId) {
		AddressController address = new AddressController();
		
		ResultSet rs = null;
		String query = null;
		
		query = "SELECT address_id\r\n" + 
				" , address_line_1\r\n" + 
				" , address_line_2\r\n" + 
				" , city\r\n" + 
				" , province\r\n" + 
				" , zip\r\n" + 
				"FROM address\r\n" + 
				"WHERE address_id = (SELECT address_id FROM users WHERE userid = " + userId + ")";
			
		DBConnection dbc = new DBConnection();
		rs = dbc.getResultSet(query);
		
		
		try {
			while (rs.next()) {
				address.setAddressId(rs.getInt("address_id"));
				address.setAddLine1(rs.getString("address_line_1"));
				address.setAddLine2(rs.getString("address_line_2"));
				address.setCity(rs.getString("city"));
				address.setProvince(rs.getString("province"));
				address.setZip(rs.getString("zip"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			if (rs != null) try { rs.close(); } catch(Exception e) {}
		}
		
		return address;
	}
}
