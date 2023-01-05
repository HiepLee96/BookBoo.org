package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Books;
import model.Cart;

import java.io.IOException;

import dao.ListBookDAO;


public class AddToController extends HttpServlet {
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html:charset=UTF-8");
		try {
			HttpSession session = request.getSession();
			String idd = request.getParameter("bookID");
			String action = request.getParameter("action");
			if(session.getAttribute("cart") == null) {							//Neu khong co doi tuong cart dang ton tai trong sesison thi tao them  doi tuong moi
				session.setAttribute("cart", new Cart());
			}
			Cart c = (Cart)session.getAttribute("cart");
			if(action != null && action.equalsIgnoreCase("add")) {				//Yeu cau them sach vao gcart tu user
				Books b = new ListBookDAO().getBooks(idd);						//Lay gia tri sach tu CSDL
				c.add(b);														//Them sach vao cart
			} else if (action != null && action.equalsIgnoreCase("delete")) {	//Yeu cau xoa sach khoi cart tu user
				c.remove(idd);
			}
			
			response.sendRedirect("cart.jsp");
		} catch(Exception ex) {
			response.getWriter().println(ex);
		}
	}

}
