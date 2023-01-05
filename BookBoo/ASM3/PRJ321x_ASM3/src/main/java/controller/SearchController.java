package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Books;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.ListBookDAO;

@WebServlet("/searchServlet")
public class SearchController extends HttpServlet {
	
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
		try {
			processRequest(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();		
		
		//Huy cac du lieu dang ton tai trong session
		request.getSession().invalidate();
		HttpSession session = request.getSession();
		

			//Get input string from search box header.jsp
			String inputString = request.getParameter("search-box");
			if(inputString.length() == 0) {
				request.getRequestDispatcher("index.jsp").forward(request, response);
			} else {
				List<Books> booksList = new ListBookDAO().search(inputString);
				
				session.setAttribute("resultBooks", booksList);
				//3. Su dung EL de luu tru du lieu nhap vao tren search form
				Map<String, String> map = new HashMap<>();
				map.put("searched-words", inputString);
				request.setAttribute("map1", map);
					
				request.getRequestDispatcher("searchResultPage.jsp").forward(request, response);
			}
			
	}

}
