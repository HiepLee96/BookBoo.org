package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Books;
import java.util.*;

import context.DatabaseContext;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/SaveCartToDatabase")
public class SaveCartToDatabaseServlet extends HttpServlet {
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			processRequest(request, response);
		} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		response.setContentType("text/html;character=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		//Bien kiem tra xem cau lenh thuc thi truy van co duoc hoan thanh khong
		int affectedRows01 = 0, affectedRows02 = 0;
		
		int lastInsertedID = -1;
		
		try {			
			//Lay du lieu tu form nguoi dung nhap vao
			String address = request.getParameter("inputAddress");
			String name = request.getParameter("inputName");
			String phoneNumber = request.getParameter("inputPhoneNumber");
			String expiration = request.getParameter("inputExp");
			String cardNumber = request.getParameter("inputCardNumber");
			String cvv = request.getParameter("inputCvv");
			String dicountCode = request.getParameter("inputDiscountCode");
			
			Cart c = (Cart)request.getSession().getAttribute("cart");
			List<Books> bookList;
			if(c != null) {
				bookList = c.getItems();
				
				//Get connetion to database
				DatabaseContext DC = new DatabaseContext();
				Connection conn = DC.connect();
				
				
				//Insert order details data to database
				String mySQLquery02 = "INSERT INTO bookboo_csdl.orders_detail(userName, phoneNumber, address, discountCode, cardNumber, expiration, cvv) VALUES(?, ?, ?, ?, ?, ?, ?);";
				PreparedStatement st02 = conn.prepareStatement(mySQLquery02, Statement.RETURN_GENERATED_KEYS);
				st02.setString(1, name);
				st02.setString(2, phoneNumber);
				st02.setString(3, address);
				st02.setString(4, dicountCode);
				st02.setString(5, cardNumber);
				st02.setString(6, expiration);
				st02.setString(7, cvv);
				affectedRows02 = st02.executeUpdate();
				if(affectedRows02 == 0) {	//Neu truy van khong thanh cong thi in ra loi
					throw new SQLException("Creating user failed, no rows affected."); 
				}
				ResultSet rs = st02.getGeneratedKeys();
				while(rs.next()) {
					lastInsertedID = rs.getInt(1);
				}
				
				//insert orders data into database
				String mySQLquery01 = "INSERT INTO bookboo_csdl.orders(order_id, book_id, bookPrice, bookAmount) VALUES (?, ?, ?, ?);";
				PreparedStatement st01 = conn.prepareStatement(mySQLquery01);
				for(int i = 0; i < bookList.size(); i++) {
					st01.setInt(1, lastInsertedID);
					st01.setString(2, bookList.get(i).getID());
					st01.setFloat(3, bookList.get(i).getPromo_price());
					st01.setInt(4, bookList.get(i).getNumberInCart());
					affectedRows01 = st01.executeUpdate();
					if(affectedRows01 == 0) {	//Neu truy van khong thanh cong thi in ra loi
						throw new SQLException("Creating user failed, no rows affected."); 
					}
				}
				
				
				if(affectedRows01 != 0 && affectedRows02 != 0) {	//Neu truy van thanh cong 2 lenh thi xoa du lieu trong cart
					session.setAttribute("cart", null);
				}
				st01.close();
				st02.close();
				conn.close();
				out.print("Your order are delivering!");
			} else {
				out.print("cart is null");
			}
			
			
			
		} catch (NullPointerException e) {
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
	}
}
