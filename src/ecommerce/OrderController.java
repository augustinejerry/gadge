package ecommerce;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrderController {
	int orderId;
	int userId;
	String feedback;
	int addressId;
	String paymentMethod;
	String status;
	String orderDate;
	
	public String getOrdeDate() {
		return orderDate;
	}
	public void setOrdeDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void orderSetter(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String category = request.getParameter("orderId");
		
		request.getSession().setAttribute("orderId", category);
		
	}
	
	public void feedbackSetter(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String orderId = request.getParameter("orderId");
		String feedback = request.getParameter("feedback");
		
		int result = 0;
		
		
		
		String feedbackUpdate = "UPDATE orders\r\n" + 
				"SET feedback = '" + feedback + "'\r\n" + 
				
				"WHERE order_id = " + orderId + ";" ;
		
		PrintWriter out = response.getWriter();
		if (feedbackUpdate != null) {
			DBConnection dbc = new DBConnection();
			result = dbc.dml(feedbackUpdate);
			if (result == 0) {
				out.println("error in saving feedback");
			}	
			else {
				out.println("feedback saved successfully.");
			}
			
		}
		
	}
}
