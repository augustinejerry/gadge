package ecommerce;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ActionServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;

	public ActionServlet() {
		
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String servletName = request.getParameter("servletName");
		
		if(servletName.equals("login")) {
			System.out.println("helo");
			LoginController l = new LoginController();
			l.login(request, response);
		}
		else if(servletName.equals("category")) {
			CategoryController c = new CategoryController();
			c.categorySetter(request, response);
		}
		else if(servletName.equals("products")) {
			ProductsController p = new ProductsController();
			p.productSetter(request, response);
		}
		else if(servletName.equals("productdesc")) {
			ListController l = new ListController();
			l.add(request, response);
		}
		else if(servletName.equals("remove")) {
			ListController l = new ListController();
			l.remove(request, response);
		}
		else if(servletName.equals("update")) {
			ListController l = new ListController();
			l.update(request, response);
		}
		else if(servletName.equals("addtocart")) {
			ListController l = new ListController();
			l.transfer(request, response);
		}
		else if(servletName.equals("placeorder")) {
			ListController l = new ListController();
			l.placeOrder(request, response);
		}
		else if(servletName.equals("orderdetails")) {
			OrderController o = new OrderController();
			o.orderSetter(request, response);
		}
		else if(servletName.equals("feedback")) {
			OrderController o = new OrderController();
			o.feedbackSetter(request, response);
		}
		
	}
}