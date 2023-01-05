package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

import org.apache.tomcat.util.file.Matcher;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);

	}
	
	

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;character=UTF-8");
		request.setCharacterEncoding("UTF-8");

		try {
			request.getSession().invalidate();

			String regexMail = "^[a-zA-Z][\\w-]+@([\\w]+\\.[\\w]+|[\\w]+\\.[\\w]{2,}\\.[\\w]{2,})$";
			String regex = "[a-zA-Z0-9_!@#$%^&*]+";
			// Collect data from login.jsp's form
			String user = request.getParameter("username");
			String password = request.getParameter("password");
			Account acc = new Account();
			acc.setUser(user);
			acc.setPassword(password);
			HttpSession session = request.getSession(true);
			
			if (Pattern.matches(regexMail, user) == false) {
				session.setAttribute("error", "invalid email syntax");
				response.sendRedirect("login.jsp");
			} else if (Pattern.matches(regex, password) == false) {
				session.setAttribute("error", "invalid password syntax");
				response.sendRedirect("login.jsp");
			} else {
				// read data of account in web.xml
				String uid = getServletContext().getInitParameter("username");
				String pwd = getServletContext().getInitParameter("password");

				PrintWriter out = response.getWriter();
				
				// Check account
				if (user != null && acc.getPassword().equals(pwd) && acc.getUser().equalsIgnoreCase(uid)) {
					// Save username into session
					session.setAttribute("user", user);		
					
					// Set Cookies
					Cookie userNameCookie = new Cookie("userNameCookie", user);
					Cookie userPasswordCookie = new	Cookie("userPasswordCookie", password);
					
					if(request.getParameter("remember-me") != null) { 
						userNameCookie.setMaxAge(60 * 60 *24);
						userPasswordCookie.setMaxAge(60 * 60 *24); 
						
						session.setAttribute("rememberMeStatus", "true");
					} else {
						userNameCookie.setMaxAge(0);
						userPasswordCookie.setMaxAge(0); 
						
						session.setAttribute("rememberMeStatus", "false");
					}
					response.addCookie(userNameCookie);
					response.addCookie(userPasswordCookie); 

					// Login is valid, redirect to admin page
					response.sendRedirect("admin-page/admin.jsp");
				} else {
					session.setAttribute("error", "Wrong usename or password");
					response.sendRedirect("login.jsp");
				}
			}
			
			
		} catch (NullPointerException e) {
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		} catch (Exception ex) {
			response.getWriter().println(ex);
		}

	}

}
