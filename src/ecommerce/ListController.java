package ecommerce;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListController extends HttpServlet{
	public void add(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String productId = (String)request.getSession().getAttribute("product");
		int userId = (Integer)request.getSession().getAttribute("userid");
		System.out.println("list" + userId + " " + productId);
		int result = 0;
		
		String listInsert = "MERGE list l \r\n" + 
				"USING (SELECT " + productId + " product_id, " + userId + " userid, '" + request.getParameter("listType") + "' type ) li \r\n" + 
				"ON (l.product_id = li.product_id\r\n" + 
				"AND l.userid = li.userid\r\n" + 
				"AND l.active = 'Y')\r\n" + 
				"WHEN MATCHED THEN \r\n" + 
				"UPDATE SET\r\n" + 
				"quantity = (CASE WHEN (l.type = li.type AND l.type = 'C') THEN (quantity + 1) ELSE 1 END),\r\n" + 
				"type = (CASE WHEN l.type = li.type THEN l.type ELSE 'C' END)\r\n" + 
				"WHEN NOT MATCHED THEN\r\n" + 
				"INSERT (\r\n" + 
				"userid,\r\n" + 
				"product_id,\r\n" + 
				"quantity,\r\n" + 
				"active,\r\n" + 
				"type\r\n" + 
				")\r\n" + 
				"VALUES (\r\n" + 
				" " + userId + ",\r\n" + 
				" " + productId + ",\r\n" + 
				" " + 1 + ",\r\n" + 
				" 'Y',\r\n" + 
				" '" + request.getParameter("listType") + "'\r\n" + 
				");";
		
		PrintWriter out = response.getWriter();
		if (listInsert != null) {
			DBConnection dbc = new DBConnection();
			result = dbc.dml(listInsert);
			if (result == 0) {
				System.out.println("error in merging list values" + listInsert);
				out.println("error in merging list values");
			}	
			else {
				out.println("Product added successfully.");
			}
			
		}		
	}
	public void remove(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String productId = request.getParameter("productId");
		int userId = (Integer)request.getSession().getAttribute("userid");
		System.out.println("list" + userId + " " + productId);
		int result = 0;
		
		String listDelete = "UPDATE list\r\n" + 
				"SET active = 'N'\r\n" + 
				"WHERE userid = " + userId + "\r\n" + 
				"AND active = 'Y'\r\n" + 
				"AND product_id = " + productId + ";" ;
		
		PrintWriter out = response.getWriter();
		if (listDelete != null) {
			DBConnection dbc = new DBConnection();
			result = dbc.dml(listDelete);
			if (result == 0) {
				System.out.println("error in removing list values");
				out.println("error in removing list values");
			}	
			else {
				out.println("Product removed successfully.");
			}
			
		}		
	}
	public void update(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String productId = request.getParameter("productId");
		int userId = (Integer)request.getSession().getAttribute("userid");
		String qty = request.getParameter("qty");
		String active = "Y";
		
		System.out.println("list" + userId + " " + productId);
		int result = 0;
		
		if(Integer.parseInt(qty) == 0) {
			active = "N";
		}
		
		String listUpdate = "UPDATE list\r\n" + 
				"SET quantity = " + qty + "\r\n" + 
				" , active = '" + active + "'\r\n" +
				"WHERE userid = " + userId + "\r\n" + 
				"AND type = 'C'\r\n" +
				"AND active = 'Y'\r\n" + 
				"AND product_id = " + productId + ";" ;
		
		PrintWriter out = response.getWriter();
		if (listUpdate != null) {
			DBConnection dbc = new DBConnection();
			result = dbc.dml(listUpdate);
			if (result == 0) {
				System.out.println("error in removing list values");
				out.println("error in removing list values");
			}	
			else {
				out.println("Product removed successfully.");
			}
			
		}		
	}
	public void transfer(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String productId = request.getParameter("productId");
		int userId = (Integer)request.getSession().getAttribute("userid");
		int result = 0;
		String query1 = "INSERT INTO list(\r\n" + 
				"userid,\r\n" + 
				"product_id,\r\n" + 
				"quantity,\r\n" + 
				"active,\r\n" + 
				"type\r\n" + 
				")\r\n" + 
				"VALUES (\r\n" + 
				" " + userId + ",\r\n" + 
				" " + productId + ",\r\n" + 
				" (SELECT quantity FROM list WHERE product_id = " + productId + " AND userid = " + userId + " AND active = 'Y'),\r\n" + 
				" 'Y',\r\n" + 
				" 'C'\r\n" + 
				");";
		String query2 = "UPDATE list\r\n" + 
				"SET active = 'N'\r\n" + 
				"WHERE userid = " + userId + "\r\n" + 
				"AND active = 'Y'\r\n" + 
				"AND type = 'W'\r\n" +
				"AND product_id = " + productId + ";" ;
		
		PrintWriter out = response.getWriter();
		if (query1 != null) {
			DBConnection dbc = new DBConnection();
			result = dbc.dml(query1);
			if (result == 0) {
				System.out.println("error in adding list values on conversion");
				out.println("error in adding list values on conversion");
			}	
			else {
				if (query2 != null) {
					result = dbc.dml(query2);
					if (result == 0) {
						System.out.println("error in removing list values on conversion");
						out.println("error in removing list values on conversion");
					}	
					else {
						out.println("Wishlisted product converted successfully.");
					}
					
				}
			}
			
		}		
	}
	public void placeOrder(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int userId = (Integer)request.getSession().getAttribute("userid");
		int result = 0;
		
		UUID uuid = UUID.randomUUID();
        String randomUUIDString = uuid.toString();
        
		String query1 = "INSERT INTO orders(\r\n" + 
				"	userid,\r\n" + 
				"	status,\r\n" + 
				"	address_id,\r\n" + 
				"	payment_method,\r\n" + 
				"	order_date,\r\n" + 
				"	uuid\r\n" + 
				") VALUES (\r\n" + 
				"	" + userId + ",\r\n" + 
				"	'Order Placed',\r\n" + 
				"	(SELECT address_id FROM users WHERE userid = " + userId + "),\r\n" + 
				"	'Credit',\r\n" + 
				"	CONVERT(VARCHAR(10), getdate(), 111),\r\n" + 
				"	'" + randomUUIDString + "'\r\n" + 
				");";
		String query2 = "INSERT INTO order_lines(\r\n" + 
				"	product_id,\r\n" + 
				"	quantity,\r\n" + 
				"	order_id,\r\n" + 
				"	unit_price\r\n" + 
				")\r\n" + 
				"SELECT l.product_id,\r\n" + 
				"	l.quantity,\r\n" + 
				"	(SELECT order_id FROM orders WHERE uuid = '" + randomUUIDString + "'),\r\n" + 
				"	(SELECT price FROM products WHERE product_id = l.product_id)\r\n" + 
				"FROM list l\r\n" + 
				"WHERE l.userid = " + userId + "\r\n" + 
				"AND l.type = 'C'\r\n" + 
				"AND l.active = 'Y';" ;
		String query3 = "UPDATE list\r\n" + 
				"SET active = 'N'\r\n" + 
				"WHERE type = 'C'\r\n" + 
				"AND active = 'Y'\r\n" + 
				"AND userid = " + userId + ";";
		
		PrintWriter out = response.getWriter();
		if (query1 != null) {
			DBConnection dbc = new DBConnection();
			result = dbc.dml(query1);
			if (result == 0) {
				System.out.println("error in adding order");
				out.println("error in adding order");
			}	
			else {
				if (query2 != null) {
					result = dbc.dml(query2);
					if (result == 0) {
						System.out.println("error in adding order lines");
						out.println("error in adding order lines");
					}	
					else {
						if (query3 != null) {
							result = dbc.dml(query3);
							if (result == 0) {
								System.out.println("error in clearing cart");
								out.println("error in clearing cart");
							}	
							else {
								out.println("Order placed successfully.");
							}
							
						}
					}
					
				}
			}
			
		}		
	}
}