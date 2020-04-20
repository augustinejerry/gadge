package ecommerce;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LoginController extends HttpServlet{
	public void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String usernameTyped = request.getParameter("username");
		String  passwordTyped = request.getParameter("password");
		String passwordSaved = null;
		Boolean userExists = false;
		int userIdSaved = 0;
		
		
		
		
		ResultSet rs = null;
		
		DBConnection dbc = new DBConnection();
		rs = dbc.getResultSet("SELECT password, userid FROM users WHERE email = '" + usernameTyped + "'");
		
		
		try {
			while (rs.next()) {
				userExists = true;
				passwordSaved = rs.getString(1);
				userIdSaved = Integer.parseInt(rs.getString(2));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			if (rs != null) try { rs.close(); } catch(Exception e) {}
		}
		PrintWriter out = response.getWriter();
		if (userExists && passwordSaved.equals(passwordTyped)) {
			request.getSession().setAttribute("userid", userIdSaved);
		}
		else {
		    out.println("Invalid username or password.");
		    
		}
		out.close();
	}
}
