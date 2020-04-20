package ecommerce;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CategoryController extends HttpServlet{
	public void categorySetter(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String category = request.getParameter("categoryName");
		
		request.getSession().setAttribute("category", category);
		
	}
}