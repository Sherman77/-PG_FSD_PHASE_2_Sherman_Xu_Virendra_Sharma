package FlyAwayApp;
import FlyAwayApp.AdminUser;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	
	public static AdminUser user = new AdminUser();
	
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AdminLogin() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		
		if (request.getParameter("newPassword") == null) {
			//Handles login request
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			if (this.user.getEmail().equals(email) && this.user.getPassword().equals(password)) {
				out.println("Success");
				response.sendRedirect("welcome.jsp");
			}
			else {
				out.println("Login failed. Please try again");
				out.println("<br>");
				out.println("<a href=\"index.html\">Back</a>");
			}
		}
		else {
			//Handles change password request
			String newPassword = request.getParameter("newPassword");
			this.user.setPassword(newPassword);
			out.println("Password changed successfully");
			out.println("<br>");
			out.println("<a href=\"index.html\">Back</a>");
		}
		out.close();
	}

}
