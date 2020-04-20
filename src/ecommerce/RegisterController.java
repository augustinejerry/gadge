package ecommerce;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterController extends HttpServlet{
	public void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String usernameTyped = request.getParameter("email");
		String passwordTyped = request.getParameter("password");
		String fnameTyped = request.getParameter("fname");
		String lnameTyped = request.getParameter("lname");
		String dobTyped = request.getParameter("dob");
		String phoneTyped = request.getParameter("phone");
		String add1Typed = request.getParameter("add1");
		String add2Typed = request.getParameter("add2");
		String cityTyped = request.getParameter("city");
		String provinceTyped = request.getParameter("province");
		String zipTyped = request.getParameter("zip");

		int result = 0;
		
		String userInsert = "INSERT INTO users (\r\n" + 
				" fname,\r\n" + 
				" lname,\r\n" + 
				" email,\r\n" + 
				" password,\r\n" + 
				" dob,\r\n" + 
				" phone\r\n" + 
				" )\r\n" + 
				"VALUES (\r\n" + 
				" '" + fnameTyped + "',\r\n" + 
				" '" + lnameTyped + "',\r\n" + 
				" '" + usernameTyped + "',\r\n" + 
				" '" + passwordTyped + "',\r\n" + 
				" '" + dobTyped + "',\r\n" + 
				" " + phoneTyped + "\r\n" + 
				");";
		
		String addressInsert = "INSERT INTO address(\r\n" + 
				"userid,\r\n" + 
				"address_line_1,\r\n" + 
				"address_line_2,\r\n" + 
				"city,\r\n" + 
				"province,\r\n" + 
				"zip)\r\n" + 
				"VALUES (\r\n" + 
				" (SELECT userid FROM users WHERE email = '" + usernameTyped + "'),\r\n" + 
				" '" + add1Typed + "',\r\n" + 
				" '" + add2Typed + "',\r\n" + 
				" '" + cityTyped + "',\r\n" + 
				" '" + provinceTyped + "',\r\n" + 
				" '" + zipTyped + "'\r\n" + 
				");";
		if (userInsert != null) {
			DBConnection dbc = new DBConnection();
			result = dbc.dml(userInsert);
			if (result == 0) {
				System.out.println("error in inserting user values");
			}
			if (addressInsert != null) {
				result = dbc.dml(addressInsert);
				if (result == 0) {
					System.out.println("error in inserting address values");
				}
			}	
			response.sendRedirect("newuserlogin.jsp");
		}		
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		login(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		login(request, response);
	}
}